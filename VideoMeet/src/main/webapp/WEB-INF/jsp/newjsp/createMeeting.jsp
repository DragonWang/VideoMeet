<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>创建新事项</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<style>
		.nav-bar{
			height:60px;
			line-height:60px;
			color:rgb(255,255,255);
			background-color:rgb(0, 197, 195);
			margin-bottom:10px;
			font-size:16px;
		}
		#partner-num{
			font-weight: bold;
			border:none;
		}
		.sponsor{
			color:rgb(18, 150, 219);
		}
		.partner{
			color:rgb(19, 34, 122);
			animation-timing-function:linear;
			animation-iteration-count: infinite;
		}
		.add{
			color:rgb(26, 250, 41);
		}
		.delete{
			color:rgb(233, 143, 54);
		}
		.complete{
			display:none;
			color:rgb(26, 250, 41);
		}
		.popup-container{
			display: none;
		}
		.mask{
			width:100%;height:100%;
			position:absolute;
			top:0;left:0;
			z-index: 99;
			background-color: rgba(0,0,0,.3);
		}
		.popup{
			position:absolute;
			top:50%;left:50%;
			transform:translate(-50%,-50%);
			width:90%;height:170px;
			z-index:100;
			background-color: rgb(255,255,255);
			font-size: 18px;

		}
		.popup-title{
			height:50px;
			line-height: 50px;
			color:rgb(255,255,255);
			background-color:rgb(0, 197, 195);
		}
		.popup-content{
			height:70px;
			line-height: 70px;
			font-size: 16px;
			color:rgb(133,133,133);
		}
		.popup-confirm{
			height:50px;
			line-height: 50px;
			border-top:rgb(0, 197, 195) solid 1px;
		}
		.popup-confirm.active{
			background-color: rgb(234,234,234);
		}
	</style>
</head>
<body>
	<div class="nav-bar text-center">创建新事项</div>
	<div class="container">
		<form action="" novalidate onsubmit="return check()">
			<div class="form-group">
				<label for="title">会议主题</label>
				<input class="form-control" type="text"
				name="title" id="title" required placeholder="请输入会议主题">
			</div>
			<div class="form-group">
				<label for="">会议时间</label>
				<input class="form-control" type="datetime" name="datetime" id="datetimepicker" placeholder="点击选择会议时间" readonly required>
			</div>
			<div class="form-group">
				<label for="content">会议内容</label>
				<textarea class="form-control" name="content" id="content" cols="30" rows="3" placeholder="请输入会议内容" required></textarea>
			</div>
			<div class="partner-container">
				<div class="form-group">
					<label for="partner-num" class="control-label">参与人员&nbsp;&nbsp;</label>
					<input type="text" name="partner-num" id="partner-num" value="1">
				</div>

				<div class="row">
					<div class="sponsor col-xs-3 text-center center-block">
						<img src="image/sponsor.png" alt="" class="">
						<p>我</p>
					</div>
					<div class="partner-list"></div>
					<div class="add col-xs-3 text-center center-block">
						<img src="image/add.png" alt="" class="">
						<p>添加</p>
					</div>
					<div class="delete col-xs-3 text-center center-block">
						<img src="image/delete.png" alt="" class="">
						<p>删除</p>
					</div>
					<div class="complete col-xs-3 text-center center-block">
						<img src="image/complete.png" alt="" class="">
						<p>完成</p>
					</div>
					
				</div>
			</div>
			<div class="btn-group btn-block">
				<button type="submit" id="submit" class="btn btn-primary btn-block">创建</button>
				<button type="reset" class="btn btn-default btn-block">取消</button>
			</div>
		</form>
		<div class="popup-container">
			<div class="mask">
				<div class="popup text-center">
					<div class="popup-title">提示</div>
					<div class="popup-content" id="popup-content"></div>
					<div class="popup-confirm">确定</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/dialog.min.js"></script>
<script>
	var delSwitch=false;
	$('#datetimepicker').datetimepicker({
		 language:'zh-CN',
  		 format: 'yyyy-mm-dd hh:ii',
  		 autoclose: true,
  		 startDate:new Date(),
  		 todayBtn:'linked',
  		 forceParse:false,
  		 showMeridian:true,
	});
	function getPatnerNumber(){
		return parseInt($('#partner-num').val());
	}
	$('.add').click(function(){
		$('.partner-list').append('<div class="partner col-xs-3 text-center center-block animated" id="partner"><div class="do-delete"></div><img src="image/partner.png" alt="" class="partner-head"><p>其他人</p></div>');
		$('#partner-num').val(getPatnerNumber()+1);
	
	});
	$('.delete').click(function(){
		delSwitch=true;
		$('.partner').addClass('swing');
		$(this).hide();
		$('.add').hide();
		$('.complete').show();
		for(img of $('.partner-head')){	
			img.src='image/do-delete.png';
		}
	});
	$('.complete').click(function(){
		delSwitch=false;
		$('.partner').removeClass('swing');
		$('.do-delete').hide();
		$(this).hide();
		$('.add').show();
		$('.delete').show();
		for(img of $('.partner-head')){	
			img.src='image/partner.png';
		}
	});
	$(document).on("click", '#partner', function() {

  		console.log('clicked');
  		if(delSwitch){
				console.log($(this));
				$('#partner-num').val(getPatnerNumber()-1);
				$(this).hide();
				$(this).remove();
			}
    });
	
	function check(){
		var result=false;
		if($('#title').val()===""){
			$('#popup-content').text('请输入会议主题');
			$('#title').focus();
		}else if($('#datetimepicker').val()===""){
			$('#popup-content').text('请选择会议时间');
			$('#datetimepicker').focus();
		}else if($('#content').val()===""){
			$('#popup-content').text('请输入会议内容');
			$('#content').focus();
		}else if(getPatnerNumber()===1){
			$('#popup-content').text('请添加参与人员');
		}else{
			result=true;
		}
		if(!result){	    
	    	$('.popup-container').show();
	    }
	    return result;
	}
	$(document).on('click','.mask,.popup-confirm',function(){
		$('.popup-confirm').addClass('active');
		$('.popup-container').hide(500);
		$('.popup-confirm').removeClass('active');
	});

</script>
</html>