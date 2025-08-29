<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<% 

FolderID = SQLClean(request("FolderID"))
PostingID = SQLClean(request("PostingID"))

if not Add then
	strSQL = "SELECT Postings.*, Users.FirstName, Users.LastName, Documents.FileName FROM (Postings LEFT JOIN Documents ON Documents.DocumentID = Postings.DocumentID) INNER JOIN Users ON Users.UserID = Postings.UserID WHERE (((Postings.PostingID)= " & PostingID & ")) ORDER BY Postings.PostingDate DESC"
	Set rstPosting = objConn.Execute(strSQL)
	
	if rstPosting("UserID") = Session("UserID") then
		Edit = true
	end if
else
	strSQL = "SELECT * FROM Users WHERE LockedOut = 0 ORDER BY LastName"
	Set rstUsers = objConn.Execute(strSQL)
	
	UserCount = 0
	do while not rstUsers.eof
		UserCount = UserCount + 1
	rstUsers.moveNext
	loop
	
	if UserCount > 1 then
		HalfwayCount = Round(UserCount / 2)
	else
		HalfwayCount = 1
	end if
	if UserCount > 0 then
		UserCount = 0
		rstUsers.moveFirst
	end if
	
	Edit = true
end if

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC - Message Board</title>
<script language="Javascript">

function disableSubmit() {

if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) {
	document.all.btnSubmit.disabled = true;
}

}

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
                                <table border="0" cellpadding="0" cellspacing="0" width="450">
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td><br>
                                    <img border="0" src="images/title.messageboard.gif"></td>
                                  </tr>
                                  <tr>
                                    <td width="46">&nbsp;</td>
                                    <td>
                                    <% if Edit then 'enctype="multipart/form-data" %>
                                    <form method="post" enctype="multipart/form-data" onSubmit="disableSubmit()" action="dmac.board.details.save.asp">
                                    <input type="hidden" name="PostingID" value="<% =PostingID %>">
                                    <table border="0" cellpadding="0" cellspacing="0" width="385">
                                      <tr>
                                      	<td width="70"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Name:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% if PostingID <> "" then %><% =rstPosting("FirstName") %>&nbsp;<% =rstPosting("LastName") %><% else %><% =Session("FirstName") %>&nbsp;<% =Session("LastName") %><% end if %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Date:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% if PostingID <> "" then %><% =FormatDateTime(rstPosting("PostingDate"),2) %><% else %><% =FormatDateTime(Now(), 2) %><% end if %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Folder:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">
                                      	<select name="FolderID" tabindex="1" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px; width: 100%">
                                      	<% 
										strSQL = "SELECT * FROM [Folders] ORDER BY OrderPosition"
										Set rstFolders = objConn.Execute(strSQL)
										
										do while not rstFolders.eof %>
											<option value="<% =rstFolders("FolderID") %>" <% if PostingID <> "" then %><% if rstFolders("FolderID") = rstPosting("FolderID") then %>selected<% end if %><% else %><% if rstFolders("FolderID") = CInt(FolderID) then %>selected<% end if %><% end if %>><% =rstFolders("FolderName") %></option>
										<% rstFolders.MoveNext %>
										<% loop %>
                                      	</select>
                                      	</td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Subject:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><input type="text" name="txtSubject" <% if PostingID <> "" then %>value="<% =rstPosting("Subject") %>"<% end if %> tabindex="2" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px; width: 100%" size="20"></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td valign="top"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Message:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><textarea name="txtMessage" tabindex="3" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px; width: 100%" rows="6" cols="40"><% if PostingID <> "" then %><% =rstPosting("Description") %><% end if %></textarea></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>File:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% if PostingID <> "" then %><a href="download.asp?DocumentID=<% =rstPosting("DocumentID") %>"><% =rstPosting("FileName") %></a><% else %><input type="file" name="File1" tabindex="4" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px; width: 100%" size="20"><% end if %></td>
                                      </tr>
                                      <% if Add then %>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td valign="top"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Email Alert:</b></font></td>
                                      	<td valign="top">
                                      	<table border="0" cellpadding="0" cellspacing="0" width="300">
                                      	<tr>
                                      		<td colspan="2">
                                      		
                                      		<table border="0" cellpadding="0" cellspacing="0">
                                      		  <tr>
                                      		    <td width="22"><input type="checkbox" name="chkEmail_All" onClick="if (this.checked) { document.all.tblList1.style.display = 'none'; document.all.tblList2.style.display = 'none'; } else { document.all.tblList1.style.display = 'block'; document.all.tblList2.style.display = 'block'; }" value="ON"></td>
                                      		    <td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px">Email All Members</font></td>
                                      		  </tr>
                                      		</table>
                                      		
                                      		</td>
                                      	</tr>
                                      	<tr>
                                      	
                                      		<td width="160" valign="top">
                                      		<table border="0" cellpadding="0" cellspacing="0" id="tblList1">
                                      		  <% do while not rstUsers.eof and UserCount < HalfwayCount %>
                                      		  <tr>
                                      		    <td width="22"><input type="checkbox" name="chkEmail_<% =rstUsers("UserID") %>" value="ON"></td>
                                      		    <td width="120"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstUsers("FirstName") & " " & rstUsers("LastName") %></font></td>
                                      		  </tr>
                                      		  <% UserCount = UserCount + 1 %>
                                      		  <% rstUsers.moveNext %>
                                      		  <% loop %>
                                      		</table>
                                      		</td>
                                      		
                                      		<td valign="top">
                                      		<table border="0" cellpadding="0" cellspacing="0" id="tblList2">
                                      		  <% do while not rstUsers.eof %>
                                      		  <tr>
                                      		    <td width="22"><input type="checkbox" name="chkEmail_<% =rstUsers("UserID") %>" value="ON"></td>
                                      		    <td width="120"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstUsers("FirstName") & " " & rstUsers("LastName") %></font></td>
                                      		  </tr>
                                      		  <% rstUsers.moveNext %>
                                      		  <% loop %>
                                      		</table>
                                      		</td>
                                      	
                                      	</tr>
                                      	</table>
                                      	</td>
                                      </tr>
                                      <% end if %>
                                      <tr>
                                      	<td height="14"></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" align="center"><input type="submit" id="btnSubmit" style="font-family: Arial; font-size: 11px; height: 25px; width: 90px" value="Save"></td>
                                      </tr>
                                    </table>
                                    </form>
                                    <% else %>
                                    <table border="0" cellpadding="0" cellspacing="0" width="410">
                                      <tr>
                                      	<td width="70"><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Name:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstPosting("FirstName") %>&nbsp;<% =rstPosting("LastName") %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Date:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstPosting("PostingDate") %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Subject:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstPosting("Subject") %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>Message:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><% =rstPosting("Description") %></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><b>File:</b></font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px; line-height: 14px"><a href="download.asp?DocumentID=<% =rstPosting("DocumentID") %>"><% =rstPosting("FileName") %></a></td>
                                      </tr>
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