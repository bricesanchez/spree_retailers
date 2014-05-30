class Spree::Admin::RetailersController < Spree::Admin::ResourceController

  before_filter :get_locations, :except => [:index, :destroy]
  before_filter :set_request_url_in_session, :only => [:index, :find_local_stockists]
  
  def find_local_stockists
    @location = params[:q]
    @distance = params[:distance]
    @distance = (@distance)? @distance.to_i : 5
    @matches = []
    
    return if @location.nil?
    
    @user_locn = Geokit::Geocoders::GoogleGeocoder.geocode @location
    results = Spree::Retailer.within(@distance, :units => :miles, :origin => @user_locn)
    @retailers = DistanceCollection.new(results)
    @retailers.set_distance_from(@user_locn)
    @matches = @retailers.select {|r| r.distance < @distance}   # Ensure non-geocoded retailers are filtered out
    @matches = @matches.sort_by {|r| r.distance}
  end

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
