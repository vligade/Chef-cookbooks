# Cookbook Name:: sendmail
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'sendmail' do
        action :install
end


service 'sendmail' do
        action [ :enable, :start ]
end


template "/etc/mail/sendmail.cf" do
	source    "sendmail.cf.erb"
	notifies  :restart,"service[sendmail]"
end
