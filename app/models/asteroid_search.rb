class AsteroidSearch
  def initialize(neo_ref)
    @neo_reference_id = neo_ref.to_i
  end

  def info
    json_result = get_json
  end

  def get_json
    @response ||= Faraday.get("https://api.nasa.gov/neo/rest/v1/neo/#{@neo_reference_id}?api_key=#{ENV["NASA_KEY"]}")
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

end
