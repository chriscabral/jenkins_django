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

jenkins_plugin 'ssh-credentials' do
  version '1.5.1'
end

jenkins_plugin 'scm-api' do
  version '0.1'
end

jenkins_plugin 'credentials' do
  version '1.9.3'
end

jenkins_plugin 'multiple-scms' do
  version '0.3'
end

jenkins_plugin 'parameterized-trigger' do
  version '2.0.1'
end

jenkins_plugin 'git-client' do
  version '1.6.0'
end

jenkins_plugin 'git' do
  version '2.0.1'
end

jenkins_command 'safe-restart'
