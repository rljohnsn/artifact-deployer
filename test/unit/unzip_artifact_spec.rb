require 'spec_helper'

describe 'artifact-deployer::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(log_level: :info) do |node|
      node.set['artifacts']['junit_unzip']['enabled'] = true
      node.set['artifacts']['junit_unzip']['groupId'] = "junit"
      node.set['artifacts']['junit_unzip']['artifactId'] = "junit"
      node.set['artifacts']['junit_unzip']['version'] = "4.11"
      node.set['artifacts']['junit_unzip']['destination'] = "/opt/test"
      node.set['artifacts']['junit_unzip']['owner'] = "root"
      node.set['artifacts']['junit_unzip']['unzip'] = true
    end.converge(described_recipe)
  end

  before do
    stub_command(start_with("test -f")).and_return(true)
  end

  it 'unzipping junit' do
    expect(chef_run).to run_execute 'unzipping-package-junit_unzip'
  end
end
