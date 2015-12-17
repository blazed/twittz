module V1
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def like_profile
      profile = Profile.find(params[:profile_id])
      profile.followers.create! follower: current_user

      render json: profile, status: 200
    end

    def like_post
      like = Like.new(post_id: params[:post_id], profile: current_user.profile)
      if like.save
        render json: like, status: 201
      else
        render json: { errors: like.errors.full_messages }, status: 422
      end
    end
  end
end
