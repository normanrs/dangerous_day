require 'rails_helper'

describe "GET /user/favorites" do
  it "returns a favorite with a valid API key" do
    user = create(:user, email: "aunt.jessica@example.com", name: "Jessica Flororata")
    api_key = ApiKey.create(value: "EVEN_MORE_LEGIT", user_id: user.id)
    fav = Favorite.create(neo_reference_id: "2153306", user_id: user.id)

    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data.first[:id]).to eq(fav.id)
    expect(data.first[:neo_reference_id]).to eq(fav.neo_reference_id)
    expect(data.first[:user_id]).to eq(fav.user_id)
    expect(data.first[:asteroid][:name]).to eq("153306 (2001 JL1)")
    expect(data.first[:asteroid][:is_potentially_hazardous_asteroid]).to eq(false)
  end

end
