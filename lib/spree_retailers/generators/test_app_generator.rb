require 'spree'
require 'generators/spree/test_app_generator'

module SpreeRetailers
  module Generators
    class TestAppGenerator < Spree::Generators::TestAppGenerator
      
      class_option :app_name, :type => :string,
                        :desc => "The name of the test rails app to generate. Defaults to test_app.",
                        :default => "dummy"


      source_paths << File.expand_path("../../templates", __FILE__)
      
      def install_spree_core
        inside "test/#{test_app}" do
          run 'rake spree_core:install'
          run 'rake spree_auth:install'
          run 'rake spree_retailers:install'
        end
      end
      
      def generate_app
        silence_stream(STDOUT) {
          remove_directory_if_exists("test/#{test_app}")
          inside "test" do
            run "rails new #{test_app} -GJTq --skip-gemfile"
          end
        }
      end
      
      def replace_gemfile
        true
      end
      
      def setup_environments
        remove_file 'config/boot.rb'
        template 'config/boot.rb'
      end
      
      def tweak_gemfile
        true
      end
      
      def create_rspec_gemfile
        true
      end
      
      def create_root
        self.destination_root = File.expand_path("test/#{test_app}", destination_root)
      end
    
      def migrate_db  
        run_migrations
      end
    
      protected
      
      def full_path_for_local_gems
        <<-gems
gem 'spree_core', '>= 0.40.2'
gem 'spree_auth', '>= 0.40.2'
gem 'spree_retailers', :path => File.expand_path('../../../../', __FILE__)
gem 'geokit',     '>= 1.5.0'
        gems
      end
    end
  end
end
