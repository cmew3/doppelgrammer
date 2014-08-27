Pusher.log = function(message) {
  if (window.console && window.console.log) {
    window.console.log(message);
  }
};



var pusher = new Pusher('501098e34ac10013bab3');
var channel = pusher.subscribe('my_channel');
channel.bind('my_event', function(data) {
	var fakeData = {"picture1": "http://s3.amazonaws.com/doppelgrammer/posts/picture1s/000/000/030/medium/thomas.png?1409007585", "caption1": "Thomas", "Hire-charge": "£50" }
   $('#posts-container').prepend(data.caption1);
});