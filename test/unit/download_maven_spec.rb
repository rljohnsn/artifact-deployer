require 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['artifacts']['junit']['enabled'] = true
      node.set['artifacts']['junit']['groupId'] = "junit"
      node.set['artifacts']['junit']['artifactId'] = "junit"
      node.set['artifacts']['junit']['version'] = "4.11"
      node.set['artifacts']['junit']['destination'] = "/opt/test"
      node.set['artifacts']['junit']['owner'] = "root"
    end.converge(described_recipe)
  end

  before do
    stub_command(start_with("test -f")).and_return(true)
  end

  it 'create junit.jar file' do
    expect(chef_run).to run_execute 'copying-package-junit.jar'
  end

  it 'create mvn settings' do
    expect(chef_run).to delete_file '/usr/local/maven/conf/settings.xml'
  end

  it 'fix parent folder permissions' do
    expect(chef_run).to create_directory 'fix-permissions-/opt/test'
  end
end
