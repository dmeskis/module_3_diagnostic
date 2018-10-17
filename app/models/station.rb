class Station
  attr_reader :name,
              :type,
              :distance,
              :address,
              :fuel_type,
              :access_times

  def initialize(attributes = {})
    @name         = attributes[:name]
    @type         = attributes[:type]
    @distance     = attributes[:distance]
    @address      = attributes[:address]
    @fuel_type    = attributes[:fuel_type]
    @access_times = attributes[:access_times]
  end
end
