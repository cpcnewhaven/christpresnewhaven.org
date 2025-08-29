<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%
PostingID = SQLClean(request.querystring("PostingID"))
if PostingID <> "0" and PostingID <> "" then 
	response.redirect "dmac.board.details.asp?PostingID=" & PostingID
end if

if Session("LastLoggedIn") <> "" then
  strSQL = "SELECT TOP 5 Postings.*, Users.FirstName, Users.LastName, Documents.FileName FROM (Postings LEFT JOIN Documents ON Documents.DocumentID = Postings.DocumentID) INNER JOIN Users ON Users.UserID = Postings.UserID WHERE PostingDate > #" & Session("LastLoggedIn") & "# AND Postings.UserID <> " & Session("UserID") & " ORDER BY Postings.PostingDate DESC"
  Set rstBoard = objConn.Execute(strSQL)
end if

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC - Welcome</title></head>

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
                                <table border="0" cellpadding="0" cellspacing="0" width="400">
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td><br>
                                    <img border="0" src="images/title.home.gif"></td>
                                  </tr>
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Welcome, <% =Session("FirstName") %>, to DMAC - Document Management and Communication System. See the <a href="dmac.board.asp">Message Board</a> for recent postings and uploaded files from members.<br><br>
                                    <% if Session("LastLoggedIn") <> "" then %>
                                    The following are the top five most recent posts since the time you've logged in (<% =Session("LastLoggedIn") %>).<br><br></font>
                                    <table border="0" cellpadding="1" cellspacing="0" width="100%">
                                      <tr height="22" bgcolor="#DBDBDB">
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Name</font></td>
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Date</font></td>
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Subject</font></td>
                                        <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Document</font></td>
                                     </tr>
                                      <% do while not rstBoard.eof %>
                                      <tr height="22" bgcolor="#FFFFFF" onMouseOver="style.cursor='hand'; if (deleteAction == true) { this.style.background='#FF0000' } else { this.style.background='#F3F3F3' }" onMouseOut="this.style.background='#FFFFFF'">
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstBoard("FirstName") %>&nbsp;<% =rstBoard("LastName") %></font></td>
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =FormatDateTime(rstBoard("PostingDate"), 2) %></font></td>
                                        <td onClick="window.location='dmac.board.details.asp?FolderID=<% =FolderID %>&PostingID=<% =rstBoard("PostingID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstBoard("Subject") %></font></td>
                                        <td onClick="window.location='download.asp?DocumentID=<% =rstBoard("DocumentID") %>'" onMouseOver="deleteAction=false"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstBoard("FileName") %></font></td>
                                      </tr>
                                      <tr height="1" bgcolor="#DBDBDB">
                                      	<td colspan="5"></td>
                                      </tr>
                                      <% rstBoard.MoveNext %>
                                      <% loop %>
                                    </table>
                                    <% end if %>
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
                              <td valign="top"><!--#include file="folders.asp" --></td>
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