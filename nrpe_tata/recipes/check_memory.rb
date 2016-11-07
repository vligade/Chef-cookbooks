#
# Cookbook Name:: fen-nrpe
# Recipe:: check_memory
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-nrpe::default'

cookbook_file "check_mem" do
 path case node[:platform]
 when "amazon","centos","redhat","fedora"
 "/usr/lib64/nagios/plugins/check_mem"
 else
 "/usr/lib/nagios/plugins/check_mem"
 end
  source 'check_mem'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
nrpe_check "check_memory" do
 command "#{node['nrpe']['plugin_dir']}/check_mem"
 warning_condition '80'
 critical_condition '90'
 parameters '-u -C'
 action :add
notifies :restart, "service[nrpe_service]"
end
