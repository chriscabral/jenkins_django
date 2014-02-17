#
# Cookbook Name:: djangoapp
# Recipe:: default
#
# Copyright 2014, Chris Cabral
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jenkins'
include_recipe 'database'
include_recipe 'mysql::server'
include_recipe 'mysql::client'
include_recipe 'python'
include_recipe 'git'