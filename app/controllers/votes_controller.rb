class VotesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		direction = params[:direction]
		post.votes << Vote.new(direction: direction)
		if direction == "up"
			render json: {new_count: post.count_upvotes}
		else
			render json: {new_count: post.count_downvotes}
		end
	end

end
