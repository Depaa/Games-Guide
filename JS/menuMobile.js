(function ($) {
	$( document ).ready(function() {
		$('.hamburger').click(function(event){
			event.preventDefault();
			var $menu = $('.collapse');
			if($menu.hasClass('opened'))
				$menu.slideUp(200).removeClass('opened');
			else
				$menu.slideDown(200).addClass('opened');
		});
	});
})(jQuery);