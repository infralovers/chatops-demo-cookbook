# encoding: utf-8
#
# Cookbook Name:: chatops_demo
# Recipe:: _base
#
# Copyright 2015 Infralovers
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Disable omnibus-updater from il-base cookbook
# It would otherwise stop the first chef-client run on updating and override any settings of the chef-client (time interval)
node.default['base']['include']['omnibus-updater'] = false
# node.default['omnibus_updater']['version'] = '12.9.38'

include_recipe 'il-base'
include_recipe 'git'
include_recipe 'chef-vault::default'
