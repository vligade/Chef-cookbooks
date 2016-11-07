#
# Cookbook Name:: monit-ng_tata
# Recipe:: default
#
# Copyright 2016, Prateek Malik
#
# All rights reserved - Do Not Redistribute
#

include_recipe "monit-ng"

node.override['monit']['source'] = '5.14'

