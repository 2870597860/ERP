		function divControl(show,num){
			if(show==1){
				hidediv();
				hidemenu3();
				showdiv(num);
			}else{
				keepstyle();
			}
		}
		function showdiv(num){
				$("#Div"+num).css("display","block");
			}
		function hidediv(){
			$("#Div1").css("display","none");
			$("#Div2").css("display","none");
			$("#Div3").css("display","none");
			}
		function keepstyle(){
				hidediv();
			}
		function show(menu3_id){
			hidemenu3();
			$("#"+menu3_id).css("display","block");
		}
		function hidemenu3(){
			$(".menu3").css("display","none");
		}
		function startChange(){
			if(opacityCount>=1/opacityPer){
				state="fadeOut";
			}else if(opacityCount<0){
				if(photoNum==5){
					photoNum=1;
					$(".photo").attr("src","pic/Photoshow"+photoNum+".jpg");
				}else{
					photoNum++;
					$(".photo").attr("src","pic/Photoshow"+photoNum+".jpg");
				}
				state="fadeIn";
			}
			if(state=="fadeIn"){
				opacityCount++;
				$(".photo").css("opacity",opacityCount*opacityPer);
			}else{
				opacityCount--;
				$(".photo").css("opacity",opacityCount*opacityPer);
			}
		}
		function stopChange(){
			
		}
