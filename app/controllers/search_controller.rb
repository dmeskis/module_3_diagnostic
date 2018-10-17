class SearchController < ApplicationController
  def index
    zip = params[:q]
    @stations = NrelService.new.get_url("/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10")
    @stations.map! do |station|
      Station.new(station)
    end
    @stations.sort_by! {|station| station.distance}
  end
end
