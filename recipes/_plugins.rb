# encoding: utf-8
#
# Cookbook Name:: chatops_demo
# Recipe:: _plugins
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

# Install required plugins

#  true if plugin is installed or updated and jenkins will be restarted.
#  Pattern from https://tickets.opscode.com/browse/CHEF-2452
#  restart_required = false

package 'git'

%w( workflow-aggregator=2.4
    workflow-cps=2.23
    workflow-job=2.9
    workflow-step-api=2.5
    workflow-scm-step=2.3
    workflow-api=2.8
    workflow-durable-task-step=2.5
    workflow-basic-steps=2.3
    pipeline-build-step=2.2
    workflow-multibranch=2.9.2
    pipeline-stage-view=2.0
    workflow-cps-global-lib=2.3
    pipeline-stage-step=2.2
    pipeline-input-step=2.1
    pipeline-stage-view=2.0
    pipeline-rest-api=2.0
    workflow-support=2.11
    cloudbees-folder=5.17
    credentials=2.1.11
    scm-api=2.0.2
    script-security=1.24).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, 'ruby_block[jenkins_restart_flag]', :immediately
  end
end

node['chatops_demo']['jenkins']['additional-plugins'].each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, 'ruby_block[jenkins_restart_flag]', :immediately
  end
end

# Is notified only when a 'jenkins_plugin' is installed or updated.
ruby_block 'jenkins_restart_flag' do
  block do
    node.run_state['restart_required'] = true
  end
  action :nothing
end

jenkins_command 'restart' do
  only_if { node.run_state['restart_required'] }
end
