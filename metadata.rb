name              "artifact-deployer"
maintainer        "Maurizio Pillitu"
maintainer_email  "maurizio@session.it"
license           "Apache 2.0"
description       "A Chef Cookbook that provides a simple way to download, unpack and configure artifacts"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.8.5"

supports          "ubuntu-12.04"
supports          "centos-6.6"
supports          "centos-7"

depends "maven"
depends "file"
depends "python"

recipe 'default', 'Invokes all other recipes'
recipe 'maven', 'Installs Apache Maven'
recipe 'awscli', 'Installs Python awscli util'
recipe 'artifacts', 'Installs artifacts'
