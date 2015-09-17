name              "artifact-deployer"
maintainer        "Maurizio Pillitu"
maintainer_email  "maurizio@session.it"
license           "Apache 2.0"
description       "A Chef Cookbook that provides a simple way to download, unpack and configure artifacts"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.8.12"

supports          "ubuntu-12.04"
supports          "centos-6.6"
supports          "centos-7"

# Resolved by Berkshelf, not present in Supermarket or forked
depends "maven"
depends "file"

# Community cookbooks
depends "python"
depends "apt"
# depends 'apt', '~> 2.3.10'
depends "ark"
depends "resolver"
depends "java"

#recipe 'artifacts', 'Installs artifacts'
#recipe 'awscli', 'Installs Python awscli util'
#recipe 'default', 'Invokes all other recipes'
#recipe 'maven', 'Installs Apache Maven'
