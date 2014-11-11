#
# Cookbook Name:: rails_secrets_from_s3
# Recipe:: default
#
# Copyright (C) 2014 kjoyner
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
node['deploy'].each do |app_name, deploy_config|

	# set the default citadel bucket, allowing it to be overridden
	node.default['rails_secrets_from_s3']['bucket'] = app_name
	node.normal['citadel']['bucket'] = node['rails_secrets_from_s3']['bucket']

	app_dir               = "#{deploy_config['deploy_to']}/current"
	app_shared_dir        = "#{deploy_config['deploy_to']}/shared"
	app_shared_config_dir = "#{app_shared_dir}/config"

	shared_secrets_file = "#{app_shared_config_dir}/secrets.yml"

	file shared_secrets_file do
		owner deploy_config[:user]
		group deploy_config[:group]
		mode '400'
		content citadel["citadel/secrets.yml"]
	end

	link "#{app_dir}/config/secrets.yml" do
		to shared_secrets_file
		owner deploy_config[:user]
		group deploy_config[:group]
	end

end

