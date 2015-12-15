module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def me
      if current_user
        render json: current_user, status: 200
      end
    end
  end
end
