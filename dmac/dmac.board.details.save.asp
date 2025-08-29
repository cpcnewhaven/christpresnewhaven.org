<%

response.cachecontrol = "no-cache"
response.addheader "Pragma", "no-cache"
response.expires = -1

%>
<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%

Server.ScriptTimeout = 1200
Session.Timeout = 1200 

Set Upload = Server.CreateObject("Persits.Upload.1")
Upload.OverwriteFiles = False
Upload.Save Server.Mappath ("/upload")

FolderID = SQLClean(Upload.Form("FolderID").Value)
PostingID = SQLClean(Upload.Form("PostingID").Value)
Subject = SQLClean(Upload.Form("txtSubject").Value)
Message = SQLClean(Upload.Form("txtMessage").Value)

if PostingID = "" then

Set File = Upload.Files("File1")
If Not File Is Nothing Then
	strSQL = "INSERT INTO [Documents](FileName) Values('" & File.FileName & "')"
	objConn.Execute(strSQL)
	
	strSQL = "SELECT TOP 1 DocumentID FROM [Documents] ORDER BY DocumentID DESC"
	set rstDocuments = objConn.Execute(strSQL)
	DocumentID = rstDocuments("DocumentID")
End If

if DocumentID = "" then
	DocumentID = 0
end if

strSQL = "INSERT INTO [Postings](UserID, FolderID, Subject, DocumentID, Description) Values(" & Session("UserID") & ", " & FolderID & ", '" & Subject & "', " & DocumentID & ", '" & Message & "')"
objConn.Execute(strSQL)

strSQL = "SELECT Max(PostingID) AS NewPostingID FROM Postings"
Set rstPostings = objConn.Execute(strSQL)

NewPostingID = rstPostings("NewPostingID")



''''' EMAIL ALERT '''''
if Upload.Form("chkEmail_All") = "ON" then

	strSQL = "SELECT FirstName, LastName, EmailAddress, LockedOut FROM Users"
	Set rstUsers = objConn.Execute(strSQL)

	do while not rstUsers.eof
	
	if rstUsers("EmailAddress") <> "" and not isNull(rstUsers("EmailAddress")) and not rstUsers("LockedOut") then
	
	UserFullName = rstUsers("FirstName") & " " & rstUsers("LastName")
	if UserFullName = "" then
	   UserFullName = "DMAC"
	end if
	
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.ContentType  = "text/html"
	Mailer.FromName     = "DMAC"
	Mailer.FromAddress  = "dmac@groupsomma.com"
	Mailer.RemoteHost   = "smtp.groupsomma.com"
	Mailer.AddRecipient   UserFullName, rstUsers("EmailAddress")
	Mailer.Subject      = "DMAC: A New Message Has Been Posted"

	strMsgHeader = "<font face=""Tahoma"" size=""3""><p><b>DMAC</b></p>"

	strMsgInfo = "<font face=""Arial"" style=""font-size: 12px""><p style=""line-height: 16px"">The following message was submitted on " & Date() & " by " & Session("FirstName") & " " & Session("LastName") & ".<br><br>"

	strMsgInfo = strMsgInfo & "<b>" & Subject & "</b><br><a href=""http://www.groupsomma.com/dmac/default.asp?PostingID=" & NewPostingID & """>View Details</a><br>"

	Mailer.BodyText = strMsgHeader & strMsgInfo
	Mailer.SendMail
	
	Set Mailer = Nothing	
	end if
	
	rstUsers.moveNext
	loop

else

for each item in Upload.Form

if Left(item.name, 9) = "chkEmail_" then
	if item = "ON" then
	
	strSQL = "SELECT FirstName, LastName, EmailAddress, LockedOut FROM Users WHERE UserID = " & Replace(item.name, "chkEmail_", "")
	Set rstUsers = objConn.Execute(strSQL)
	
	if rstUsers("EmailAddress") <> "" and not isNull(rstUsers("EmailAddress")) and not rstUsers("LockedOut") then
	
	UserFullName = rstUsers("FirstName") & " " & rstUsers("LastName")
	if UserFullName = "" then
	   UserFullName = "DMAC"
	end if
	
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.ContentType  = "text/html"
	Mailer.FromName     = "DMAC"
	Mailer.FromAddress  = "dmac@groupsomma.com"
	Mailer.RemoteHost   = "smtp.groupsomma.com"
	Mailer.AddRecipient   UserFullName, rstUsers("EmailAddress")
	Mailer.Subject      = "DMAC: A New Message Has Been Posted"

	strMsgHeader = "<font face=""Tahoma"" size=""3""><p><b>DMAC</b></p>"

	strMsgInfo = "<font face=""Arial"" style=""font-size: 12px""><p style=""line-height: 16px"">The following message was submitted on " & Date() & " by " & Session("FirstName") & " " & Session("LastName") & ".<br><br>"

	strMsgInfo = strMsgInfo & "<b>" & Subject & "</b><br><a href=""http://www.groupsomma.com/dmac/default.asp?PostingID=" & NewPostingID & """>View Details</a><br>"

	Mailer.BodyText = strMsgHeader & strMsgInfo
	Mailer.SendMail
	
	Set Mailer = Nothing	
	end if
	
	end if
end if

next

end if


else

strSQL = "UPDATE [Postings] SET FolderID = " & FolderID & ", Subject = '" & Subject & "', Description = '" & Message & "' WHERE PostingID = " & PostingID
objConn.Execute(strSQL)

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