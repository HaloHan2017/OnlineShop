//分页工具
	function initpage(data){
		$(".zxf_pagediv").empty();
		/*上一页*/
		if (data.currentpage > 1) {
			$(".zxf_pagediv").append('<a href="javascript:void(0);" class="prebtn" onclick="prepage('+data.currentpage+')">上一页</a>');
		} else{
			$(".zxf_pagediv").remove('.prevPage');
			$(".zxf_pagediv").append('<span class="disabled">上一页</span>');
		}
		/*中间页*/
		if (data.currentpage >4 && data.totalpage > 4) {
			$(".zxf_pagediv").append('<a href="javascript:;" class="zxfPagenum" onclick="pagenum('+1+')">'+1+'</a>');
			$(".zxf_pagediv").append('<a href="javascript:;" class="zxfPagenum" onclick="pagenum('+2+')">'+2+'</a>');
			$(".zxf_pagediv").append('<span>...</span>');
		}
		if (data.currentpage >4 && data.currentpage <= data.totalpage-5) {
			var start  = data.currentpage - 2,end = data.currentpage + 2;
		}else if(data.currentpage >4 && data.currentpage > data.totalpage-5){
			var start  = data.totalpage - 4,end = data.totalpage;
		}else{
			var start = 1,end = 9;
		}
		for (;start <= end;start++) {
			if (start <= data.totalpage && start >=1) {
				if (start == data.currentpage) {
					$(".zxf_pagediv").append('<span class="current" onclick="pagenum('+start+')">'+ start +'</span>');
				} else if(start == data.currentpage+1){
					$(".zxf_pagediv").append('<a href="javascript:void(0);" class="zxfPagenum nextpage" onclick="pagenum('+start+')">'+ start +'</a>');
				}else{
					$(".zxf_pagediv").append('<a href="javascript:void(0);" class="zxfPagenum" onclick="pagenum('+start+')">'+ start +'</a>');
				}
			}
		}
		if (end < data.totalpage) {
			$(".zxf_pagediv").append('<span>...</span>');
		}
		/*下一页*/
		if (data.currentpage >= data.totalpage) {
			$(".zxf_pagediv").remove('.nextbtn');
			$(".zxf_pagediv").append('<span class="disabled">下一页</span>');
		} else{
			$(".zxf_pagediv").append('<a href="javascript:void(0);" class="nextbtn" onclick="nextpage('+data.currentpage+')">下一页</a>');
		}
		/*尾部*/
		$(".zxf_pagediv").append('<span>'+'共'+'<b>'+data.totalpage+'</b>'+'页，'+'</span>');
		$(".zxf_pagediv").append('<span>'+'到第'+'<input type="number" class="zxfinput" value=""/>'+'页'+'</span>');
		$(".zxf_pagediv").append('<span class="zxfokbtn" onclick="jump()">'+'确定'+'</span>');
	}
	