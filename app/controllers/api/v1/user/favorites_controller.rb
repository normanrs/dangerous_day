class Api::V1::User::FavoritesController < ApiBaseController
  def index
    if current_user.api_key.value == search_params["api_key"]
      user_asteroids = current_user.favorites.map do |fav|
        fav
      end
      render json: user_asteroids
    else
      render json: {status: "error", code: 403, message: "Trying to use someone else's API key is very naughty. Bad user! Bad!"}
    end
  end

  def create
    if current_user.api_key.value == search_params[:api_key]
      fav = Favorite.create(neo_reference_id: search_params[:neo_reference_id], user_id: current_user.id)
      render json: fav
    else
      render json: {status: "error", code: 403, message: "Trying to use someone else's API key is very naughty. Bad user! Bad!"}
    end
  end

private

  def search_params
    params.require(:action)
    params.permit(:api_key, :neo_reference_id)
  end

end
