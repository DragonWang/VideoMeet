<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>多方视频会议</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="css/dropload.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/animate.css">
	<style>
		.item-time{
			color:rgb(0, 197, 195);
			font-size:16px;
		}
		@media (min-width:992px){
			.list-container{
				position:relative;
				top:-45px;
			}
		}
		
	</style>
</head>
<body>
	<div class="head-bar text-center">多方视频会议</div>
	<div class="container text-center">
		<div class="tab-container clearfix">
			<!-- 移动端页面显示的标签 -->
			<div class="mobile-tab-container row hidden-md hidden-lg">
				<div class="tab mobile-tab col-xs-6 selected">我发起的</div>
				<div class="tab mobile-tab col-xs-6">我收到的</div>
			</div>
			<!-- PC端页面显示的标签 -->
			<ul class="pc-tab-container nav nav-pills nav-stacked navbar-left  hidden-xs hidden-sm">
				<li class="tab pc-tab selected">我发起的</li>
				<li class="tab pc-tab">我收到的</li>
			</ul>		
		</div>
		<div class="list-container">
			<div class="list list-1 text-left animated" id="list-1"></div>
			<div class="list list-2 text-left animated"></div>
		</div>
		<div class="add hidden-md hidden-lg"><a href="createMeeting.html"><img src="image/add-2.png" alt=""></a></div>

		<!-- 分页器，此处用的是bootstrap的样式，所以没有去除a标签  -->
		<ul class="pagination hidden-xs hidden-sm">
			<li><a href="">&laquo;</a></li>
			<li class="active"><a>1</a></li>
			<li><a>2</a></li>
			<li><a>3</a></li>
			<li><a>4</a></li>
			<li><a>5</a></li>
			<li><a>&raquo;</a></li>
		</ul>	
	</div>
</body>
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/dropload.min.js"></script>
<script src="js/main.js"></script>
<script>
	var itemIndex=0; //数据条目索引
	var pageIndex=0;  //数据分页索引
	$.get('mutilMeeting.txt',function(data){
		var obj=JSON.parse(data);
		console.log(obj);
		for(;itemIndex<10;itemIndex++){
			result = '<div class="item"><a href="meetingDetails.html"><div class="item-time"><b>'+obj.videoMeetInfoList[itemIndex].meetDatetime+'</b></div><div class="item-theme">会议主题:'+obj.videoMeetInfoList[itemIndex].meetSubject+'</div><div class="item-id">会议ID&nbsp;&nbsp;&nbsp;&nbsp;'+obj.videoMeetInfoList[itemIndex].meetId+'</div></a></div>';
			$('.list-1').append(result);
			$('.list-2').append(result);
		}
	});
	
	//下拉刷新，上拉加载事件对象
	var droploadDownObj={
		scrollArea:window,
		loadUpFn:function(me){
			$.get('mutilMeeting.txt',function(data){
				var obj=JSON.parse(data);
				for(let i=0;i<10 && itemIndex<obj.videoMeetInfoList.length;i++){
					result = '<div class="item"><a href="meetingDetails.html"><div class="item-time"><b>'+obj.videoMeetInfoList[itemIndex].meetDatetime+'</b></div><div class="item-theme">会议主题:'+obj.videoMeetInfoList[itemIndex].meetSubject+'</div><div class="item-id">会议ID&nbsp;&nbsp;&nbsp;&nbsp;'+obj.videoMeetInfoList[itemIndex].meetId+'</div></a></div>';
			            $('.list').eq(currentIndex).append(result);
						itemIndex++;
				}
			});
			me.resetload();
	        scrollToEnd();
			
		},
		loadDownFn:function(me){
			$.get('mutilMeeting.txt',function(data){
				var obj=JSON.parse(data);
				for(let i=0;i<10 && itemIndex<obj.videoMeetInfoList.length;i++){
					result = '<div class="item"><a href="meetingDetails.html"><div class="item-time"><b>'+obj.videoMeetInfoList[itemIndex].meetDatetime+'</b></div><div class="item-theme">会议主题:'+obj.videoMeetInfoList[itemIndex].meetSubject+'</div><div class="item-id">会议ID&nbsp;&nbsp;&nbsp;&nbsp;'+obj.videoMeetInfoList[itemIndex].meetId+'</div></a></div>';
			            $('.list').eq(currentIndex).append(result);
						itemIndex++;
				}
			});
			me.resetload();
	        scrollToEnd();
		}
	};

	$('.list-1').dropload(droploadDownObj);
	$('.list-2').dropload(droploadDownObj);

	$('li a').click(function(){
		$('li').removeClass('active');
		$(this).parent().addClass('active');
		$('.list').eq(currentIndex).children().addClass('hidden-md hidden-lg');
		$.get('mutilMeeting.txt',function(data){
				var obj=JSON.parse(data);
				for(let i=0;i<10 && itemIndex<obj.videoMeetInfoList.length;i++){
					result = '<div class="item"><a href="meetingDetails.html"><div class="item-time"><b>'+obj.videoMeetInfoList[itemIndex].meetDatetime+'</b></div><div class="item-theme">会议主题:'+obj.videoMeetInfoList[itemIndex].meetSubject+'</div><div class="item-id">会议ID&nbsp;&nbsp;&nbsp;&nbsp;'+obj.videoMeetInfoList[itemIndex].meetId+'</div></a></div>';
			            $('.list').eq(currentIndex).append(result);
						itemIndex++;
				}
		});
	});

</script>
</html>