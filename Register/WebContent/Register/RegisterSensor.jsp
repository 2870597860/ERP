<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册传感器</title>

<script language="javascript">

</script>
</head>

<body>
<a href="javascript:history.back();">返回</a>
<% 
//code for server


class StreamXML{
	public String getString(String path,String filename) throws IOException{
		String msg="";
		int num=0;
		BufferedReader reader=null;
		InputStreamReader isr=null;
		try { 
			isr=new InputStreamReader(new FileInputStream(path+filename),"utf-8");
			reader=new BufferedReader(isr);
			String tmp=reader.readLine();
			while(null!=tmp){
				if(num!=0){
				msg+=tmp+"\n";
				tmp=reader.readLine();
				}else{
					msg+="<sml:SensorML version=\"1.0.1\">\n";
					tmp=reader.readLine();
					num++;
				}
			}
		} finally{
			if(null!=reader){
				reader.close();
			}
		}
		String RegisterStrHead="";
		String RegisterStrFoot="";
		RegisterStrHead+="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n";
		RegisterStrHead+="<RegisterSensor service=\"SOS\" version=\"1.0.0\" xmlns=\"http://www.opengis.net/sos/1.0\" xmlns:swe=\"http://www.opengis.net/swe/1.0.1\" xmlns:ows=\"http://www.opengeospatial.net/ows\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:gml=\"http://www.opengis.net/gml\" xmlns:ogc=\"http://www.opengis.net/ogc\" xmlns:om=\"http://www.opengis.net/om/1.0\" xmlns:sml=\"http://www.opengis.net/sensorML/1.0.1\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.opengis.net/sos/1.0"+"\n";
		RegisterStrHead+="http://schemas.opengis.net/sos/1.0.0/sosRegisterSensor.xsd http://www.opengis.net/om/1.0 http://schemas.opengis.net/om/1.0.0/extensions/observationSpecialization_override.xsd\">"+"\n";
		RegisterStrHead+="	<SensorDescription>"+"\n";
		
		RegisterStrFoot+="	</SensorDescription>"+"\n";
		RegisterStrFoot+="	<ObservationTemplate>"+"\n";
		RegisterStrFoot+="		<om:Observation>"+"\n";
		RegisterStrFoot+="			<om:samplingTime/>"+"\n";
		RegisterStrFoot+="			<om:procedure/>"+"\n";
		RegisterStrFoot+="			<om:observedProperty/>"+"\n";
		RegisterStrFoot+="			<om:featureOfInterest/>"+"\n";
		RegisterStrFoot+="			<om:result/>"+"\n";
		RegisterStrFoot+="		</om:Observation>"+"\n";
		RegisterStrFoot+="	</ObservationTemplate>"+"\n";
		RegisterStrFoot+="</RegisterSensor>"+"\n";
		msg=RegisterStrHead+msg+RegisterStrFoot;
		
		String msg_show=msg;
		msg_show=msg_show.replace("<", "&lt");
		msg_show=msg_show.replace(">", "&gt");

		String return_msg=send(msg);
		return return_msg;
	}

	//发送数据到服务器
	public String send(String msg) throws IOException{
		URL url = new URL("http://202.121.197.111:84/SOS_Echo/sos");
		URLConnection conn=null;
		conn=url.openConnection();
		conn.setDoOutput(true);
		
		OutputStreamWriter writer=null;
		writer = new OutputStreamWriter(conn.getOutputStream(),"GBK");
		writer.write(msg);
		writer.flush();
		  
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



String path="C:/Program Files/apache-tomcat-7.0.41-windows-x64/apache-tomcat-7.0.41/webapps/Register/WebContent/Modeling/SimpleRegister/";
//获取准备注册的传感器名字
int SensorCount=1;//传感器个数
ArrayList list = new ArrayList();//list
for(int i=0;i<SensorCount;i++){
	//list[i]为filename	
}	
Enumeration paramNames=request.getParameterNames();
while(paramNames.hasMoreElements()){
	String paramName=(String)paramNames.nextElement();
	String paramValue=request.getParameter(paramName);
	out.println("<p>"+paramValue+":");	//----------注释
	
	String filename=paramValue;
	String charset="utf-8";
	String state="";//注册结果状态
	StreamXML read=new StreamXML();
	String s=read.getString(path,filename);
//		String s=read.getString(path,filename);
		//输出到jsp中
		if(s.contains("exception")){
			state="<font color='red'>注册失败！</font>";
			JspWriter mout=pageContext.getOut();
			mout.print(state+"<br>"+"<small>详情："+s+"</small></p>");
		}else{
			state="注册成功！";
			JspWriter mout=pageContext.getOut();
			mout.print(state+"</p>");
			//这里应该执行数据库信息插入的操作
		}
}

	
%>
</body>
</html>