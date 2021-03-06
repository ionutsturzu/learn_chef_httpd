#
# Cookbook Name:: learn_chef_httpd
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn_chef_httpd::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'installs httpd package' do
      expect(chef_run).to install_package('httpd')
    end
    
    it 'enables and starts htttpd package' do
      expect(chef_run).to enable_service('httpd')
      expect(chef_run).to start_service('httpd')
    end

    it 'creates index.html template' do
      expect(chef_run).to create_template('/var/www/html/index.html').with(
        source: 'index.html.erb'
      )
    end
  end
end
