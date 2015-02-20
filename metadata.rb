name              "artifact-deployer"
maintainer        "Maurizio Pillitu"
maintainer_email  "maurizio@session.it"
license           "Apache 2.0"
description       "A Chef Cookbook that provides a simple way to download, unpack and configure artifacts"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.7.5"

depends "maven"
depends "file"
depends "python"

recipe 'default', 'Invokes all other recipes'
recipe 'maven', 'Installs Apache Maven'
recipe 'awscli', 'Installs Python awscli util'
recipe 'artifacts', 'Installs artifacts'
recipe 'route53', 'Installs Maven artifacts'
recipe 'jvm_host', 'Adds -Dhost=#{node[:hostname]}.#{node[:rdomain]} to the JVM opts, appending it to a configurable file location'
