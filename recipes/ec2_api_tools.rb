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

# Unzip ec2-api-tools.zip to /usr/src.
execute "Unzipping ec2-api-tools.zip..." do
  command "unzip #{Chef::Config[:file_cache_path]}/ec2-api-tools.zip -d #{node.default['ec2_api_install_dir']}"
  not_if "ls -al #{node.default['ec2_api_install_dir']} |grep ec2-api-tools-"
end

# Export environment variable for ec2 api tools.
bash "Copy ec2-api-tools binaries to /usr/local/bin..." do
  user "root"
  cwd "/tmp"
  code <<-EOH
  EC2_API_VERSION=`ls -a /var/chef/cache/ |grep ec2-api-tools |egrep -v ec2-api-tools.zip |perl -p -i -e 's/ec2-api-tools-//gmx'`
  cp /var/chef/cache/ec2-api-tools-$EC2_API_VERSION/bin/* /usr/local/bin
  EOH
  not_if 'ls /usr/local/bin |grep ec2-get-password'
end
