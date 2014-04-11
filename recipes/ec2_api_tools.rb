#
# Cookbook Name:: aws_tools
# Recipe:: ec2_api_tools
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
# Copyright 2014, Jackl0phty LLC.
#

# Install EC2 API tools.
remote_file "#{Chef::Config[:file_cache_path]}/ec2-api-tools.zip" do
  source node['aws_tools']['ec2_api_tools_url']
  not_if "#{Chef::Config[:file_cache_path]}/ec2-api-tools.zip"
end
