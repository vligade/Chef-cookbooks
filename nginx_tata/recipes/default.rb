#
# Cookbook Name:: nginx_tata
# Recipe:: default
#
# Copyright 2016, Prateek Malik
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "nginx_tata::configure"
node.override['nginx']['worker_connections'] = 768
node.override['nginx']['worker_processes'] = 4

