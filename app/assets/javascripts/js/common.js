/**
 * common.js
 */
var common = (function() {
	// 【begin】 common

	/**
	 * commonInner
	 */
	var common_inner = function() {
	};

	/**
	 * common_inner`s prototype chain
	 */
	common_inner.prototype = {

		/**
		 * common additional settings of jqGrid
		 */
		setGridOption : function() {
			$('.table.table-striped').jqGrid(
					'navGrid',
					'#pager1',
					{
						add : false,
						edit : false,
						del : false,
						search : false
					});

			// resize
			$(window).bind(
					'resize',
					function() {
						$('.table.table-striped').setGridWidth(
								$(window).width() - 120);
						$('.table.table-striped').setGridHeight(
								$(window).height() - 280);
					}).trigger('resize');

			// centralized processing
			var checkWidth = function() {
				// Get Browser Width
				var browserWidth = $(window).width();
				// Get Browser width
				var boxW = $(".table.table-striped").width();
				var plusPxW = ((browserWidth - boxW) / 2);
				$('.table.table-striped').css({
					'left' : plusPxW + "px"
				});
			}
			// resize processing
			$(window).resize(checkWidth);
		},

	// 【end】 common_inner.prototype
	};

	return common_inner;
	// 【end】 common
})();
