// common
var myCom = {};

/**
 * users.js
 */
var users = (function() {
	// 【開始】 users

	/**
	 * users`s Inner class
	 */
	var users_inner = function(objCom) {
		// 【begin】 users_inner
		
		// 共通処理
		myCom = objCom;

		// 【end】 users_inner
	};

	/**
	 * users_inner`s prototype chain
	 */
	users_inner.prototype = {
		// 【begin】 users_inner.prototype

		/**
		 * Init
		 * 
		 * Member : engineer_js_inner.prototype
		 */
		indexInit : function(usersData) {
			
			 // 表を削除
			$("#grid-container").empty();
		     // tableタグを再挿入
		    $("#grid-container").append('<table class="table table-striped"></table>');
		    $("#grid-container").append('<div id="pager1"></div>');
		    
		    // 性別の設定
			for (cnt = 0; cnt < usersData.length; cnt++) {
				if(usersData[cnt].gender === 1){
					usersData[cnt].gender = "男";
				}else{
					usersData[cnt].gender = "女";
				}
			}
			
		    // フォントサイズ変更
		    $('div.ui-jqgrid').css('font-size', '4em');
		    
			// 列の表示名
			var colNames = ['氏名', 'メールアドレス', '性別', '生年月日', '	アクション', 'スキルシート'];
			
			// グリッドテーブル作成
			jQuery('.table.table-striped').jqGrid({
				
				data : usersData,
                datatype : "local",
                colNames : colNames,
                colModel : [
                	{name:'name', width:'220px', height: "100px", align:'center'},
                	{name:'email', width:'260px', height :'100px', align:'center'},
                	{name:'gender', width:'120px', align:'center', height :'100px', align:'center'},
                	{name:'birthday', width:'220px', height :'100px', align:'center'},
                	{name:'id', width:'220px', align:'center', height :'100px', formatter:fncAtLink},
                	{name:'id', width:'220px', align:'center', height :'100px', formatter:fncLiLink}
                	],
                	caption : "ユーザー 一覧",	// ヘッダーのキャプション
                	rowNum : 10, 			// 一ページに表示する行数
                	rowList : [1, 10, 20],  // 変更可能な1ページ当たりの行数
                	autoencode: true,       // エンコード
                	multiselect : false,     // リストのチェックボックス
                	cellEdit: false,    	// 編集不可とする
                	cellsubmit : 'clientArray', // 入力データをグリッド内に保持
                	height:'auto',          // 高さ
                    pager : 'pager1',       // footerのページャー要素のid
                	shrinkToFit : true,　　    // 横スクロールバーを非表示
                	viewrecords : true      // footerの右下に表示する。
			});
			
			// アクションのリンク設定
			function fncAtLink(cval, opt, rdt){
				  // Show URL
				  var str = "<a href='/users/" + cval + "'>Show / </a>";
				  // Edit URL
				  str += "<a href='/users/" + cval + "/edit'>Edit / </a>";
				  // Destroy URL
				  str += "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/users/" + cval + "'>Destroy</a>";
				  return str;
				}
			
			// スキルシートのリンク設定
			function fncLiLink(cval, opt, rdt){
				var result = null;
			    // リンクの文言設定
				var newFlg = $('#newFlg_' + cval).html();
				
				if(newFlg == "true"){
					// スキルシート未作成
					result = "<a href='/skillsheets/new?user_id=" + cval + "'>新規作成</a>";
				}else{
					// スキルシート作成済
					result = "<a href='/skillsheets/" + cval + "'>リンク</a>";
				}
				return result;
				}
			
			// jqGrid 追加設定
			myCom.setGridOption();
		}
		
	// 【end】 users_inner.prototype
	};

	return users_inner;
	// 【終了】 users
})();

