class SearchController < ApplicationController
  def index
    zip = params[:zip]
    @stations = NrelService.new.get_stations(zip)
    @stations.sort_by! {|station| station.distance}
  end

  private
    def search_params
      params.permit(:zip)
    end
end
