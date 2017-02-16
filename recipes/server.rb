# encoding: utf-8
#
# Cookbook Name:: chatops_demo
# Recipe:: server
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

include_recipe "#{cookbook_name}::_base"
include_recipe "#{cookbook_name}::_java"

node.default['chatops_demo']['shared_secrets'] = chef_vault_item('chatops-demo', 'all_in_one_secrets')

# Install Jenkins and dependencies
node.default['jenkins']['master']['install_method'] = 'war'
node.default['jenkins']['master']['source'] = 'http://mirrors.jenkins-ci.org/war-stable/2.32.2/jenkins.war'
node.default['jenkins']['master']['checksum'] = '73b216449cb5eacd4fe5a6ee2e089245705e5815b448e315fbc8b6de7809e55f'
node.default['jenkins']['master']['jvm_options'] = '-Djenkins.install.runSetupWizard=false'
node.default['jenkins']['executor']['timeout'] = 240

include_recipe 'jenkins::master'

include_recipe "#{cookbook_name}::_plugins"
include_recipe "#{cookbook_name}::lita"
