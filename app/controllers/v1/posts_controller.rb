module V1
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def show
      post = Post.where(id: params[:id])
      render json: post
    end

    def create
      post = current_user.profile.posts.new(post_params)

      if post.save
        render json: post, status: 201
      else
        render json: { errors: post.errors.full_messages  }, status: 422
      end
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end
  end
end
