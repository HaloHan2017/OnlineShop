function GetDate(mils)
{
  var d,s;
  d = new Date(mils);
  s = d.getFullYear() + "-";             //取年份
  s += (d.getMonth()+1 < 10 ? '0'+(d.getMonth()+1) : d.getMonth()+1) + '-';//取月份
  s += d.getDate()<10 ? '0'+d.getDate()+ " " : d.getDate() + " ";         //取日期
  s += d.getHours()<10 ? '0'+d.getHours()+ ":" : d.getHours() + ":";       //取小时
  s += d.getMinutes()<10 ? '0'+d.getMinutes()+ ":" : d.getMinutes() +":";    //取分
  s += d.getSeconds()<10 ? '0'+d.getSeconds() : d.getSeconds();         //取秒
  return(s);  
} 
function randomColor(i){
	var colorArr=new Array('#D15B47',"#87CEEB","#87B87F","#d63116","#ff6600","#2ab023","#1e3ae6","#c316a9");
    //return '#'+Math.floor(Math.random()*256).toString(10);
	return colorArr[i];
}
function GetStatus(data){
	alert(data);
	 if(data=='0'){
		 return "<span class='label label-success radius'>待付款</span>";
	 }else if(data=='1'){
		 return "<span class='label label-danger radius'>待发货</span>";
	 }else if(data=='2'){
		 return "<span class='label label-primary radius'>已发货</span>";
	 }else if(data=='3'){
		 return "<span class='label label-warm radius'>已收货</span>";
	 }else if(data=='4'){
		 return "<span class='label label-success radius'>已评价</span>";
	 }else if(data=='-1'){
		 return "<span class='label label-failed radius'>失效</span>";
	 }else if(data=='-2'){
		 return "<span class='label label-failed radius'>待退款</span>";
	 }else {
		 return "<span class='label label-success radius'>已退款</span>";
	 }
}
function GetDesc(desc){
	if(desc==null || desc==''){
		return "暂无详细说明";
	}
	return desc;
}

