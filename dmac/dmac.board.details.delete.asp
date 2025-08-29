<%

response.cachecontrol = "no-cache"
response.addheader "Pragma", "no-cache"
response.expires = -1

%>
<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%

FolderID = SQLClean(request.querystring("FolderID"))
PostingID = SQLClean(request.querystring("PostingID"))

strSQL = "SELECT Postings.DocumentID, FileName FROM (Postings LEFT JOIN Documents ON Documents.DocumentID = Postings.DocumentID) WHERE PostingID = " & PostingID
Set rstDocuments = objConn.Execute(strSQL)
   
if not rstDocuments.eof then
	DocumentID = rstDocuments("DocumentID")
	FileName = rstDocuments("FileName")
end if

strSQL = "DELETE FROM [Postings] WHERE PostingID = " & PostingID
objConn.Execute(strSQL)

Set Upload = Server.CreateObject("Persits.Upload.1")   
if DocumentID <> "" and DocumentID <> "0" then
	strSQL = "DELETE FROM [Documents] WHERE DocumentID = " & DocumentID
	objConn.Execute(strSQL)

	Directory = Server.Mappath ("/upload") & "/" & FileName
	Upload.DeleteFile Directory
end if
   
objConn.Close()
Set objConn = Nothing

response.redirect "dmac.board.asp?FolderID=" & FolderID

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC</title></head>

<body>

</body>

</html>