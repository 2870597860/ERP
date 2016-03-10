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
<%
class getCapabilities{
	//拼凑GetCapabilities
	public String getCapabilities(){
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
		return getC;
	}
	//发送getCapabilities至SOS，获取返回值
	public String send(String msg,String urlIn) throws IOException{
		URL url = new URL(urlIn);
		URLConnection conn=null;
		conn=url.openConnection();
		conn.setDoOutput(true);
		
		OutputStreamWriter writer=null;
		writer = new OutputStreamWriter(conn.getOutputStream());
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

//-------------------DescribeSensor()-------------------
class DescribeSensor{

		public ArrayList DescribeSensor(String sensorName) throws IOException{
			ArrayList vals = new ArrayList();
			String s = "";
			s+="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n";
			s+="<DescribeSensor version=\"1.0.0\" service=\"SOS\""+"\n";
			s+="	xmlns=\"http://www.opengis.net/sos/1.0\""+"\n";
			s+="	xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""+"\n";
			s+="	xsi:schemaLocation=\"http://www.opengis.net/sos/1.0"+"\n";
			s+="	http://schemas.opengis.net/sos/1.0.0/sosDescribeSensor.xsd\""+"\n";
			s+="	outputFormat=\"text/xml;subtype=&quot;sensorML/1.0.1&quot;\">"+"\n";
			s+="	<procedure>"+sensorName+"</procedure>"+"\n";
			s+="</DescribeSensor>"+"\n";
			//str为返回的xml文档
			String str=send(s);
			//将str作为XML进行解析
			vals=getMsg(str);
			
			return  vals;
		}

		//发送数据到服务器
		public String send(String msg) throws IOException{
			URL url = new URL("http://202.121.197.111:84/SOS_Echo/sos");
			//url = new URL("http://202.121.197.111:84/SOS_E/sos");

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
			reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
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
		//解析str，获得传感器名称、传感器类型、传感器注册时间、传感器观测属性
		public ArrayList getMsg(String DSXML){
			ArrayList al = new ArrayList();
			//从DSXML中解析出传感器名称、类型、注册时间、观测属性
			//强烈建议学弟学妹们使用SAX，查询xml文档特定节点方便很多！！！！
			try {  
			    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
			    DocumentBuilder db = dbf.newDocumentBuilder(); 
			    //使用InputSource将str转为Stream
			    InputSource is = new InputSource();  
			    is.setCharacterStream(new StringReader(DSXML));
			    Document document = db.parse(is);
			    //在此处获取四个参数
			    String test= document.getChildNodes().item(0).getNodeName();
			    if(test=="ows:ExceptionReport"){
					al.clear();
			    	al.add("error");
			    	al.add("error");
			    	al.add("error");
			    	al.add("error");
			    	return al;
			    }
			    Node name = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    		//.getNextSibling().getFirstChild().getNextSibling();
			//    String name_str=name.getTextContent();
			    String name_str=name.getTextContent();
			    al.add(name_str);
			    
			    		//---------------------------------------------------------sml:member------------------------sml:system-----------------------gml:description--------------------------------------------------identification---------------------------------------------------------------------------sml:identifier----------------------下一个---------------------------------------------
			//  Node type = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    		//---------------------------------------------------------sml:member------------------------sml:system-----------------------gml:description--------------------------------------------------identification-----------------------classification-----------------classifierlist------------------classifier--------------------TermDefinition---------------------------------
			    Node type = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    String type_str = type.getTextContent();
			    al.add(type_str);
			    				//---------------------------------------------------------sml:member------------------------sml:system-----------------------gml:description--------------------------------------------------identification-----------------------classification------------------capabilities-------------------------contact----------------------------------------------------responsibleParty-------------------organazationName-------------------------------------------------------
			    Node Administrator = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    String Administrator_str=Administrator.getTextContent();
			    al.add(Administrator_str);
			    Node observationType = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    String observationType_str = observationType.getTextContent();
			    al.add(observationType_str);

				}catch(Exception e){
					al.clear();
					al.add("error");
					al.add("error");
					al.add("error");
					al.add("error");
				}
			al.add("name");
			al.add("type");
			al.add("registedTime");
			al.add("Observation");
			return al;
		}
		
		
}
//-----------------------FindNodeFromString------------------------------
class FindNodeFromString 
{
	ArrayList al=new ArrayList();
	String s="";
	public ArrayList findNode(String rootName,String msg ){
	try {  
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();    
    DocumentBuilder db = dbf.newDocumentBuilder();  
    s=msg;
    InputSource is = new InputSource();  
    is.setCharacterStream(new StringReader(s));

	try{
	    Document document = db.parse(is);
	
	    Node Nparameter= document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling();
	    NodeList nl=Nparameter.getChildNodes();	
	    for(int i = 0;i<nl.getLength();i++){
	    	if(nl.item(i).getNodeName()!="#text"){
	    		//这里获取有效的传感器Name
	    		s=nl.item(i).getTextContent();
	    		al.add(s);
	    	}
	    	else{
	    	}
	    }
    }catch(Exception e){

	}
 //   Node target=nodes.item(0);
   // String name=target.getNodeName();
 //   s = nodes.getLength()+"3"+msg;
	}catch(Exception e){
	}
	return al;
	}
	
}
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已注册传感器</title>
<script type="text/javascript" src="../javascript/libs/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../javascript/libs/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../javascript/Registed_Sensor.js"></script>
<link rel="stylesheet" type="text/css" href="../css/libs/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/libs/jquery.dataTables.min.css">
<link href="../css/Registed_Sensor.css" rel="stylesheet" type="text/css" />
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
		<div class="container">
				<a href="javascript:history.back()">返回</a>
		</div>
	<header>
	SOS中已注册传感器
	</header>
	<div class="main container">
		<div class="table-responsive">
			<table id="table">
				<thead>
				<tr>
					<th>传感器名称</th><th>传感器类型</th><th>传感器ID</th><th>管理机构</th><th>观测属性</th>
				</tr>
				</thead>
				<tbody>
				<%
					//嵌入获取以上信息，分批次插入tr
									getCapabilities getC = new getCapabilities();
									String s = getC.getCapabilities();//获取GetCapabilities()操作，赋值给s
								//发送s值给sos，并获取返回值getC_response
									String getC_response = getC.send(s,"http://202.121.197.111:84/SOS_Echo/sos");
								//	getC_response = getC.send(s,"http://202.121.197.111:84/SOS_E/sos");
								//查找路径_sos:capabilities->ows:operationsmetadata->ows:operation name="DescribeSensor"->ows:parameter name="procedue"->allowedvalues->ows:values
								//	String names=getC_response.split("<ows:parameter name=\"procedure\">")[1].split("</ows:parameter name=\"procedure\">")[0];
									FindNodeFromString fnfs=new FindNodeFromString();
									ArrayList names = fnfs.findNode("allowedvalues",getC_response);//names就是已注册传感器名字的ArrayList
									
								//循环输出至表格中
									Iterator <String> it = names.iterator();
									int i = 0;
									while(it.hasNext()){
										//	执行DescribeSensor操作
											ArrayList vals = new ArrayList();

											DescribeSensor ds = new DescribeSensor();
											String itE = it.next().toString();
											vals = ds.DescribeSensor(itE);
										//输出至web
										i++;
										if(vals.get(0).toString().contains("error")){
										}else{
											out.println("<tr><td>"+vals.get(0)+"</td><td>"+vals.get(1)+"</td><td>"+itE+"</td><td>"+vals.get(2)+"</td><td>"+vals.get(3)+"</td></tr>");
										}
									}
				%>
				</tbody>
			</table>
		</div>
	</div>
</body>

<footer>

</footer>

</html>