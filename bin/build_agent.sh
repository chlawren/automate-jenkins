#!/usr/bin/env bash

if puppet --version 2>/dev/null; then
 echo “Puppet installed, nothing to do”
 exit 0
fi

# Install Puppet Master
sudo rpm -ivh http://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm && sudo yum install puppet-agent -y

# Configure Hosts

sudo echo "# Host config Puppet Master " >> /etc/hosts
sudo echo "172.35.1.100 	puppetmaster.home	puppetmaster	puppet" >> /etc/hosts
sudo echo "172.35.1.101	jenkins.home	jenkins" >> /etc/hosts

# setup puppet.conf

#sudo cp /vagrant/config/puppet.conf /etc/puppetlabs/puppet

# execute puppet agent to register with master

#/opt/puppetlabs/bin/puppet agent -t

# deploy puppet code

sudo /vagrant/bin/papply
