	$(".submit").click(function(){
		var ajaxUrl = "linkControl.jsp";
		$.ajax({
			type:"POST",
			dateType:"html",
			url: ajaxUrl,
			data: $("#linkControlForm").serialize(),
			success: function(response){
				alert("修改成功");
				window.location.reload();
			},
			error:function(response){
				alert("error:"+response.responseText);
			}
		});
	});
	
	
	$(document).ready(function(){
		$("#table").dataTable({
			"language": {
//				"url": "../files/zh-CN_dataTables.txt",
				"lengthMenu": "每页 _MENU_ 条记录",
				"zeroRecords": "没有找到记录",
				"info": "第 _PAGE_ 页",
				"infoEmpty": "无记录",
				"infoFiltered": "从 _MAX_ 条记录过滤",
				"search": "搜索：",
				"paginate": {
					"first": "首页",
					"previous": "上页",
					"next": "下页",
					"last": "末页",
				},
				"loadingRecords": "载入中...",
			},
		});
	});