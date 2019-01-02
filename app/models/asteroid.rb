class Asteroid
  attr_reader :name,
              :neo_reference,
              :is_potentially_hazardous_asteroid

  def initialize(data)
    @name                              = data[:name]
    @neo_reference                     = data[:neo_reference_id]
    @is_potentially_hazardous_asteroid = data[:is_potentially_hazardous_asteroid]
  end

end
