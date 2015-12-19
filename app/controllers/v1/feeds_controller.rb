module V1
  class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
      feed = Post.where("profile_id in (?) OR profile_id = ?", current_user.followed_profile_ids, current_user.profile.id)
      render json: feed, each_serializer: FeedSerializer
    end
  end
end
