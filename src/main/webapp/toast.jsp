<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toast</title>
<style>
	#toast{
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -120px;
	background: #333;
	color: white;
	text-align: center;
	z-index: 1;
	font-size:18px;
	visiblity: hidden;
	box-shadow: 0px 0px 100px #000;
	} 
	#toast.display{
		visiblity: visible;
		animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
	}
	@keyframes fadeIn{
		from{
			bottom: 0;
			opacity: 1;
		}
		to{
			bottom: 30px;
			opacity: 1;
		}
	}
	@keyframes fadeOut{
		from {
			bottom: 30px;
			opacity: 1;
		}
		to {
			bottom: 0;
			opacity: 0;
		}
	}
	
</style>
</head>
<body>
<h1>Toast Tutorial</h1>
<button onclick="showToast("THis is KEsahav")">Click Me</button>
<div id="toast">
	This is our custom toast text
</div>
<script>
	function showToast(content)
	{
		$('#toast').addClass("display");
		$('#toast').html(content);
		setTimeout( ()=>{
			$("#toast").removeClass("display");		
	}, 2000);
	}
</script>


</body>
</html>