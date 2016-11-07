#
# Cookbook Name:: fen-nrpe
# Recipe:: total_process
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'fen-nrpe::default'
nrpe_check "check_total_procs" do
  command "#{node['nrpe']['plugin_dir']}/check_procs"
  warning_condition '500'
  critical_condition '700'
  action :add
notifies :restart, "service[nrpe_service]"
end
