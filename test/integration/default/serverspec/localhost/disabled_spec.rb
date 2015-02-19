require_relative 'default_spec'

describe file('/home/vagrant/disabled_suite') do
  it { should_not be_file }
  it { should_not be_directory }
end
