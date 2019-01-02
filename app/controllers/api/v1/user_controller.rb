module Api
  module V1
    class UserController < ApiBaseController
      def show
        render json: current_user
      end
    end
  end
end
