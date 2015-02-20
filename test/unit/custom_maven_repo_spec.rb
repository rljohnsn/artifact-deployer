require_relative 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['artifacts']['alfresco']['enabled'] = true
      node.set['artifacts']['alfresco']['groupId'] = "org.alfresco"
      node.set['artifacts']['alfresco']['artifactId'] = "alfresco-core"
      node.set['artifacts']['alfresco']['version'] = "5.0.a"
      node.set['artifacts']['alfresco']['destination'] = "/opt/test"
      node.set['artifacts']['alfresco']['owner'] = "root"
      node.set['artifacts']['alfresco']['timeout'] = 1000
    end.converge(described_recipe)
  end

  before do

    stub_data_bag('maven_repos').and_return(['alfresco'])
    stub_data_bag_item('maven_repos','alfresco').and_return({
      'id' => 'alfresco',
      'url' => 'https://artifacts.alfresco.com/nexus/content/groups/public',
      'username' => '',
      'password' => ''
    })

    stub_data_bag('my-databag').and_return(['my-databag-item'])
    stub_data_bag_item('awscli','credentials').and_return({
      "id" => "credentials",
      "aws_access_key_id" => "test",
      "aws_secret_access_key" => "test"
    })

    stub_command(start_with("test -f")).and_return(true)
    stub_command("pip list | grep awscli").and_return('')
  end

  it 'create alfresco.jar file' do
    expect(chef_run).to run_execute 'copying-package-alfresco.jar'
  end
end
