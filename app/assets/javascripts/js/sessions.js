/**
 * sessions.js
 */
var sessions = (function() {
	// 【begin】 sessions

	/**
	 * sessions Inner
	 */
	var sessions_inner = function() {

		// navigate bar delete
		$(".navbar").empty();
		$('body').css('background', '#e9e9e9');
		$('body').css('color', '#5e5e5e');

		// alert value check
		var alertInfo = $('.alert.alert-info').html();
		var alertDanger = $('.alert.alert-danger').html();
		var alertWarning = $('.alert.alert-warning ul li').html();
		var alertVal = null;

		if (alertInfo) {
			alertVal = '.alert.alert-info';
		} else if (alertDanger) {
			alertVal = '.alert.alert-danger';
		} else if (alertWarning) {
			alertVal = '.alert.alert-warning ul li';
		}

		// alert value output
		if (alertVal) {
			var alertHtml = $(alertVal).html();
			$(alertVal).remove();
			$('.alertHere').empty();
			$('.alertHere').append(
					'<div class="alert.alert-danger" style="text-align:center; color:red;">'
							+ alertHtml + '</div>');
			$('.alertHere').trigger('create');
		}
	};

	/**
	 * sessions_inner`s prototype chain
	 */
	sessions_inner.prototype = {

		/**
		 * login button click
		 */
		login_click : function(e) {
			var email = $('#email').val();
			var password = $('#password').val();
			if (email && password) {
				return true;
			} else {
				e.preventDefault();
				$('.alertHere').empty();
				$('.alertHere')
						.append(
								'<div class="alert.alert-danger" style="text-align:center; color:red;">EmailとPasswordは入力必須です。</div>');
				$('.alertHere').trigger('create');
				return false;
			}
		}

	// 【end】 sessions_inner.prototype
	};

	return sessions_inner;
	// 【end】 sessions
})();
