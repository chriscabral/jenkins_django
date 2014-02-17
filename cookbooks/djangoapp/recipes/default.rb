#
# Cookbook Name:: djangoapp
# Recipe:: default
#
# Copyright 2014, Chris Cabral
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jenkins::master'
include_recipe 'mysql::server_debian'
include_recipe 'mysql::client'
include_recipe 'database'
include_recipe 'python'
include_recipe 'git'