#
# Cookbook Name:: codedeploy-agent-tata
# Recipe:: install
#
# Copyright (c) 2016 Prateek Malik, All Rights Reserved.

%w{ python-pip ruby2.0 wget }.each do |pkg|
  package pkg do
  action :install
  end
end

remote_file '/home/ubuntu/install' do
  source 'https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash "aws-codedeployagent-install" do
  cwd ::File.dirname('/home/ubuntu/')
  code <<-EOH
  #chmod +x ./install
  cd /home/ubuntu/
  sudo ./install auto
  EOH
not_if { ::File.exists?('/opt/codedeploy-agent/bin/codedeploy-agent') }
end

