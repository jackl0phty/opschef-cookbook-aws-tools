#
# Cookbook Name:: aws_tools
# Attributes:: default
# Copyright 2014, Gerald L. Hevener, Jr, M.S.
# Copyright 2014, Jackl0phty LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Install URL for EC2 API tools.
node.default['aws_tools']['ec2_api_tools_url'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip'

# Install URL for EC2 AMI tools.
node.default['aws_tools']['ec2_ami_tools_url'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'
