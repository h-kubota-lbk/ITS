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
		 * jqGridの共通追加設定
		 */
		setGridOption : function() {
			// jqGrid 追加設定
			// フッターのボタン
			$('.table.table-striped').jqGrid(
					'navGrid',
					'#pager1',
					{
						add : false,
						edit : false,
						del : false,
						search : false
					});

			// リサイズ時イベント
			$(window).bind(
					'resize',
					function() {
						$('.table.table-striped').setGridWidth(
								$(window).width() - 120);
						$('.table.table-striped').setGridHeight(
								$(window).height() - 280);
					}).trigger('resize');

			// 中央寄せ処理
			var checkWidth = function() {
				// ブラウザの横幅を取得
				var browserWidth = $(window).width();
				// 横幅を取得
				var boxW = $(".table.table-striped").width();
				// 左端から離す距離pxを計算
				var plusPxW = ((browserWidth - boxW) / 2);
				// CSSで追加
				$('.table.table-striped').css({
					'left' : plusPxW + "px"
				});
			}
			// リサイズ
			$(window).resize(checkWidth);
		},

	// 【end】 common_inner.prototype
	};

	return common_inner;
	// 【end】 common
})();
