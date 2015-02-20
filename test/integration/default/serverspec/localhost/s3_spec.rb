require_relative 'default_spec'

describe file('/home/vagrant/s3bucket') do
  it { should be_directory  }
end

describe file('/home/vagrant/s3file') do
  it { should be_directory  }
end

describe file('/home/vagrant/s3file/keep-calm-and-daje-forte.png') do
  it { should be_file  }
end
