class Spree::RetailersConfiguration < Spree::Preferences::Configuration
  def self.boolean_preferences
    %w(disable_public_retailers_pages)
  end

  # Don't want retailer listings to be publicly viewable
  preference :disable_public_retailers_pages, :boolean, :default => false
end