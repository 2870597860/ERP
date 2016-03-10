<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStreamWriter" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.io.StringReader"%>
<%@ page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page import="org.w3c.dom.Document"%>
<%@ page import="org.w3c.dom.Node"%>
<%@ page import="org.w3c.dom.NodeList"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Element"%>
<%@ page import="org.dom4j.DocumentException" %>
<%@ page import="org.dom4j.io.SAXReader" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.dom4j.DocumentException" %>
<%@ page import="org.dom4j.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*" %>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>传感器控制</title>
<script type="text/javascript" src="../javascript/libs/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../javascript/libs/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/libs/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/libs/jquery.dataTables.min.css">
</head>
<body>
<script>
window.onload=function(){
	$.ajax({
		type: "GET",
		dataType: "html",
		url: "http://202.121.197.111:84/Register/WebContent/loginCheck.jsp",
		data: "",
		success: function(msg){
			//if(登陆不合法)
			    if(msg==0){
			    	$("body").addClass("hide");
					alert("请先登录");
					window.location.href="http://202.121.197.111:84/Register/WebContent";
			    }else{
			    }
		},
		error:function(msg){
			alert("error:"+msg.responseText);
		}
	});
}
</script>
<nav class = "navbar">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="javascript:history.back()">返回</a>
		</div>
	</div>
</nav>
<%
String sosUrl = "http://202.121.197.111:84/SOS_Echo/sos";
class GetSensors{
	//执行GetCapabilities()操作;输入sosUrl为SOS的url,输出String为SOS返回的XML文档
	public String getCapabilities(String sosUrl) throws IOException{
		String getC="";
		getC+="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n";
		getC+="<GetCapabilities xmlns=\"http://www.opengis.net/sos/1.0\""+"\n";
		getC+="	xmlns:ows=\"http://www.opengis.net/ows/1.1\""+"\n";
		getC+="	xmlns:ogc=\"http://www.opengis.net/ogc\""+"\n";
		getC+="	xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""+"\n";
		getC+="	xsi:schemaLocation=\"http://www.opengis.net/sos/1.0"+"\n";
		getC+="	http://schemas.opengis.net/sos/1.0.0/sosGetCapabilities.xsd\""+"\n";
		getC+="	service=\"SOS\">"+"\n";
		getC+="	<ows:AcceptVersions>"+"\n";
		getC+="		<ows:Version>1.0.0</ows:Version>"+"\n";
		getC+="	</ows:AcceptVersions>"+"\n";
		getC+="	<ows:Sections>	"+"\n";
		getC+="		<ows:Section>OperationsMetadata</ows:Section>"+"\n";
		getC+="	</ows:Sections>"+"\n";
		getC+="</GetCapabilities>"+"\n";
		
		URL url = new URL(sosUrl);
		URLConnection conn = null;
		//打开url
		conn = url.openConnection();
		conn.setDoOutput(true);
		
		OutputStreamWriter writer = null;
		writer = new OutputStreamWriter(conn.getOutputStream());
		writer.write(getC);
		writer.flush();
		
		//接收数据
		String line;
		List<String> info = new ArrayList<String>() ;
		BufferedReader reader=null;
		reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while((line=reader.readLine())!=null){
		 info.add(line);
		}
		  writer.close();
		  reader.close();
		  StringBuffer sb=new StringBuffer();
		  if(info!=null){
			  for(int i=0; i<info.size();i++){
				  sb.append(info.get(i));
				  sb.append("\n");
			  }
		  }
		 return sb.toString();
	}
}
//FindNodeSAX使用SAX方式解析【执行GetCapabilities()操作后】SOS返回的XML文档
class FindNodeSAX {
	//findSensors方法用于找出所有Sensor的ID
	public List findSensors(String msg){
		//创建待返回对象
		List sensorResponse = new ArrayList();
		//创建xml解析对象
		SAXReader reader = new SAXReader();
		//定义一个文档
		org.dom4j.Document document = null;
		//将字符串转换为document
		try {
			document =  reader.read(new ByteArrayInputStream(msg.getBytes("GBK")));
			org.dom4j.Element root = document.getRootElement();
			org.dom4j.Element sensor = null;
			Iterator sensors = null;
			String msg_="";
			List sensorList = new ArrayList();
			sensorList = root.element("OperationsMetadata").elements("Operation");
			for(int i =0;(!sensorList.get(i).toString().contains("DescribeSensor"))&&i<sensorList.size();i++){
				sensor = (org.dom4j.Element)sensorList.get(i+1);
			}
			sensorList = sensor.elements("Parameter");
			for(int i =0;i<sensorList.size();i++){
				if(sensorList.get(i).toString().contains("procedure")){
					sensor = (org.dom4j.Element)sensorList.get(i);
				}
			}
			sensorList = sensor.element("AllowedValues").elements("Value");
			for(int i = 0; i < sensorList.size();i++){
				sensor = (org.dom4j.Element)sensorList.get(i);
				sensorResponse.add(sensor.getText());
			}
		//	for(sensors = root.element("Capabilities").elementIterator(); sensors.hasNext();){
		//		sensor = (org.dom4j.Element) sensors.next();
		//		System.out.println(sensor);
		//	}
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(sensorResponse);
		return sensorResponse;
	}
}
//获取传感器连接状态
	List sensorIDs = new ArrayList();	//数据库中传感器名字
	List sensorPermissions = new ArrayList();  //数据库中传感器接入权限
	String jdbcDriverName = "org.postgresql.Driver";
	Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
	DriverManager.registerDriver(driver);
	//连接数据库
	Connection dbcon = DriverManager.getConnection("jdbc:postgresql:SOS_ConnectPermission","postgres","gis");
	Statement st = dbcon.createStatement();
	ResultSet rt = st.executeQuery("select * from sensors");
	while(rt.next()){
		sensorIDs.add(rt.getString(1));
		sensorPermissions.add(rt.getString(3));
	}
%>
<%
GetSensors getSensors = new GetSensors();
String getCapabilitesResponse = getSensors.getCapabilities(sosUrl);
//使用SAX解析getCapabilitesResponse
FindNodeSAX sensors = new FindNodeSAX();
List sensorsList = sensors.findSensors(getCapabilitesResponse);
%>
<div class="container">
	<div class= "table-responsive">
		<form action="linkControl.jsp" id="linkControlForm">
			<table id="table">
			<thead>
				<tr><th>连接状态</th><th>传感器ID</th><th>当前传感器连接状态</th></tr>
			</thead>
			<tbody>
			<%
			String stateOut="×";
			//数据库中有无
			String check="N";
			for(int i = 0; i < sensorsList.size(); i++){
				String state = "";
				for(int j = 0 ; j < sensorIDs.size();j++){
					if(sensorsList.get(i).equals(sensorIDs.get(j))){
						//查找到
						check ="Y";
						if(sensorPermissions.get(j).toString().contains("t")){
							state="checked";
							stateOut="<font color='red'>√</font>";
							break;
						}else{
							stateOut="×";
						}
					}
				}
				
				if(check=="Y"){
					out.println("<tr>");
					out.println("	<td><input type='checkbox' name='"+sensorsList.get(i)+"' "+state+"/></td>");
					out.println("	<td>" + sensorsList.get(i) + "</td>");
					out.println("	<td>"+stateOut+"</td>");
					out.println("</tr>");
				}
				stateOut="×";
				check="N";
			}
			%>
			</tbody>
			
			</table>
			<div class="text-center">
				<input type="button" value="确定" class="submit btn btn-log btn-success"/><input class="invisible"><input class="btn btn-log btn-default" type="reset" value="取消"/>
			</div>
			
		</form>
	</div>
</div>

</body>
<script type="text/javascript" src="../javascript/sensorLink.js" charset="utf-8"></script>
</html>