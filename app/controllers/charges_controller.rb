class ChargesController < ApplicationController

	def new
		@post=Post.find(params[:post_id])
	end

	def create
		@post=Post.find(params[:post_id])
	    # Amount in pence
	    @amount = @post.hire_charge*100

	  	customer = Stripe::Customer.create(
	    	:email => params[:stripeEmail],
	   	 	:card  => params[:stripeToken]
	  	)

	  	charge = Stripe::Charge.create(
	   		:customer    => customer.id,
	   		:amount      => @amount,
	    	:description => 'Doppelgrammer customer',
	    	:currency    => 'gbp'
	  	)

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
	end

end
