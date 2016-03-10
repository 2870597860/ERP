package SOS;

import java.io.StringReader;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class FindNodeFromString 
{
	ArrayList al=new ArrayList();
	String s="";
	public ArrayList findNode(String rootName,String msg ){
	try {  
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();    
//  System.out.println("class name: " + dbf.getClass().getName());  
    // step 2:获得具体的dom解析器  
    DocumentBuilder db = dbf.newDocumentBuilder();  
      
//  System.out.println("class name: " + db.getClass().getName());  
      
    // step3: 解析一个xml文档，获得Document对象（根结点）
    s=msg;
    InputSource is = new InputSource();  
    is.setCharacterStream(new StringReader(s));
    
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
 //   Node target=nodes.item(0);
   // String name=target.getNodeName();
 //   s = nodes.getLength()+"3"+msg;
	}catch(Exception e){
	}
	return al;
	}
	
}


