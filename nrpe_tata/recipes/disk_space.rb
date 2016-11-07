#
# Cookbook Name:: fen-nrpe
# Recipe:: disk_alert.rb
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'fen-nrpe::default'
nrpe_check "check_disk" do
  command "#{node['nrpe']['plugin_dir']}/check_disk"
  parameters '--exclude-type=nfs4'
  warning_condition '15%'
  critical_condition '10%'
  action :add
notifies :restart, "service[nrpe_service]"
end
