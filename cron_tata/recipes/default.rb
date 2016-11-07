#
# Cookbook Name:: cron_tata
# Recipe:: default
#
# Copyright 2016, Prateek Malik
#
# All rights reserved - Do Not Redistribute
#

service "cron" do
    action :start
end

cookbook_file "/root/nginx_monitoring.sh" do
  source "nginx_monitoring.sh"
  owner "root"
  group "root"
  mode 0644
  action :create_if_missing
end

cron 'cron_nagios' do
  minute '*'
  hour '*'
  day '*'
  month '*'
  weekday '*'
  command "bash /root/nginx_monitoring.sh"
  action [:create]
end

cron 'cron_cacheclear' do
  minute '5'
  hour '*'
  day '*'
  month '*'
  weekday '*'
  command "sync; sudo echo 3 > /proc/sys/vm/drop_caches"
  action [:create]
end
