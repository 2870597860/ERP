<%
'参数RegisterObj：fso对象
'参数foldername: 根目录所在文件夹路径
'参数Myfolder：文件夹对象
set RegisterObj=Server.CreateObject("Scripting.FileSystemObject")
foldername=server.MapPath("/WebContent/Modeling/SimpleRegister")
set MyFolder=RegisterObj.GetFolder(foldername)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文件管理</title>
</head>
<body>
<a href="../index.html">返回</a>
	<form action="http://localhost:8080/SHU_SOSplatform/Register/RegisterSensor.jsp" method="get">
    	<table align="center" width="50%" border="1">
        	<tr >
            	<td colspan="3"  bgcolor="#00FFFF">
                	<center>请选择需要注册的文档</center>
                </td>
            </tr>
            <tr>
            	<td width="20%"></td>
            	<td valign="top">
				
				<%i=0
					For Each thing in Myfolder.Files
					response.Write("<input  name=name_"&i+1&" type='checkbox' value="&thing.name&" />")
					response.Write("<a href=/WebContent/Modeling/SimpleRegister/"&thing.name&">"&thing.name&"</a>&nbsp;<br>")
					i=i+1
					Next
				%>
                <input type="submit" value="确定注册"/>
               </td>
            	<td width="20%"></td>
            </tr>
            <tr>
            	<td colspan="3" bgcolor="#00FFFF">&nbsp;
                	
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
