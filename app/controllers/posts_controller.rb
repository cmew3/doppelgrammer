class PostsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		Post.create(params[:post].permit(:title, :picture1, :picture2, :caption1, :caption2, :tag_list))

		redirect_to posts_path
	end
end
