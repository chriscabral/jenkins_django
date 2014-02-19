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

jenkins_plugin 'git-client' do
  version '1.3'
end