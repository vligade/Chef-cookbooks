#
# Cookbook Name:: nginx_tata
# Recipe:: configure
#
# Copyright (c) 2016 Prateek Malik, All Rights Reserved.

cookbook_file "/etc/nginx/sites-available/default" do
  source "default"
  mode "0644"
end
