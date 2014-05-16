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
  action :create_if_missing
end

# Unzip ec2-ami-tools.zip to /usr/src.
execute "Unzipping ec2-ami-tools.zip..." do
  command "unzip #{Chef::Config[:file_cache_path]}/ec2-ami-tools.zip -d /usr/src/"
  not_if "ls -al #{node.default['aws_tools']['src_dir']} |grep ec2-ami-tools-"
end

# Export environment variable for ec2 ami tools.
bash "Copy ec2-ami-tools binaries to /usr/local/bin..." do
  user "root"
  cwd "/tmp"
  code <<-EOH
  export EC2_AMI_VERSION=`ls -a /var/chef/cache/ |grep ec2-ami-tools |egrep -v ec2-ami-tools.zip |perl -p -i -e 's/ec2-ami-tools-//gmx'`
  cp /var/chef/cache/ec2-ami-tools-$EC2_AMI_VERSION/bin/* /usr/local/bin
  EOH
  not_if 'ls /usr/local/bin |grep ec2-ami-tools-version'
end
