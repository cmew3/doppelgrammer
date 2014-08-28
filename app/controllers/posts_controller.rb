class PostsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post].permit(:picture1, :picture2, :caption1, :caption2, :hire_charge))
		@post.create_tags
		if @post.errors.any?
			render :action => :new
		else
			NewPostNotifier.notify_new(@post, new_post_charge_path(@post))
			redirect_to posts_path
		end

	end



end


