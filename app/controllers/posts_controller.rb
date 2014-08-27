class PostsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:title, :picture1, :picture2, :caption1, :caption2, :hire_charge))
		@post.create_tags
		if @post.errors.any?
			render :action => :new
		else
			redirect_to posts_path
		end

	end
end
