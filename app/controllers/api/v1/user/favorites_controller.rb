class Api::V1::User::FavoritesController < ApiBaseController
  def index
    if current_user.api_key.value == params["api_key"]
      user_asteroids = current_user.favorites.map do |fav|
        fav
      end
      render json: user_asteroids
    else
      render json: {status: "error", code: 403, message: "Trying to use someone else's API key is very naughty. Bad user! Bad!"}
    end
  end

end
