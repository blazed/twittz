module V1
  class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
      #follower_ids = Relationship.find_by_sql("SELECT follower_id FROM relationships WHERE follower_id = #{current_user.id}")
      feed = PublicActivity::Activity.all
      render json: feed#, serializer: FeedSerializer
    end
  end
end
