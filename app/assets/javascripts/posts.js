Pusher.log = function(message) {
  if (window.console && window.console.log) {
    window.console.log(message);
  }
};

var pusher = new Pusher('501098e34ac10013bab3');
var channel = pusher.subscribe('doppelgrammer_channel');
channel.bind('new_post', function(data) {
	console.log('hello')
	var newData = {caption1: data.caption1, picture1: data.picture1, picture2: data.picture2, caption2: data.caption2, hire_charge: data.hire_charge, tag1: data.tag1, tag2: data.tag2, hire_link: data.hire_link, tag1_link: data.tag1_link, tag2_link: data.tag2_link, upvote_link: data.upvote_link, downvote_link: data.downvote_link}
   var newPost = Mustache.render($("#post-template").html(), newData);
	$(newPost).prependTo("#posts-container");
});

