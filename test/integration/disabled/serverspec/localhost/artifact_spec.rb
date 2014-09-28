require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe file('ls /home/vagrant/disabled_suite') do
  it { should_not exist }
end
