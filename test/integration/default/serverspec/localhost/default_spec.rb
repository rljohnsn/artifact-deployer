require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe file('/home/vagrant/default_suite/junit1.jar') do
  it { should be_file  }
end
