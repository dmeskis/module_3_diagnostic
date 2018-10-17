class NrelService

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
