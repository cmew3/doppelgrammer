$(document).ready(function() {
	$('#posts-container').on('click', '.doppel-link', function(event){
		var voteCount = $(this).siblings('.doppel-count')
		event.preventDefault();
		$.post(this.href, function(response){
			voteCount.text(response.new_count);
		})
	})
})