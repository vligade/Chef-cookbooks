#
# Cookbook Name:: fen-nrpe
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '0.0.0.0'
node.override['nrpe']['dont_blame_nrpe'] = '1'
node.override['nrpe']['allowed_hosts'] = `%w{127.0.0.1 10.0.0.60}`
node.override['nrpe']['log_facility'] = 'daemon'

bash "insert_line" do
  user "root"
  code <<-EOS
  sed -i '/allowed_hosts=127\.0\.0\.1/d' /etc/nagios/nrpe.cfg
  echo "allowed_hosts=127.0.0.1, 10.0.0.60, 52.87.11.201" >> /etc/nagios/nrpe.cfg
EOS
end

service "nrpe_service" do
  case node[:platform]
  when "amazon","centos","redhat","fedora"
    service_name "nrpe"
  else
    service_name "nagios-nrpe-server"
  end
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
