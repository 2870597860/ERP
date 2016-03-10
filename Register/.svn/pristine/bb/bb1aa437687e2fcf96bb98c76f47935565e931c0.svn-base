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
	SensorID_Name=Request.Form("SensorID_Name")
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
	top = "<sml:SensorML version=""1.0.1"" xsi:schemaLocation=""http://www.opengis.net/sensorML/1.0.1 http://schemas.opengis.net/sensorML/1.0.1/sensorML.xsd"" xmlns=""http://www.opengis.net/sensorML/1.0.1"" xmlns:sml=""http://www.opengis.net/sensorML/1.0.1"" xmlns:gml=""http://www.opengis.net/gml"" xmlns:swe=""http://www.opengis.net/swe/1.0.1"" xmlns:xlink=""http://www.w3.org/1999/xlink"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"">"&vbcrlf
	top = top&"  <sml:member>"&vbcrlf
	top = top&"    <sml:System gml:id=""InsituSensor"">"&vbcrlf
	top = top&"      <gml:description>"&Description_&"</gml:description>"&vbcrlf
	top = top&"      <gml:name>地面原位传感器</gml:name>"&vbcrlf
	top = top&"      <sml:identification>"&vbcrlf
	top = top&"        <sml:IdentifierList>"&vbcrlf
	top = top&"          <sml:identifier name=""标识码"">"&vbcrlf
	top = top&"            <sml:Term definition=""urn:ogc:def:identifier:OGC:1.0:uniqueID"">"&vbcrlf
	top = top&"              <sml:value>"&SensorID&"</sml:value>"&vbcrlf
	top = top&"            </sml:Term>"&vbcrlf
	top = top&"          </sml:identifier>"&vbcrlf
	top = top&"          <sml:identifier name=""全称"">"&vbcrlf
	top = top&"            <sml:Term definition=""urn:ogc:def:identifier:OGC:1.0:longName"">"&vbcrlf

	top = top&"              <sml:value>"&FullName&"</sml:value>"&vbcrlf
	top = top&"            </sml:Term>"&vbcrlf
	top = top&"          </sml:identifier>"&vbcrlf
	top = top&"          <sml:identifier name=""简称"">"&vbcrlf
	top = top&"            <sml:Term definition=""urn:ogc:def:identifier:OGC:1.0:shortName"">"&vbcrlf
	top = top&"              <sml:value>"&ShortName&"</sml:value>"&vbcrlf
	top = top&"            </sml:Term>"&vbcrlf
	top = top&"          </sml:identifier>"&vbcrlf
	top = top&"        </sml:IdentifierList>"&vbcrlf
	top = top&"      </sml:identification>"&vbcrlf
	top = top&"      <sml:classification>"&vbcrlf
	top = top&"        <sml:ClassifierList>"&vbcrlf
	top = top&"          <sml:classifier name=""传感器类型"">"&vbcrlf
	top = top&"            <sml:Term definition=""urn:ogc:def:classifier:OGC:1.0:sensorType"">"&vbcrlf
	top = top&"              <sml:value>土壤湿度计</sml:value>"&vbcrlf
	top = top&"            </sml:Term>"&vbcrlf
	top = top&"          </sml:classifier>"&vbcrlf
	top = top&"        </sml:ClassifierList>"&vbcrlf
	top = top&"      </sml:classification>"&vbcrlf
	top = top&"      <sml:capabilities>"&vbcrlf
	top = top&"        <swe:DataRecord definition=""urn:ogc:def:property:Liesmars:measurementCapabilities"">"&vbcrlf
	top = top&"          <swe:field name=""观测精度范围"">"&vbcrlf
	top = top&"            <swe:QuantityRange definition=""urn:ogc:def:property:measurementRMSRange"">"&vbcrlf
	top = top&"              <swe:uom code="""&Uom1&""" />"&vbcrlf
	top = top&"              <swe:value>"&MeasureRange1&" "&MeasureRange2&"</swe:value>"&vbcrlf
	top = top&"            </swe:QuantityRange>"&vbcrlf
	top = top&"          </swe:field>"&vbcrlf
	top = top&"          <swe:field name=""水份观测精度"">"&vbcrlf
	top = top&"            <swe:Quantity definition=""urn:ogc:def:property:measurementRMS"">"&vbcrlf
	top = top&"              <swe:uom code="""&Uom2&""" />"&vbcrlf
	top = top&"              <swe:value>"&Certainty&"</swe:value>"&vbcrlf
	top = top&"            </swe:Quantity>"&vbcrlf
	top = top&"          </swe:field>"&vbcrlf
	top = top&"          <swe:field name=""观测周期"">"&vbcrlf
	top = top&"            <swe:Quantity definition=""urn:ogc:def:property:measurementInterval"">"&vbcrlf
	top = top&"              <swe:uom code="""&Uom3&"""/>"&vbcrlf
	top = top&"              <swe:value>"&Interval&"</swe:value>"&vbcrlf
	top = top&"            </swe:Quantity>"&vbcrlf
	top = top&"          </swe:field>"&vbcrlf
	top = top&"        </swe:DataRecord>"&vbcrlf
	top = top&"      </sml:capabilities>"&vbcrlf
	top = top&"      <sml:contact  xlink:arcrole=""urn:ogc:def:role:operator"" >"&vbcrlf
	top = top&"        <sml:ResponsibleParty>"&vbcrlf
	top = top&"          <sml:organizationName>"&Unit&"</sml:organizationName>"&vbcrlf
	top = top&"          <sml:contactInfo>"&vbcrlf
	top = top&"            <sml:phone>"&vbcrlf
	top = top&"              <sml:voice>"&Telephone&"</sml:voice>"&vbcrlf
	top = top&"            </sml:phone>"&vbcrlf
	top = top&"            <sml:address>"&vbcrlf
	top = top&"              <sml:deliveryPoint>"&Address&"</sml:deliveryPoint>"&vbcrlf
	top = top&"              <sml:city>"&City&"</sml:city>"&vbcrlf
	top = top&"              <sml:administrativeArea>"&ManagerName&"</sml:administrativeArea>"&vbcrlf
	top = top&"              <sml:postalCode>"&PostCode&"</sml:postalCode>"&vbcrlf
	top = top&"              <sml:country>"&Country&"</sml:country>"&vbcrlf
	top = top&"              <sml:electronicMailAddress>"&Email&"</sml:electronicMailAddress>"&vbcrlf
	top = top&"            </sml:address>"&vbcrlf
	top = top&"          </sml:contactInfo>"&vbcrlf
	top = top&"        </sml:ResponsibleParty>"&vbcrlf
	top = top&"      </sml:contact>"&vbcrlf
	top = top&"      <sml:position name=""传感器位置"">"&vbcrlf
	top = top&"        <swe:Position fixed=""false"" referenceFrame=""urn:ogc:def:crs:EPSG:4329"">"&vbcrlf
	top = top&"          <swe:location>"&vbcrlf
	top = top&"            <swe:Vector definition=""urn:ogc:def:property:OGC:location"">"&vbcrlf
	top = top&"              <swe:coordinate name=""纬度"">"&vbcrlf
	top = top&"                <swe:Quantity axisID=""y"" definition=""urn:ogc:def:property:OGC:latitude"">"&vbcrlf
	top = top&"                  <swe:uom code=""deg"" />"&vbcrlf
	top = top&"                  <swe:value>"&Latitude&"</swe:value>"&vbcrlf
	top = top&"                </swe:Quantity>"&vbcrlf
	top = top&"              </swe:coordinate>"&vbcrlf
	top = top&"              <swe:coordinate name=""经度"">"&vbcrlf
	top = top&"                <swe:Quantity axisID=""x"" definition=""urn:ogc:def:property:OGC:longitude"">"&vbcrlf
	top = top&"                  <swe:uom code=""deg"" />"&vbcrlf
	top = top&"                  <swe:value>"&Longitude&"</swe:value>"&vbcrlf
	top = top&"                </swe:Quantity>"&vbcrlf
	top = top&"              </swe:coordinate>"&vbcrlf
	top = top&"              <swe:coordinate name=""高度"">"&vbcrlf
	top = top&"                <swe:Quantity axisID=""z"" definition=""urn:ogc:def:property:OGC:altitude"">"&vbcrlf
	top = top&"                  <swe:uom code=""m"" />"&vbcrlf
	top = top&"                  <swe:value>"&Position_Height&"</swe:value>"&vbcrlf
	top = top&"                </swe:Quantity>"&vbcrlf
	top = top&"              </swe:coordinate>"&vbcrlf
	top = top&"            </swe:Vector>"&vbcrlf
	top = top&"          </swe:location>"&vbcrlf
	top = top&"        </swe:Position>"&vbcrlf
	top = top&"      </sml:position>"&vbcrlf
	top = top&"      <sml:interfaces>"&vbcrlf
	top = top&"        <sml:InterfaceList>"&vbcrlf
	top = top&"          <sml:interface name=""BaoxieWeatherStation-LVDSC12_SOS"">"&vbcrlf
	top = top&"            <sml:InterfaceDefinition>"&vbcrlf
	top = top&"              <sml:serviceLayer>"&vbcrlf
	top = top&"                <swe:DataRecord definition=""urn:ogc:def:interface:OGC:1.0:SWEServiceInterface"">"&vbcrlf
	top = top&"                  <swe:field name=""urn:ogc:def:interface:OGC:1.0:ServiceURL"">"&vbcrlf
	top = top&"                    <swe:Text>"&vbcrlf
	top = top&"                      <swe:value>http://202.121.197.111:84/SOS_E/sos</swe:value>"&vbcrlf
	top = top&"                    </swe:Text>"&vbcrlf
	top = top&"                  </swe:field>"&vbcrlf
	top = top&"                  <swe:field name=""urn:ogc:def:interface:OGC:1.0:ServiceType"">"&vbcrlf
	top = top&"                    <swe:Text>"&vbcrlf
	top = top&"                      <swe:value>SOS</swe:value>"&vbcrlf
	top = top&"                    </swe:Text>"&vbcrlf
	top = top&"                  </swe:field>"&vbcrlf
	top = top&"                  <swe:field name=""urn:ogc:def:interface:OGC:1.0:ServiceSpecificSensorID"">	"&vbcrlf
	top = top&"                    <swe:Text>"&vbcrlf
	top = top&"						 <swe:value>urn:liesmars:insitusensor:BaoxieWeatherStation-LVDSC12</swe:value>"&vbcrlf
	top = top&"                    </swe:Text>"&vbcrlf
	top = top&"                  </swe:field>"&vbcrlf
	top = top&"                </swe:DataRecord>"&vbcrlf
	top = top&"              </sml:serviceLayer>"&vbcrlf
	top = top&"            </sml:InterfaceDefinition>"&vbcrlf
	top = top&"          </sml:interface>"&vbcrlf
	top = top&"        </sml:InterfaceList>"&vbcrlf
	top = top&"      </sml:interfaces>"&vbcrlf
	top = top&"      <sml:outputs>"&vbcrlf
	top = top&"        <sml:OutputList>"&vbcrlf
for i=1 to outputCount
	top = top&"          <sml:output name="""&OutputName(i-1)&""">"&vbcrlf
	top = top&"            <swe:Quantity definition=""urn:ogc:def:property:OGC:1.0:soilHumidity"">"&vbcrlf
	top = top&"			  <gml:metaDataProperty>"&vbcrlf
	top = top&"			 	<offering>"&vbcrlf
	top = top&"				  <id>SHUSVI</id>"&vbcrlf
	top = top&"				  <name>上海大学视频与空间信息学科组</name>"&vbcrlf
	top = top&"				</offering>"&vbcrlf
	top = top&"			  </gml:metaDataProperty>"&vbcrlf
	top = top&"              <swe:uom code="""&OutputUom(i-1)&""" />"&vbcrlf
	top = top&"            </swe:Quantity>"&vbcrlf
	top = top&"          </sml:output>"&vbcrlf
next
	'---------------------------------------------------------------------------------------------------------

	'----------------------------------------------------------------------------------------------------------
	top = top&"        </sml:OutputList>"&vbcrlf
	top = top&"      </sml:outputs>"&vbcrlf
	top = top&"      <sml:components />"&vbcrlf
	top = top&"    </sml:System>"&vbcrlf
	top = top&"  </sml:member>"&vbcrlf
	top = top&"</sml:SensorML>"&vbcrlf
	if SensorID ="" then 
	%>
    <script language="javascript">
		alert("请生成SensorID!");
		
	</script>
	<%
				else
		if outputCount="0" then
	%>
    	 <script language="javascript">
		alert("请至少增加一个输出!");
		
	</script>
    <%
		else
	bottom=""
	msg=request.Form("msg")
	msg=replace(msg,vbcrlf,"")'将回车替换为无
	msg=replace(msg,chr(9),"")'将tab键替换为无
	msg=replace(msg," ","&nbsp;")'将空格显式表示
	msg=replace(msg,"\r\n","<br>")'将换行用回车表示
	msg=replace(msg,"\n","<br>")
	msg=top&msg&bottom
	Set fs=Server.CreateObject("Scripting.FileSystemObject")'创建一个名字为fs的Scripting.FileSystemObject(fso)服务器组件
	all_tree2=server.MapPath("SimpleRegister")'返回news所在的物理路径+"\"+日期
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
	'response.Write("file1:"&file1)
	

	file1=SensorID_Name
	files=file1&".xml"
	filez=all_tree2&"\"&files
		if fs.FileExists(filez) then
		Response.Write "<script>window.location.reload();alert('"""&SensorID_Name&"""已经存在！请修改ID或对原xml文档进行修改！');window.location='/WebContent/index.html'</script>"		
		
		else

				call Generation_File(SensorID_Name&".xml","./SimpleRegister",content)
		
		end if
			
	if err.number<>0 or err then %>
	<script language="javascript">
		//alert("not work")
	</script>
    <%else%>
    <script language="javascript">
		//alert("传感器注册成功！")
		history.back();
	</script>
    <%
		end if
		Set MyFile=fs.GetFile(filez)
		all_tree2=server.MapPath("SimpleRegister")
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
		end if
	end if
	
	'******************************************
'功能：生成UTF-8文件
'参数：File_name 文件名
'参数：File_path 生成文件所在相对目录
'参数：content   写入内容
'******************************************
sub Generation_File(File_name,File_path,content)
	mappath = File_path&"/"&File_name
	Set objStream = Server.CreateObject("ADODB.Stream")
	With objStream
	.Open
	.Charset = "utf-8"
	.Position = objStream.Size
	.WriteText=content
	.SaveToFile server.mappath(mappath),2
	.Close
	End With
	Set objStream = Nothing
		response.write("<script language=JavaScript> alert(':::生成文件成功:::'); </script>")
end sub
'******************************************
'功能：获得写入文件的内容
'返回：content
'******************************************
function content()
	content = msg
end function
	%>
    
</body>
</html>
