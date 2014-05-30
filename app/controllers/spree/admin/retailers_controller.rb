class Spree::Admin::RetailersController < Spree::Admin::ResourceController

  before_filter :get_locations, :except => [:index, :destroy]
  before_filter :set_request_url_in_session, :only => [:index]
  
  protected
  
  def location_after_save
    session[:return_to]
  end
  
  def collection_url(options = {})
    session[:return_to]
  end

  private
  
  def set_request_url_in_session
    session[:return_to] = request.url
  end

  def collection
    params[:q] ||= {}
    params[:q][:s] ||= "name asc"
    @search = Spree::Retailer.ransack(params[:q])
    @collection = @search.result.includes(:retailer_type).page(params[:page]).per(Spree::Config[:orders_per_page])
  end

  def get_locations
    @countries = Spree::Country.all.map(&:name).sort
    @states = Spree::State.where(:country_id => 214).order(:name).collect{|state| [state.name, state.abbr] }
  end

end
