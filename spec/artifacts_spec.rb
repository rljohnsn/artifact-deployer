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

  it 'create junit.jar file' do
    expect(chef_run).to create_file '/home/vagrant/default_suite/junit.jar'
  end
end
