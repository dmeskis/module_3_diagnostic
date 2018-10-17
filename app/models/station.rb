class Station
  attr_reader :station_name,
              :type,
              :distance,
              :street_address,
              :access_times

  def initialize(attributes = {})
    @station_name    = attributes[:station_name]
    @type            = attributes[:fuel_type_code]
    @distance        = attributes[:distance]
    @street_address  = attributes[:street_address]
    @access_times    = attributes[:access_days_time]
  end
end
