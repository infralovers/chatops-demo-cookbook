# encoding: utf-8

require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! do
  add_filter 'berks-cookbooks'
end
