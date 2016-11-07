#
# Cookbook Name:: fail2ban_tata
# Recipe:: default
#
# Copyright 2016, Prateek Malik
#
# All rights reserved - Do Not Redistribute
#
include_recipe "fail2ban"
include_recipe "fail2ban_tata::configure"
node.override['fail2ban']['email'] = 'aws-tatasky-stb@intelligrape.com'

