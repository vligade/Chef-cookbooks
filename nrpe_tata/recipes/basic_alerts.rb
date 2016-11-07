#
# Recipe:: basic_alerts
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'fen-nrpe::default'
include_recipe 'fen-nrpe::load_avergae'
include_recipe 'fen-nrpe::current_user'
include_recipe 'fen-nrpe::total_process'
include_recipe 'fen-nrpe::disk_space'
include_recipe 'fen-nrpe::check_memory'
