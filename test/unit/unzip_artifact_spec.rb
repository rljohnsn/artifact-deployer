require_relative 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(log_level: :info) do |node|
      node.set['artifacts']['junit_unzip']['enabled'] = true
      node.set['artifacts']['junit_unzip']['groupId'] = "junit"
      node.set['artifacts']['junit_unzip']['artifactId'] = "junit"
      node.set['artifacts']['junit_unzip']['version'] = "4.11"
      node.set['artifacts']['junit_unzip']['destination'] = "/opt/test"
      node.set['artifacts']['junit_unzip']['owner'] = "root"
      node.set['artifacts']['junit_unzip']['unzip'] = true
      node.set['artifact-deployer']['install_awscli'] = false
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

  it 'unzipping junit' do
    expect(chef_run).to run_execute 'unzipping-package-junit_unzip'
  end
end
