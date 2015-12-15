module V1
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def show
      post = Post.where(id: params[:id])
      render json: post
    end
  end
end
