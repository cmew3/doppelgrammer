class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		Post.create(params[:post].permit(:title, :picture1, :picture2, :caption1, :caption2))

		redirect_to posts_path
	end
end
