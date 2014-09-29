require 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['artifacts']['junit_disabled']['enabled'] = false
      node.set['artifacts']['junit_disabled']['groupId'] = "junit"
      node.set['artifacts']['junit_disabled']['artifactId'] = "junit"
      node.set['artifacts']['junit_disabled']['version'] = "4.11"
      node.set['artifacts']['junit_disabled']['destination'] = "/opt/test"
      node.set['artifacts']['junit_disabled']['owner'] = "root"
    end.converge(described_recipe)
  end

  before do
    stub_command(start_with("test -f")).and_return(true)
  end

  it 'skip junit_disabled.jar file' do
    expect(chef_run).to_not run_execute 'copying-package-junit_disabled.jar'
  end
end
