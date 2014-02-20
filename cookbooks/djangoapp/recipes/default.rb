#
# Cookbook Name:: djangoapp
# Recipe:: default
#
# Copyright 2014, Chris Cabral
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nmap'
include_recipe 'curl'
include_recipe 'jenkins::master'
include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'database'
include_recipe 'database::mysql'
include_recipe 'python'
include_recipe 'git'

mysql_database 'myschedule' do
  connection(
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  action :create
end

jenkins_plugins = {
  'ssh-credentials' => '1.5.1', 
  'scm-api' => '0.1',
  'credentials' => '1.9.3',
  'multiple-scms' => '0.3',
  'git-client' => '1.6.0',
  'git' => '2.0.1',
}

jenkins_plugins.each{|key, value| 
  jenkins_plugin key do
    version value
  end
}

jenkins_command 'safe-restart'

package 'build-essential'
package 'gcc'
package 'g++'
package 'libpcre3'
package 'libpcre3-dev'
package 'libssl-dev'
package 'python-dev'

user "developer" do
  supports :manage_home => true
  uid 1234
  gid "developer"
  home "/home/developer"
  shell "/bin/bash"
  password "$1$3WfMmIJB$C64eMimUsCaJzDL4zMn8Z/"
end


python_virtualenv "/home/vagrant/venv" do
  owner "developer"
  group "developer"
  action :create
end


