#
# Cookbook Name:: fen-nrpe
# Recipe:: load_average.rb
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'fen-nrpe::default'
nrpe_check "check_load" do
  command "#{node['nrpe']['plugin_dir']}/check_load"
  warning_condition '4'
  critical_condition '8'
  action :add
notifies :restart, "service[nrpe_service]"
end
