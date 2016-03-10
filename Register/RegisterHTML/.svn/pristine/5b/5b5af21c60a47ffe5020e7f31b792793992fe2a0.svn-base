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
	SensorID=Request.Form("SensorID")
	Output1=Request.Form("Output1")
	Output1_Name=Request.Form("Output1_Name")
	Output1_Uom=Request.Form("Output1_Uom")
	Output2=Request.Form("Output2")
	Output2_Name=Request.Form("Output2_Name")
	Output2_Uom=Request.Form("Output2_Uom")
	Output3=Request.Form("Output3")
	Output3_Name=Request.Form("Output3_Name")
	Output3_Uom=Request.Form("Output3_Uom")
	Output4=Request.Form("Output4")
	Output4_Name=Request.Form("Output4_Name")
	Output4_Uom=Request.Form("Output4_Uom")
	Output5=Request.Form("Output5")
	Output5_Name=Request.Form("Output5_Name")
	Output5_Uom=Request.Form("Output5_Uom")
	FullName=Request.Form("FullName")
	ShortName=Request.Form("ShortName")
	Description_=Request.Form("Description")
	MeasureRange1=Request.Form("MeasureRange1")
	MeasureRange2=Request.Form("MeasureRange2")
	Uom1=Request.Form("Uom1")
	Uom2=Request.Form("Uom2")
	Uom3=Request.Form("Uom3")
	Certainty=Request.Form("Certainty")
	Interval=Request.Form("Interval")
	Longitude=Request.Form("Longitude")
	Latitude=Request.Form("Latitude")
	Position_Height=Request.Form("Position_Height")
	ManagerName=Request.Form("ManagerName")
	Unit=Request.Form("Unit")
	Telephone=Request.Form("Telephone")
	Address=Request.Form("Address")
	City=Request.Form("City")
	Country=Request.Form("Country")
	PostCode=Request.Form("PostCode")
	Email=Request.Form("Email")
	outputCount=Request.Form("outputCount")
	Output = Array("1","2","3","4","5")
	OutputName=Array("N1","N2","N3","N4","N5")
	OutputUom=Array("U1","U2","N3","N4","N5")
	for i=1 to outputCount
		Output(i-1)=Request.Form("Output"&i)
		OutputName(i-1)=Request.Form("Output"&i&"_Name")
		OutputUom(i-1)=Request.Form("Output"&i&"_Uom")
	next
	'Response.Write("insititude:"&Request.Form("insititude")& "    ")

	'insititude
	top = "<?xml version=""1.0"" encoding=""UTF-8""?>"&vbcrlf
	top = top&"<RegisterSensor service=""SOS"" version=""1.0.0"" xmlns=""http://www.opengis.net/sos/1.0"""&vbcrlf
	top = top&"xmlns:swe=""http://www.opengis.net/swe/1.0.1"" "&vbcrlf
	top = top&"xmlns:ows=""http://www.opengeospatial.net/ows"" "&vbcrlf
	top = top&"xmlns:xlink=""http://www.w3.org/1999/xlink"" xmlns:gml=""http://www.opengis.net/gml"""&vbcrlf
	top = top&"xmlns:ogc=""http://www.opengis.net/ogc"" xmlns:om=""http://www.opengis.net/om/1.0"""&vbcrlf
	top = top&"xmlns:sml=""http://www.opengis.net/sensorML/1.0.1"" "&vbcrlf
	top = top&"xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" "&vbcrlf
	top = top&"xsi:schemaLocation=""http://www.opengis.net/sos/1.0"&vbcrlf
	top = top&"http://schemas.opengis.net/sos/1.0.0/sosRegisterSensor.xsd http://www.opengis.net/om/1.0"&vbcrlf
	top = top&"http://schemas.opengis.net/om/1.0.0/extensions/observationSpecialization_override.xsd"">"&vbcrlf
	top = top&"	<SensorDescription>"&vbcrlf
	top = top&"		<sml:SensorML version=""1.0.1"">"&vbcrlf
	top = top&"			<sml:member>"&vbcrlf
	top = top&"				<sml:System xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"">"&vbcrlf
	top = top&"					<sml:identification>"&vbcrlf
	top = top&"						<sml:IdentifierList>"&vbcrlf
	top = top&"							<sml:identifier>"&vbcrlf
	top = top&"								<sml:Term definition=""urn:ogc:def:identifier:OGC:uniqueID"">"&vbcrlf
							'-----------------SensorID-------------------------------------
	top = top&"	<sml:value>"&SensorID&"</sml:value>"&vbcrlf
	top = top&"								</sml:Term>"&vbcrlf	
	top = top&"							</sml:identifier>"&vbcrlf
	top = top&"						</sml:IdentifierList>"&vbcrlf
	top = top&"					</sml:identification>"&vbcrlf	
	'----------------------------------OutputList----------------------------------------
	top = top&"					<sml:outputs>"&vbcrlf
	top = top&"						<sml:OutputList>"&vbcrlf
						'----------------1
										for i=0 to outputCount-1
															'-----输出1属性---
	top = top&"							<sml:output name="""&OutputName(i)&""">"&vbcrlf	
																		  '---输出1ID------------------------------------------------
	top = top&"								<swe:Quantity definition="""&"urn:liesmars:def:phenomenon:LIESMARS:1.0.0:"&OutputName(i)&""">"&vbcrlf
	top = top&"									<gml:metaDataProperty>"&vbcrlf	
	top = top&"										<offering>"&vbcrlf
	top = top&"											<id>LIESMARS</id>"&vbcrlf
	top = top&"											<name>测绘遥感信息工程国家重点实验室(武汉大学)</name>"&vbcrlf	
	top = top&"										</offering>"&vbcrlf
	top = top&"									</gml:metaDataProperty>"&vbcrlf
																 '输出1单位
	top = top&"									<swe:uom code="""&OutputUom(i)&"""/>"&vbcrlf	
	top = top&"								</swe:Quantity>"&vbcrlf
	top = top&"							</sml:output>"&vbcrlf
										next
						'-----------------2
															'--输出2属性--
	top = top&"							<sml:output name="""&"WindSpeed"&""">"&vbcrlf	
																		'----输出2ID------------------------------------------------
	top = top&"								<swe:Quantity definition="""&"urn:liesmars:def:phenomenon:LIESMARS:1.0.0:WindSpeed"&""">"&vbcrlf
	top = top&"									<gml:metaDataProperty>"&vbcrlf
	top = top&"										<offering>"&vbcrlf	
	top = top&"											<id>LIESMARS</id>"&vbcrlf
	top = top&"											<name>测绘遥感信息工程国家重点实验室(武汉大学)</name>"&vbcrlf
	top = top&"										</offering>"&vbcrlf	
	top = top&"									</gml:metaDataProperty>"&vbcrlf
	top = top&"									<swe:uom code=""m/s""/>"&vbcrlf
	top = top&"								</swe:Quantity>"&vbcrlf	
	top = top&"							</sml:output>"&vbcrlf
						'-----------------3
	top = top&"							<sml:output name=""WindDirection"">"&vbcrlf
	top = top&"								<swe:Quantity definition=""urn:liesmars:def:phenomenon:LIESMARS:1.0.0:WindDirection"">"&vbcrlf
	top = top&"									<gml:metaDataProperty>"&vbcrlf
	top = top&"										<offering>"&vbcrlf	
	top = top&"											<id>LIESMARS</id>"&vbcrlf
	top = top&"											<name>测绘遥感信息工程国家重点实验室(武汉大学)</name>"&vbcrlf	
	top = top&"										</offering>"&vbcrlf	
	top = top&"									</gml:metaDataProperty>"&vbcrlf	
	top = top&"									<swe:uom code=""degree""/>"&vbcrlf	
	top = top&"								</swe:Quantity>"&vbcrlf	
	top = top&"							</sml:output>"&vbcrlf	
						'-----------------
	top = top&"						</sml:OutputList>"&vbcrlf	
	top = top&"					</sml:outputs>"&vbcrlf	
	'---------------------------OutputListEnd------------------------------------------
	top = top&"				</sml:System>"&vbcrlf	
	top = top&"			</sml:member>"&vbcrlf	
	top = top&"		</sml:SensorML>"&vbcrlf	
	top = top&"	</SensorDescription>"&vbcrlf	
	top = top&"	<ObservationTemplate>"&vbcrlf	
	top = top&"		<om:Observation>"&vbcrlf	
	top = top&"			<om:samplingTime/>"&vbcrlf	
	top = top&"			<om:procedure/>"&vbcrlf	
	top = top&"			<om:observedProperty/>"&vbcrlf	
	top = top&"			<om:featureOfInterest/>"&vbcrlf	
	top = top&"			<om:result/>"&vbcrlf	
	top = top&"		</om:Observation>"&vbcrlf	
	top = top&"	</ObservationTemplate>"&vbcrlf	
	top = top&"</RegisterSensor>"&vbcrlf	

	bottom="</body></html>"
	msg=request.Form("msg")
	msg=replace(msg,vbcrlf,"")'将回车替换为无
	msg=replace(msg,chr(9),"")'将tab键替换为无
	msg=replace(msg," ","&nbsp;")'将空格显式表示
	msg=replace(msg,"\r\n","<br>")'将换行用回车表示
	msg=replace(msg,"\n","<br>")
	msg=top&msg&bottom
	Set fs=Server.CreateObject("Scripting.FileSystemObject")'创建一个名字为fs的Scripting.FileSystemObject(fso)服务器组件
	all_tree2=server.MapPath("SimpleRegister")&"\"&chan_data(now)'返回news所在的物理路径+"\"+日期
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
	'response.Write("filez"&filez)
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
		all_tree2=server.MapPath("SimpleRegister"&"\"&chan_data(now))
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
