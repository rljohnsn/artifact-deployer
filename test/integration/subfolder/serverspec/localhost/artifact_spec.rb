require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe file('/home/vagrant/subfolder_suite/junit') do
  it { should be_directory  }
end

describe file('/home/vagrant/subfolder_suite/junit/org') do
  it { should_not be_file }
  it { should_not be_directory }
end
