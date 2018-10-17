class NrelService

  def get_stations(zip)
    stations = get_url("/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10")
    stations.map do |station|
      Station.new(station)
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private
    def conn
      Faraday.new(url: "https://developer.nrel.gov") do |faraday|
        faraday.headers["x-api-key"] = ENV["API_KEY"]
        faraday.adapter Faraday.default_adapter
      end
    end
end
