class SearchController < ApplicationController
  def index
    zip = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["x-api-key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG&limit=10")
    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    binding.pry
  end
end
