// common
var myCom = {};

/**
 * users.js
 */
var users = (function() {
	// 【begin】 users

	/**
	 * users`s Inner class
	 */
	var users_inner = function(objCom) {
		// 【begin】 users_inner
		
		// common class
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
			
			$("#grid-container").empty();
		     // table-tag insert
		    $("#grid-container").append('<table class="table table-striped"></table>');
		    $("#grid-container").append('<div id="pager1"></div>');
		    
		    // gender setting
			for (cnt = 0; cnt < usersData.length; cnt++) {
				if(usersData[cnt].gender === 1){
					usersData[cnt].gender = "男";
				}else{
					usersData[cnt].gender = "女";
				}
			}
			
		    // change font-size
		    $('div.ui-jqgrid').css('font-size', '4em');
		    
			// column display name
			var colNames = ['氏名', 'メールアドレス', '性別', '生年月日', '	アクション', 'スキルシート'];
			
			// grid table creation
			jQuery('.table.table-striped').jqGrid({
				
				data : usersData,
                datatype : "local",
                colNames : colNames,
                colModel : [
                	{ name : 'name', width : '220px', 
                		height : "100px", align :'center' },
                	{ name : 'email', width :'260px', 
                		height : '100px', align : 'center' },
                	{ name : 'gender', width : '120px', align : 'center', 
                		height :'100px', align:'center'},
                	{ name : 'birthday', width : '220px', 
                		height : '100px', align : 'center'},
                	{ name : 'id', width : '220px', align : 'center', 
                		height : '100px', formatter : fncAtLink},
                	{ name : 'id', width : '220px', align : 'center', 
                		height : '100px', formatter : fncLiLink}
                	],
                	caption : "ユーザー 一覧",	
                	rowNum : 10, 			// lines displayed on one page
                	rowList : [1, 10, 20],  // lines per page that can be changed
                	autoencode: true,       // encoding
                	multiselect : false,     // check box
                	cellEdit: false,    	// do not edit
                	cellsubmit : 'clientArray', // keep input data in grid
                	height:'auto',          
                    pager : 'pager1',       // pager element id of footer
                	shrinkToFit : true,　　    // hide horizontal scroll bar
                	viewrecords : true      // lower right of footer
			});
			
			// Link setting of action
			function fncAtLink(cval, opt, rdt){
				  // Show URL
				  var str = "<a href='/users/" + cval + "'>Show / </a>";
				  // Edit URL
				  str += "<a href='/users/" + cval + "/edit'>Edit / </a>";
				  // Destroy URL
				  str += "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/users/" + cval + "'>Destroy</a>";
				  return str;
				}
			
			// Link setting of skill sheet
			function fncLiLink(cval, opt, rdt){
				var result = null;
				
				if($('#new-or-show-' + cval).val() == 'new'){
					// new
					result = "<a href='/skillsheets/new?user_id=" + cval + "'>新規作成</a>";
				}else{
					// show
					result = "<a href='/skillsheets/" + cval + "'>リンク</a>";
				}
				return result;
				}
			
			// jqGrid additional setting
			myCom.setGridOption();
		}
		
	// 【end】 users_inner.prototype
	};

	return users_inner;
	// 【end】 users
})();

