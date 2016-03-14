package SOS;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
 //做一下修改看看

public class DescribeSensor{

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
			URL url = new URL("http://202.121.197.111:84/SOS_E/sos");
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
			    	al.add("传感器出错");
			    	al.add("传感器出错");
			    	al.add("传感器出错");
			    	al.add("传感器出错");
			    	return al;
			    }
			    Node name = document.getChildNodes().item(0).getFirstChild().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling().getNextSibling().getNextSibling().getFirstChild().getNextSibling().getFirstChild().getNextSibling();
			    		//.getNextSibling().getFirstChild().getNextSibling();
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
			    System.out.println(observationType_str);
//			    NodeList nl=Nparameter.getChildNodes();
//			    for(int i = 0;i<nl.getLength();i++){
//			    	if(nl.item(i).getNodeName()!="#text"){
//			    		//这里获取有效的传感器Name
//			    		String s=nl.item(i).getTextContent();
//			    		al.add(s);
//						
//			    	}
//			    	else{
//			    	}
//			    }
			 //   Node target=nodes.item(0);
			   // String name=target.getNodeName();
			 //   s = nodes.getLength()+"3"+msg;
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

