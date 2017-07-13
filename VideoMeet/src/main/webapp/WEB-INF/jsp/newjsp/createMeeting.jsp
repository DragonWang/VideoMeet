<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>创建新事项</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
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
		.partner-num{
			font-weight: bold;
			margin-bottom: 5px;
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
		
	</style>
</head>
<body>
	<div class="nav-bar text-center">创建新事项</div>
	<div class="container">
		<form action="">
			<div class="form-group">
				<label for="title">会议主题</label>
				<input class="form-control" type="text"
				name="title" id="title" placeholder="请输入会议主题">
			</div>
			<div class="form-group">
				<label for="">会议时间</label>
				<input class="form-control" type="datetime" name="datetime" id="datetimepicker" value="2017-7-6 16:44" >
			</div>
			<div class="form-group">
				<label for="content">会议内容</label>
				<textarea class="form-control" name="content" id="content" cols="30" rows="3" placeholder="请输入会议内容"></textarea>
			</div>
			<div class="partner-container">
				<div class="partner-num" id="partner-num">参与人员(<span>4</span>)</div>
				<div class="row">
					<div class="sponsor col-xs-3 text-center center-block">
						<img src="image/sponsor.png" alt="" class="">
						<p>我</p>
					</div>
					<div class="partner-list">
						<div class="partner col-xs-3 text-center center-block animated" id="partner">
							<div class="do-delete"></div>
							<img src="image/partner.png" alt="" class="partner-head">
							<p>A</p>
						</div>
						<div class="partner col-xs-3 text-center center-block animated" id="partner">
							<div class="do-delete"></div>
							<img src="image/partner.png" alt="" class="partner-head">
							<p>B</p>
						</div>
						<div class="partner col-xs-3 text-center center-block animated" id="partner">
							<div class="do-delete"></div>
							<img src="image/partner.png" alt="" class="partner-head">
							<p>C</p>
						</div>
					</div>
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
				<button class="btn btn-primary btn-block">创建</button>
				<button class="btn btn-default btn-block">取消</button>
			</div>

		</form>
	</div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
		return parseInt($('#partner-num span').html());
	}
	$('.add').click(function(){
		$('.partner-list').append('<div class="partner col-xs-3 text-center center-block animated" id="partner"><div class="do-delete"></div><img src="image/partner.png" alt="" class="partner-head"><p>其他人</p></div>');
		$('#partner-num span').html(getPatnerNumber()+1);
	
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
				$('#partner-num span').html(getPatnerNumber()-1);
				$(this).hide();
				$(this).remove();
			}
    });




</script>
</html>