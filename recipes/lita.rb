# encoding: utf-8
#
# Cookbook Name:: chatops_demo
# Recipe:: lita
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

node.default['lita']['config_cookbook'] = 'chatops_demo'
# ssh_known_hosts_entry node['rbmh_jenkins_admin_services_deployer']['bot']['git_host']

directory node['chatops_demo']['lita']['custom_plugins_dir'] do
  recursive true
end

path_to_lita_chatops_demo = File.join(node['chatops_demo']['lita']['custom_plugins_dir'], 'lita-chatops-demo')

git path_to_lita_chatops_demo do
  repository 'https://github.com/infralovers/lita-chatops-demo.git'
  revision 'master'
  action :sync
  notifies :restart, 'service[lita]'
end

node.default['lita']['plugins'] = [
  'compliment',
  'cowsay',
  { 'chatops_demo' => ":path => '#{path_to_lita_chatops_demo}'" }
]

package 'liblzma-dev'
package 'zlib1g-dev'

node.default['lita']['version'] = '4.7.0'
node.default['lita']['adapters'] = ['slack']
node.default['lita']['http_port'] = 8000

node.default['lita']['runit']['env'] = {
  'HOME' => node['lita']['install_dir'],
  'PATH' => [node['languages']['ruby']['bin_dir'],
             node['languages']['ruby']['gem_bin'],
             node['languages']['ruby']['ruby_dir'],
             '/usr/bin',
             'bin'].join(':')
}

node.default['lita']['adapter_config'] = {
  slack: {
    token: node['chatops_demo']['shared_secrets']['slack_lita_api_token']
  }
}

node.default['lita']['ruby_install_type'] = 'none'

include_recipe 'lita::default'
