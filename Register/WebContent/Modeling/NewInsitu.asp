<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<body>
<a href="http://localhost:83/">返回</a>
<%

	'精确到秒chan_file是从月直到秒
	SensorID=Request.Form("SensorID")
	SensorID_Name=Request.Form("SensorID_Name")
	FullName=Request.Form("FullName")
	ShortName=Request.Form("ShortName")
	Description_=Request.Form("Description")
	Style=Request.Form("TypeSelect")
	Property_=Request.Form("PropertySelect")
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
	top = top&"      <gml:name>地面原位传感器 </gml:name>"&vbcrlf
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
	top = top&"              <sml:value>"&Style&"</sml:value>"&vbcrlf
	top = top&"            </sml:Term>"&vbcrlf
	top = top&"          </sml:classifier>"&vbcrlf
	top = top&"          <sml:classifier name=""传感器观测属性"">"&vbcrlf
	top = top&"            <sml:Term definition=""urn:ogc:def:classifier:OGC:1.0:sensorType"">"&vbcrlf
	top = top&"              <sml:value>"&Property_&"</sml:value>"&vbcrlf
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
	top = top&"          <swe:field name=""观测精度"">"&vbcrlf
	top = top&"            <swe:Quantity definition=""urn:ogc:def:property:measurementRMS"">"&vbcrlf
	top = top&"              <swe:uom code="""&Uom2&""" />"&vbcrlf
	top = top&"              <swe:value>"&Certainty&" </swe:value>"&vbcrlf
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
	top = top&"                      <swe:value>http://202.121.197.111:84/SOS_Echo/sos</swe:value>"&vbcrlf
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
	top = top&"            <swe:Quantity definition=""urn:ogc:def:property:OGC:1.0:"&OutputName(i-1)&""">"&vbcrlf
	top = top&"			  <gml:metaDataProperty>"&vbcrlf
	top = top&"			 	<offering>"&vbcrlf
	top = top&"				  <id>SHUSVI</id>"&vbcrlf
	top = top&"				  <name>上海大学视频与空间信息学科组 </name>"&vbcrlf
	top = top&"				</offering>"&vbcrlf
	top = top&"			  </gml:metaDataProperty>"&vbcrlf
	top = top&"              <swe:uom code="""&OutputUom(i-1)&""" />"&vbcrlf
	top = top&"            </swe:Quantity>"&vbcrlf
	top = top&"          </sml:output>"&vbcrlf
next
	top = top&"        </sml:OutputList>"&vbcrlf
	top = top&"      </sml:outputs>"&vbcrlf
	top = top&"      <sml:components />"&vbcrlf
	top = top&"    </sml:System>"&vbcrlf
	top = top&"  </sml:member>"&vbcrlf
	top = top&"</sml:SensorML>"&vbcrlf
	if SensorID ="" then 
		response.write("<script language='javascript'>alert('请生成SensorID!');window.location='NewInsitu.html';</script>")
	else
		if outputCount="0" then
			response.write("<script language='javascript'>alert('请至少增加一个输出!');window.location='NewInsitu.html';</script>")
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
			
			
			file1=SensorID_Name
			files=file1&".xml"
			filez=all_tree2&"\"&files
			if fs.FileExists(filez) then
				Response.Write "<script>alert('"""&SensorID_Name&"""已经存在！请修改ID或对原xml文档进行修改！')</script>"
			else
				call Generation_File(SensorID_Name&".xml","./SimpleRegister",content)
			end if
		
			if err.number<>0 or err then
			else
			response.Write("<script language='javascript'>history.back();</script>")
			
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
