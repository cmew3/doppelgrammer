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
			tag1_link, tag2_link = tag_path(@post.tags.first), tag_path(@post.tags.last)
			hire_link = new_post_charge_path(@post)
			NewPostNotifier.notify_new(@post, hire_link, tag1_link, tag2_link)
			redirect_to posts_path
		end

	end



end


