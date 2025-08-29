<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%
' AspUpload Code samples: text_download.asp
' Invoked by text.asp
' Copyright (c) 2001 Persits Software, Inc
' This file must not contain any HTML tags

Set Upload = Server.CreateObject("Persits.Upload")

DocumentID = SQLClean(request("DocumentID"))
strSQL = "SELECT FileName FROM [Documents] WHERE DocumentID = " & DocumentID
Set rstDocument = objConn.Execute(strSQL)

filename = rstDocument("FileName")
filepath = Server.Mappath ("/upload") '--- will show physical path (c:\program files\...\simple_new_down.asp)
Path = filepath & "\" & filename

Response.Addheader "Content-Disposition", "attachment; filename=" & filename

' Parmeters:
' 1. Path to file to download
' 2. Yes, build content-xxx headers
' 3. Use this value for Content-Type header
' 4. Include the word "attachment;" to Content-Disposition to force download

Upload.SendBinary Path, True, "application/octet-binary", True
%>