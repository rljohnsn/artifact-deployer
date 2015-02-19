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

    stub_command(start_with("test -f")).and_return(true)
  end

  it 'create alfresco.jar file' do
    expect(chef_run).to run_execute 'copying-package-alfresco.jar'
  end
end
