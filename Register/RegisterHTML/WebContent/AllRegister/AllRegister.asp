<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<body>
<%
	function chan_time(shijian)		
	s_year=year(shijian)'设定年
	if len(s_year)=2 then s_year="20"&s_year'补全"20"14
	s_month=month(shijian)'设定月
	if s_month<10 then s_month="0"&s_month'补全"0"8月
	s_day=day(shijian)
	if s_day<10 then s_day="0"&s_day
	s_hour=hour(shijian)
	if s_hour<10 then s_hour="0"&s_hour
	s_minute=minute(shijian)
	if s_minute<10 then s_minute="0"&s_minute
	chan_time = s_year &s_month&s_day&s_hour&s_minute
	end function
	'精确到分钟
	
	function chan_data(shijian)
	s_year = year(shijian)
	if len(s_year) = 2 then s_year="20"&s_year
	s_month = month(shijian)
	if s_month < 10 then s_month="0"&s_month
	s_day = day(shijian)
	if s_day < 10 then s_day = "0"&s_day
	chan_data=s_year&s_month&s_day
	end function
	'精确到天
	
	function chan_file(shijian)
	s_month=month(shijian)
	if s_month<10 then s_month="0"&s_month
	s_day = day(shijian)
	if s_day<10 then s_day="0"&s_day
	s_hour = hour(shijian)
	if s_hour <10 then s_hour="0"&s_hour
	s_minute = minute(shijian)
	if s_minute<10 then s_minute="0"&s_minute
	s_ss=second(shijian)
	if s_ss<10 then s_ss="0"&s_ss
	chan_file=s_month&s_day&s_hour&s_minute&s_ss
	end function
	'精确到秒chan_file是从月直到秒
	
	top = "<html><head><title>news</title></head><body>"
	bottom="</body></html>"
	msg=request.Form("msg")
	msg=replace(msg,vbcrlf,"")'将回车替换为无
	msg=replace(msg,chr(9),"")'将tab键替换为无
	msg=replace(msg," ","&nbsp;")'将空格显式表示
	msg=replace(msg,"\r\n","<br>")'将换行用回车表示
	msg=replace(msg,"\n","<br>")
	msg=top&msg&bottom
	Set fs=Server.CreateObject("Scripting.FileSystemObject")'创建一个名字为fs的Scripting.FileSystemObject(fso)服务器组件
	all_tree2=server.MapPath("AllRegister")&"\"&chan_data(now)'返回news所在的物理路径+"\"+日期
	if(fs.FolderExists(all_tree2))	then
	else
		fs.CreateFolder(all_tree2)'创建news下面的文件夹（日期）
	end if
	pass=chan_file(now)
'	randomize
'	response.Write("pass1:"&pass)
	'pass=rnd(pass)
	'response.Write("pass2:"&pass)
	'pass=get_pass(pass)
	'response.Write("pass3:"&pass)
	'pass=left(pass,10) 
	'response.Write("pass4:"&pass)
	file1=pass
'	response.Write("file1:"&file1)
	files=file1&".xml"
	filez=all_tree2&"\"&files
	response.Write("filez"&filez)
	set ts=fs.createtextfile(filez,true)'true表示使用unicode，false表示使用ascii
	for z=1 to len(msg)
	write_now=mid(msg,z,1)
	ts.write(write_now)
	next
	'ts.writeline(all_msg)
	ts.close
	set ts=nothing
	
	if err.number<>0 or err then %>
	<script language="javascript">
		alert("not work")
	</script>
    <%else%>
    <script language="javascript">
		alert("OK")
		history.back();
	</script>
    <%
		end if
		Set MyFile=fs.GetFile(filez)
		all_tree2=server.MapPath("AllRegister"&"\"&chan_data(now))
		if(fs.FolderExists(all_tree2)) then
		else
		fs.CreateFolder(all_tree2)
		end if
		
	'	MyFile.name=left(MyFile.name,len(MyFile.name))&".xml"
	'	set MyFile=nothing
		set fs=nothing
		set fdir=nothing
		
		function get_pass(pass)
			pass=cstr(pass)
			pass=replace(pass," ","")
			pass=replace(pass," ","")
			pass=replace(pass,"-","")
			pass=replace(pass," ","")
			pass=replace(pass,":","")
			pass=replace(pass,"-","")
			pass=replace(pass,"+","")
			pass=replace(pass,"_","")
			pass=replace(pass,"<","")
			pass=replace(pass,">","")
			pass=replace(pass,"!","")
			pass=replace(pass,"@","")
			get_pass=pass
			
			
		end function
		
	%>
</body>
</html>
