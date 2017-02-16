# encoding: utf-8
#
# Cookbook Name:: chatops_demo
# Attributes:: default

default['chatops_demo']['tld'] = 'infralovers.consulting'

default['chatops_demo']['jenkins']['additional-plugins'] = %w()

default['chatops_demo']['gitlab']['url'] = 'git.redbullmediahouse.com'
default['chatops_demo']['gitlab']['protocol'] = 'https'
default['chatops_demo']['gitlab']['ip'] = nil # '10.11.12.4'

default['chatops_demo']['slack']['slack_domain'] = 'rbmh'

default['chatops_demo']['lita']['custom_plugins_dir'] = '/opt/lita-custom-plugins'
