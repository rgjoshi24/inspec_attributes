#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['hello']['packages'].each do |pack|
  package pack do
    action :install
  end
end

# Testing hook
# See, https://github.com/chef/inspec/issues/541
ruby_block 'Save node attributes' do
  block do
    File.write('/tmp/kitchen_chef_node.json', node.to_json)
  end
end