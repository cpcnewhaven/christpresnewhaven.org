<%

response.cachecontrol = "no-cache"
response.addheader "Pragma", "no-cache"
response.expires = -1

%>
<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%


FolderID = SQLClean(request("FolderID"))
FolderName = SQLClean(request.form("txtFolderName"))
Order = SQLClean(request.form("txtOrder"))
Action = request("Action")

if Action <> "Delete" then

if FolderID = "" then

strSQL = "INSERT INTO [Folders](FolderName, OrderPosition) Values('" & FolderName & "', " & Order & ")"
objConn.Execute(strSQL)
objConn.Close()
Set objConn = Nothing

else

strSQL = "UPDATE [Folders] SET FolderName = '" & FolderName & "', OrderPosition = " & Order & " WHERE FolderID = " & FolderID
objConn.Execute(strSQL)
objConn.Close()
Set objConn = Nothing

end if

else

strSQL = "SELECT * FROM [Postings] WHERE FolderID = " & FolderID
Set rstPostings = objConn.Execute(strSQL)

if rstPostings.eof then

   strSQL = "DELETE FROM [Folders] WHERE FolderID = " & FolderID
   objConn.Execute(strSQL)
   objConn.Close()
   Set objConn = Nothing

else

   Session("DeleteError") = True

end if

end if

response.redirect "dmac.folders.asp"

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC</title></head>

<body>

</body>

</html>