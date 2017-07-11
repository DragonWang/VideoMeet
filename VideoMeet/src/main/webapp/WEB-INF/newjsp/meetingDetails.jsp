<%@ page contentType="text/html;charset=UTF-8" language="java" %><html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>会议详情</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="css/main.css">
	<style>
		.nav-bar{
			height:60px;
			line-height:60px;
			color:rgb(255,255,255);
			background-color:rgb(0, 197, 195);
			margin-bottom:10px;
			font-size:16px;

			margin-bottom: 20px;
		}
		.resend{
			color:rgb(255,255,255);
			background-color: rgb(0, 197, 195);
		}
		.partner{
			margin-top: 30px;
		}
		.partner a:hover{
			background-color:background-color:rgb(234,234,234); 
		}

	</style>
</head>
<body>
	<div class="nav-bar text-center">会议详情</div>
	<div class="container">
		<table class="detail table">
			<tr>
				<th>会议ID</th><td>280</td>
			</tr>
			<tr>
				<th>会议主题</th><td>啦啦啦</td>
			</tr>
			<tr>
				<th>发起人</th><td>Jony J</td>
			</tr>
			<tr>	
				<th>会议时间</th><td>2017-07-03 09:56</td>
			</tr>
			
		</table>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button class="btn btn-primary join">加入会议</button>
			</div>
			<div class="btn-group">
				<button class="btn resend">重新发送通知</button>
			</div>
		</div>
		<div class="partner list-group">
			<b>成员列表</b>
			<a href="" class="list-group-item">Jony J</a>
			<a href="" class="list-group-item">Young Jack</a>
			<a href="" class="list-group-item">Tizzy T</a>
		</div>
		<div class="add hidden-md hidden-lg"><a href="createMeeting.html"><img src="image/add-2.png" alt=""></a></div>
</div>
		
	</div>
</body>
</script>
</html>