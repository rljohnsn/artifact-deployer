require 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['artifacts']['junit']['enabled'] = true
      node.set['artifacts']['junit']['groupId'] = "junit"
      node.set['artifacts']['junit']['artifactId'] = "junit"
      node.set['artifacts']['junit']['version'] = "4.11"
      node.set['artifacts']['junit']['destination'] = "/home/vagrant/default_suite"
      node.set['artifacts']['junit']['owner'] = "root"
    end.converge(described_recipe)
  end

  before do
    stub_data_bag('maven_repos').and_return(['alfresco'])
    stub_data_bag_item('alfresco', 'id').and_return("public")
    stub_data_bag_item('alfresco', 'url').and_return("https://artifacts.alfresco.com/nexus/content/groups/public")
    stub_data_bag_item('alfresco', 'username').and_return("")
    stub_data_bag_item('alfresco', 'password').and_return("")

    stub_command(start_with("test -f")).and_return(true)
  end

  # it 'fetch junit.jar mvn artifact' do
  #   expect(chef_run).to put_maven 'junit'
  # end

  it 'create junit.jar file' do
    expect(chef_run).to run_execute 'copying-package-junit.jar'
  end

  it 'create mvn settings' do
    expect(chef_run).to delete_file '/usr/local/maven/conf/settings.xml'
  end

  it 'create mvn settings' do
    expect(chef_run).to create_directory 'fix-permissions-/home/vagrant/default_suite'
  end

end
