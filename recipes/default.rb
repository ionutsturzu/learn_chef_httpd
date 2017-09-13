#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action %i(enable start)
end

template '/var/www/html/index.html' do
  source 'intex.html.erb'
end
