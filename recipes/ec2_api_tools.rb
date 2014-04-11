#
# Cookbook Name:: aws_tools
# Recipe:: ec2_api_tools
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
# Copyright 2014, Jackl0phty LLC.
#

# Install EC2 API tools.
remote_file "#{Chef::Config[:file_cache_path]}/ec2-api-tools.zip" do
  source 'http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip'
  action :create_if_missing
end
