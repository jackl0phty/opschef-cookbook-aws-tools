#
# Cookbook Name:: aws_tools
# Recipe:: ec2_ami_tools
#
# Copyright 2014, Gerald L. Hevener Jr., M.S.
# Copyright 2014, Jackl0phty LLC.
#

# Install required packages.
include_recipe 'aws_tools::packages'

# Install EC2 AMI tools.
remote_file "#{Chef::Config[:file_cache_path]}/ec2-ami-tools.zip" do
  source 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'
  action :create_if_missing
end

# Unzip ec2-ami-tools.zip to /usr/src.
execute "Unzipping ec2-ami-tools.zip..." do
  command "unzip #{Chef::Config[:file_cache_path]}/ec2-ami-tools.zip -d /usr/src/"
  not_if 'ls -al /usr/src |grep ec2-ami-tools-'
end

# Export environment variable for ec2 ami tools.
# Execute on any platform except for vagrant/test-kitchen.
bash "Copy ec2-ami-tools binaries to /usr/local/bin..." do
  user "root"
  cwd "/tmp"
  code <<-EOH
  export EC2_AMI_VERSION=`ls -a /usr/src/ |grep ec2-ami-tools |perl -p -i -e 's/ec2-ami-tools-//gmx'`
  cp /usr/src/ec2-ami-tools-$EC2_AMI_VERSION/bin/* /usr/local/bin
  EOH
  not_if 'ls /usr/local/bin |grep ec2-ami-tools-version'
  not_if 'test -d /tmp/kitchen/cookbooks'
end

# Export environment variable for ec2 ami tools.
# Execute only on vagrant/test-kitchen.
bash "Copy ec2-ami-tools binaries to /usr/local/bin..." do
  user "root"
  cwd "/tmp"
  code <<-EOH
  export EC2_AMI_VERSION=`ls -a /usr/src/ |grep ec2-ami-tools |egrep -v ec2-ami-tools.zip |perl -p -i -e 's/ec2-ami-tools-//gmx'`
  cp /usr/src/ec2-ami-tools-$EC2_AMI_VERSION/bin/* /usr/local/bin
  EOH
  not_if 'ls /usr/local/bin |grep ec2-ami-tools-version'
  only_if 'test -d /tmp/kitchen/cookbooks'
end
