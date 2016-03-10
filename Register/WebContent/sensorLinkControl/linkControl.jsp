<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*" %>
<%
	String getStr = request.getReader().readLine();
	//System.out.println(getStr);
	getStr = getStr.replace("%3A", ":");
	String[] idAndState = getStr.split("&"); 
	//IDs为设置接收的传感器ID集合
	List IDs = new ArrayList(); 

	for(int i = 0; i < idAndState.length;i++){
		String ID = idAndState[i].split("=")[0];
		IDs.add(ID);
	}
	
	//配置数据库
	List sensorIDs = new ArrayList();	//数据库中传感器名字
	List sensorPermissions = new ArrayList();  //数据库中传感器接入权限
	String jdbcDriverName = "org.postgresql.Driver";
	Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
	DriverManager.registerDriver(driver);
	//连接数据库
	Connection dbcon = DriverManager.getConnection("jdbc:postgresql:SOS_ConnectPermission","postgres","gis");
	Statement st = dbcon.createStatement();
	ResultSet rt = st.executeQuery("select * from sensors");
	//遍历数据库的行
	while(rt.next()){
		//将数据库中每行的ID与form传过来的IDs进行对比
		String findID = "N";
		for(int i = 0; i < IDs.size();i++){
			if(IDs.get(i).equals(rt.getString(1))){
				findID = "Y";
			};
		}
		if(findID=="Y"){	//form中有的ID
			Statement update = dbcon.createStatement();
			update.executeUpdate("UPDATE sensors SET \"sensorPermission\" = true WHERE \"sensorID\" = '"+rt.getString(1)+"'");
			update.close();
		}else{
			Statement update = dbcon.createStatement();
			update.executeUpdate("UPDATE sensors SET \"sensorPermission\" = false WHERE \"sensorID\" = '"+rt.getString(1)+"'");
			update.close();
		}
		//sensorIDs.add(rt.getString(1).toString());
		//sensorPermissions.add(rt.getString(3).toString());
	}
	rt.close();
%>
<%="操作成功" %>