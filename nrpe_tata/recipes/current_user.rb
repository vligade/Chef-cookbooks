#
# Cookbook Name:: fen-nrpe
# Recipe:: check_users
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'fen-nrpe::default'
nrpe_check "check_users" do
  command "#{node['nrpe']['plugin_dir']}/check_users"
  warning_condition '20'
  critical_condition '50'
  action :add
notifies :restart, "service[nrpe_service]"
end
