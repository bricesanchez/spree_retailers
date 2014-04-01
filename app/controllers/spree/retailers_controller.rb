class Spree::RetailersController < Spree::BaseController

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

end
