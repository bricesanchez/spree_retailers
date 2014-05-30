class Spree::RetailersController < Spree::BaseController

  before_filter :disable_public_retailers_pages

  def index
    # TODO right now the index doesn't categorize the different type of retailers well
    # it's really messy; don't have time to fix it right now
    
    if params[:retailer_type_id].present?
      @retailer_type = Spree::RetailerType.find_by_permalink!(params[:retailer_type_id])
      @retailers = @retailer_type.retailers
    else
      @retailers = Spree::Retailer.scoped
    end

    @retailer_types = Spree::RetailerType.order(:name).all
    @retailers = @retailers.order(:country, :state, :name)

    # TODO this whole state selection thing is a mess; needs to be cleaned up
    @states = {}
    Spree::State.where(abbr: @retailers.map(&:state).uniq.reject(&:blank?)).all.each do |state|
      @states[state.abbr] = state.name
    end
  end

  private
  
  def disable_public_retailers_pages
    disable_public_retailers_pages = Spree::Retailers::Config.disable_public_retailers_pages
    render_404 if disable_public_retailers_pages  # Don't want retailer listings to be publicly viewable
  end

end
