module V1
  class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show]

    def show
      profile = Profile.find_by(handle: params[:handle].downcase)

      render json: profile
    end

  end
end
