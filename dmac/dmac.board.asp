<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<% 

FolderID = SQLClean(request("FolderID"))

if FolderID = "" then
	strSQL = "SELECT TOP 1 FolderID, FolderName FROM [Folders] ORDER BY OrderPosition"
	Set rstFolders = objConn.Execute(strSQL)
	
	FolderID = rstFolders("FolderID")
	FolderName = rstFolders("FolderName")
else
	strSQL = "SELECT TOP 1 FolderName FROM [Folders] WHERE FolderID = " & FolderID
	Set rstFolders = objConn.Execute(strSQL)

	FolderName = rstFolders("FolderName")
end if

strSQL = "SELECT Postings.*, Users.FirstName, Users.LastName, Documents.FileName FROM (Postings LEFT JOIN Documents ON Documents.DocumentID = Postings.DocumentID) INNER JOIN Users ON Users.UserID = Postings.UserID WHERE (((Postings.FolderID)= " & FolderID & ")) ORDER BY Postings.PostingDate DESC"
Set rstBoard = objConn.Execute(strSQL)

%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC - Message Board</title>
<script language="Javascript">

deleteAction = false;

</script>
</head>

<body bgcolor="#DBDBDB">

<div align="left">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td width="100%" align="center" valign="top">
      &nbsp;<div align="center">
        <center>
        <table border="0" cellpadding="0" cellspacing="0" width="660">
          <tr>
            <td height="100" valign="bottom"><img border="0" src="images/logo.jpg"></td>
          </tr>
          <tr>
            <td>
            <div align="left">
              <table border="0" cellpadding="4" cellspacing="0" width="100%" bgcolor="#A9A9A9">
                <tr>
                  <td width="100%">
                  <div align="left">
                    <table border="0" cellpadding="0" cellspacing="3" width="100%" bgcolor="#A9A9A9" height="500">
                      <tr>
                        <td bgcolor="#FFFFFF" valign="top" rowspan="2">
                        <div align="left">
                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                              <td width="100%" height="22"><a href="dmac.main.asp"><img src="images/nav.home.off.gif" border="0" onMouseOver="this.src='images/nav.home.on.gif'" onMouseOut="this.src='images/nav.home.off.gif'"></a><a href="dmac.board.asp"><img src="images/nav.messageboard.off.gif" border="0" onMouseOver="this.src='images/nav.messageboard.on.gif'" onMouseOut="this.src='images/nav.messageboard.off.gif'"></a><a href="calendar.asp"><img src="images/nav.calendar.off.gif" border="0" onMouseOver="this.src='images/nav.calendar.on.gif'" onMouseOut="this.src='images/nav.calendar.off.gif'"></a><% if Session("Admin") = True then %><a href="dmac.folders.asp"><img src="images/nav.folders.off.gif" border="0" onMouseOver="this.src='images/nav.folders.on.gif'" onMouseOut="this.src='images/nav.folders.off.gif'"></a><a href="dmac.users.asp"><img src="images/nav.users.off.gif" border="0" onMouseOver="this.src='images/nav.users.on.gif'" onMouseOut="this.src='images/nav.users.off.gif'"></a><% end if %><a href="logoff.asp"><img src="images/nav.logoff.off.gif" border="0" onMouseOver="this.src='images/nav.logoff.on.gif'" onMouseOut="this.src='images/nav.logoff.off.gif'"></a></td>
                            </tr>
                            <tr>
                              <td width="100%" bgcolor="#A9A9A9" height="2"></td>
                            </tr>
                            <tr>
                              <td width="100%">
                              <div align="left">
                                <table border="0" cellpadding="0" cellspacing="0" width="450" style="border-collapse: collapse" bordercolor="#111111">
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td colspan="2"><br>
                                    <img border="0" src="images/title.messageboard.gif"></td>
                                  </tr>
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td><font face="Arial" size="2" style="font-size: 13px; line-height: 14px"><b><% =FolderName %></b><br><br></font></td>
                                    <td align="right"><input type="button" onClick="window.location='dmac.board.details.asp?Add=1&FolderID=<% =FolderID %>'" style="font-family: Arial; font-size: 11px; height: 25px; width: 90px" value="Add"></td>
                                  </tr>
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td colspan="2">
                                    <table border="0" cellpadding="1" cellspacing="0" width="100%">
                                      <tr height="22" bgcolor="#DBDBDB">
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px" width="100">Name</font></td>
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Subject</font></td>
                                        <td align="center"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Attachment</font></td>
                                        <td align="center"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Remove</font></td>
                                      </tr>
                                      <% do while not rstBoard.eof %>
                                      <tr height="22" bgcolor="#FFFFFF" onMouseOver="style.cursor='hand'; if (deleteAction == true) { this.style.background='#FF0000' } else { this.style.background='#F3F3F3' }" onMouseOut="this.style.background='#FFFFFF'">
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstBoard("FirstName") %>&nbsp;<% =rstBoard("LastName") %><br></font><font face="Arial" size="2" style="font-size: 11px; line-height: 14px" color="#949494"><i><% =FormatDateTime(rstBoard("PostingDate"), 2) %></i></font></td>
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstBoard("Subject") %></font></td>
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false" align="center"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% if rstBoard("FileName") <> "" then %>Y<% end if %></font></td>
                                        <td <% if rstBoard("UserID") = Session("UserID") then %>onClick="if (confirm('Are you sure you want to delete this posting?')) { window.location='dmac.board.details.delete.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>' }" onMouseOver="deleteAction=true" align="center" <% end if %>><% if rstBoard("UserID") = Session("UserID") then %><font face="Arial" size="2" style="font-size: 10px; line-height: 14px">X</font><% end if %></td>
                                      </tr>
                                      <tr height="1" bgcolor="#DBDBDB">
                                      	<td colspan="5"></td>
                                      </tr>
                                      <% rstBoard.MoveNext %>
                                      <% loop %>
                                    </table>
                                    </td>
                                  </tr>
                                </table>
                              </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        </td>
                        <td width="168" bgcolor="#FFFFFF" valign="top">
                        <div align="left">
                          <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                              <td width="100%" valign="top" height="124"><img border="0" src="images/right.computer.jpg"></td>
                            </tr>
                            <tr>
                              <td width="100%" height="3"></td>
                            </tr>
                            <tr>
                              <td height="95%" valign="top"><!--#include file="folders.asp" --></td>
                            </tr>
                          </table>
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td height="100" width="168" bgcolor="#FFFFFF" valign="top">
                        <form method="post" action="dmac.support.asp">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                        <tr>
                              <td>
                              <table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
                              	<tr>
                              		<td height="3"></td>
                              	</tr>
                              	<tr>
                              		<td><font face="Arial" size="2" style="font-size: 11px" color="#888888"><b>Question or Problem?</b></font></td>
                              	</tr>
                              	<tr>
                              		<td height="3"></td>
                              	</tr>
                              	<tr>
                              		<td><textarea name="txtSupport" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="width: 100%; border: 1px solid #000000; font-family: Arial; font-size: 11px" rows="3" cols="20"></textarea ></td>
                              	</tr>
                              	<tr>
                              		<td height="3"></td>
                              	</tr>
                              	<tr>
                              		<td><input type="submit" style="font-family: Arial; font-size: 11px; height: 25px; width: 100%" value="Submit"></td>
                              	</tr>
                              	<tr>
                              		<td height="3"></td>
                              	</tr>
                              </table>
                              </td>
                            </tr>
                        </table>
                        </form>
                        </td>
                      </tr>
                    </table>
                  </div>
                  </td>
                </tr>
              </table>
            </div>
            </td>
          </tr>
        </table>
        </center>
      </div>
      </td>
    </tr>
  </table>
</div>

</body>

</html>