require 'spree_retailers/version'
require 'spree_retailers/custom_hooks'

module SpreeRetailers
  
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    #initializer "static assets" do |app|
    #  app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{config.root}/public"
    #end

    #def self.activate
    #  #Dir["../app/**/*.rb"].each do |c|
    #  #  puts c
    #  #  #Rails.env.production? ? require(c) : load(c)
    #  #end
    #end

    #config.to_prepare &method(:activate).to_proc
  end
end