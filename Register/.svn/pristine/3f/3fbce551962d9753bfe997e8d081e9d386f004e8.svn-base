<%
'删除文件处理过程，传递文件相对路径
Sub DeleFile(FilePath)
Set Del=Server.CreateObject("Scripting.FileSystemObject")
If Err <> 0 Then
 Response.Write "<script>alert('出现未知错误！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
 Err.clear
Else
 If InStr(FilePath,", ") > 0 then
  Msg=""
  FilePath=Split(FilePath,", ")
  For i = 0 to ubound(FilePath)
   If Del.FileExists(Server.MapPath(FilePath(i)))=True Then
    Del.DeleteFile Server.MapPath(FilePath(i)),True
   Else Msg=Msg&"\n文件"&FilePath(i)&"不存在！"
   End If
  Next
  Response.Write "<script>alert('批量删除成功！"&Msg&"');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
 Else
  If Del.FileExists(Server.MapPath(FilePath))=True Then
   Del.DeleteFile Server.MapPath(FilePath),True
   Response.Write "<script>alert('删除成功！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
  Else Response.Write "<script>alert('文件不存在！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
  End If
 End If
End If
Set Del=Nothing
End Sub

'删除文件夹过程，传递文件夹相对路径
Sub DeleFolder(FolderPath)
Set Del=Server.CreateObject("Scripting.FileSystemObject")
If Err <> 0 Then
 Response.Write "<script>alert('出现未知错误！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
 Err.clear
Else
 If Del.FolderExists(Server.MapPath(FolderPath))=True Then
  Del.DeleteFolder Server.MapPath(FolderPath),True
  Response.Write "<script>alert('删除成功！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
 Else Response.Write "<script>alert('文件夹不存在！');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
 End If
End If
Set Del=Nothing
End Sub
%> 
<%
'创建文件操作对象
FLRoot="SimpleRegister/"'定义管理文件根目录
FLPath=Request("FLPath")'------Echo-----不知何用
FFPath = Server.MapPath(FLRoot&FLPath)'-----Echo--返回路径：D:\Program Files\Apache Software Foundation\apache-tomcat-6.0.35\webapps\SHU_SOSplatform\upload
IF Len(FFPath)=2 then FFPath=FFPath&"\" End If'--Echo--如果处于根目录D：则创建子目录
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
If objFSO.FolderExists(FFPath) Then
' Response.write "<div align='center'>文件夹 "&FLRoot&FLPath&" 下的所有文件：</div><br>"
 Response.write "<div align='center'>已进行过快速注册的所有模型文件：</div><br>"
 Set objFolder = objFSO.GetFolder(FFPath)
 Set objSubFolders=objFolder.Subfolders
Else
 Response.Write "<script>alert('文件夹"&FLRoot&FLPath&"不存在，无法读取相关信息！');javascript:history.back();</script>"
End If
%>
<%
FilePath=Request("FilePath")
FolderPath=Request("FolderPath")
If InStr(FilePath,".asp")>0 or InStr(FilePath,"../")>0 or InStr(FilePath,"..\") >0 Then
 Response.Write "<script>alert('命令不允许执行');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
Else
 If FilePath<>"" Then
  DeleFile(FilePath)
 End If
End If
If InStr(FolderPath,"../")>0 or InStr(FolderPath,"..\") >0 Then
 Response.Write "<script>alert('命令不允许执行');window.location='"&Request.ServerVariables("URL")&"?FLPath="&Request("FLPath")&"';</script>"
Else
 If FolderPath<>"" Then
  DeleFolder(FolderPath)
 End If
End If
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文件管理</title>
</head>
<body>
<form action="" method="POST">
<table border="1" align="center">
  <tr>
    <td>
 <%If Len(FFPath)=3 and 0 then%>
 <a href="../?FLPath=<%=FLPath%>..">上级目录</a><br>
 <%End If%>
 <a href="javascript:history.back();">后退</a>
 <a href="javascript:location.reload();">刷新</a><br>
 <%For Each objSubFolder in objSubFolders%>
 <a href="../?FLPath=<%=FLPath%>&amp;FolderPath=<%=FLRoot&FLPath&objSubFolder.Name%>" onclick="return confirm('您确定要删除该文件夹吗？');">删除</a>|	<a href="../?FLPath=<%=FLPath&objSubFolder.Name%>"><%=objSubFolder.Name%></a><br>
 <%Next%>
 <%For Each objFile in objFolder.Files%>
 <input type="checkbox" name="FilePath" value="<%=FLRoot&FLPath&objFile.Name%>">
 <a href="<%=FLRoot&FLPath&objFile.Name%>" target="_blank"><%=objFile.Name%></a><br>
 <%Next%>
 <input name="" type="submit" onclick="confirm('您确定要删除选中文件吗？');" value="删除" />
 <!--
 
 <input name="" type="button" onclick="window.open('upload/upfile.asp','','height=25,width=300,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')" value="上传文件" />
 
 -->
 </td>
  </tr>
</table>
</form>
</body>
</html>
<%
'关闭文件操作对象
Set objFolder = Nothing
Set objFSO = Nothing
%>