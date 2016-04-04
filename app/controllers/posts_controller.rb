class PostsController < ApplicationController
  def index
    @posts = Post.includes(:channel, :slots).all
    render json: @posts
  end
end
