#
# Cookbook Name:: fail2ban_tata
# Recipe:: configure
#
# Copyright (c) 2016 Prateek Malik, All Rights Reserved.

cookbook_file "/etc/fail2ban/jail.conf" do
  source "jail.conf"
  mode "0644"
end

cookbook_file "/etc/fail2ban/action.d/sendmail-whois-http.conf" do
  source "sendmail-whois-http.conf"
  mode "0644"
end

cookbook_file "/etc/fail2ban/filter.d/http-get-dos.conf" do
  source "http-get-dos.conf"
  mode "0644"
end
