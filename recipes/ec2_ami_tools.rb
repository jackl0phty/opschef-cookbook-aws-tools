#
# Cookbook Name:: aws_tools
# Recipe:: ec2_ami_tools
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
# Copyright 2014, Jackl0phty LLC.
#

# Install EC2 AMI tools.
remote_file "#{Chef::Config[:file_cache_path]}/ec2-ami-tools.zip" do
  source 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'
#  not_if "test -f #{Chef::Config[:file_cache_path]}/ec2-ami-tools.zip"
end
