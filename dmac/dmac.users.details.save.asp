<%

response.cachecontrol = "no-cache"
response.addheader "Pragma", "no-cache"
response.expires = -1

%>
<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%


UserID = SQLClean(request("UserID"))
FirstName = SQLClean(request.form("txtFirstName"))
LastName = SQLClean(request.form("txtLastName"))
EmailAddress = SQLClean(request.form("txtEmailAddress"))
Username = SQLClean(request.form("txtUsername"))
Password = SQLClean(request.form("txtPassword"))
Action = request("Action")

if request.form("chkAdmin") = "ON" then
   Admin = True
else
   Admin = False
end if

if request.form("chkLockedOut") = "ON" then
   LockedOut = True
else
   LockedOut = False
end if

if Action <> "Delete" then

if UserID = "" then

strSQL = "INSERT INTO [Users](FirstName, LastName, EmailAddress, Username, Password, Admin, LockedOut) Values('" & FirstName & "', '" & LastName & "', '" & EmailAddress & "', '" & Username & "', '" & Password & "', " & Admin & ", " & LockedOut & ")"
objConn.Execute(strSQL)
objConn.Close()
Set objConn = Nothing

else

strSQL = "UPDATE [Users] SET FirstName = '" & FirstName & "', LastName = '" & LastName & "', EmailAddress = '" & EmailAddress & "', Username = '" & Username & "', Password = '" & Password & "', Admin = " & Admin & ", LockedOut = " & LockedOut & " WHERE UserID = " & UserID
objConn.Execute(strSQL)
objConn.Close()
Set objConn = Nothing

end if

else

   strSQL = "SELECT * FROM [Postings] WHERE UserID = " & UserID
   Set rstPostings = objConn.Execute(strSQL)
   
   if not rstPostings.eof then
   
     strSQL = "UPDATE Users SET LockedOut = 1 WHERE UserID = " & UserID
     objConn.Execute(strSQL)
     objConn.Close()
     Set objConn = Nothing
     
     Session("DeleteError") = True

   else
   
     strSQL = "DELETE FROM [Users] WHERE UserID = " & UserID
     objConn.Execute(strSQL)
     objConn.Close()
     Set objConn = Nothing
   
   end if

end if

response.redirect "dmac.users.asp"

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC</title></head>

<body>

</body>

</html>