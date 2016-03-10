<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.*" errorPage="" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.*" %>
<%
	String name = request.getParameter("userName");
	String pwd = request.getParameter("password");
	session.setAttribute("loginPermission","NotPass");
	String loginPermissionStr = session.getAttribute("loginPermission").toString();
	Boolean loginPermission = false;
	//获取数据库数据，验证账号密码
	String jdbcDriverName = "org.postgresql.Driver";
	Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
	DriverManager.registerDriver(driver);
	//连接数据库
	Connection dbcon = DriverManager.getConnection("jdbc:postgresql:SOS_ConnectPermission","postgres","gis");
	Statement st = dbcon.createStatement();
	ResultSet rt = st.executeQuery("select * from users");
	while(rt.next()){
		String dbName = rt.getString(2);
		String dbPwd = rt.getString(3);
		if(name.equals(dbName) && pwd.equals(dbPwd)){
			session.setAttribute("loginPermission","Pass");
			loginPermission=true;
			out.print("{"+"\n");
			out.print("loginPermission:"+loginPermission+"\n");
			out.print("userName:"+rt.getString(2)+"\n");
			out.print("userID:"+rt.getString(1)+"\n");
			out.print("company:"+rt.getString(5)+"\n");
			out.print("company_id:"+rt.getString(6)+"\n");
			out.print("sensorNumber:"+rt.getString(8)+"\n");
			out.print("}"+"\n");
		}
	}
		if(loginPermission==false){
			out.print(0);	
		}
%>