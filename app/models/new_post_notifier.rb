class NewPostNotifier
	def self.notify_new(post, hire_link)
    	Pusher['doppelgrammer_channel'].trigger('new_post', {
    		picture1: post.picture1.url(:medium),
    		picture2: post.picture2.url(:medium), 
    		caption1: post.caption1, caption2: post.caption2, 
    		tag1: post.tags.first.text, tag2: post.tags.last.text, 
    		hire_charge: post.hire_charge,
    		hire_link: hire_link

    		})
  	end
end