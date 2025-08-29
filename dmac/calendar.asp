<!--#include file="includes.asp" -->
<% VerifyActiveSession() %>
<%

if request.querystring("M") <> "" then

CurrentDate = DateValue(request.querystring("M") & "/1/" & request.querystring("Y"))

else

CurrentDate = DateValue(Month(Now()) & "/1/" & Year(Now()))

end if

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC - Calendar</title>
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
                        <td bgcolor="#FFFFFF" valign="top">
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
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                    <td><br>
                                    &nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                    
                                    <script language="javascript">
                                    
                                    function JumpDate() {
                                    
                                    window.location='calendar.asp?M=' + document.getElementById('selMonth').value + '&Y=' + document.getElementById('selYear').value;
                                    
                                    }
                                    
                                    function OpenPost(ID) {
                                    
                                    if (document.getElementById(ID).style.display != 'block') {
                                    document.getElementById(ID).style.display = 'block';
                                    } else {
                                    document.getElementById(ID).style.display = 'none';
                                    }
                                    
                                    }
                                    
                                    function WriteDate(D) {
                                    
                                    document.getElementById('txtDate').value = D;
                                    
                                    }
                                    
                                    </script>
                                    
                                    <center>
                                    <select name="selMonth" id="selMonth">
                                    <option value="1" <% if Month(CurrentDate) = 1 then %>selected<% end if %>>January</option>
                                    <option value="2" <% if Month(CurrentDate) = 2 then %>selected<% end if %>>February</option>
                                    <option value="3" <% if Month(CurrentDate) = 3 then %>selected<% end if %>>March</option>
                                    <option value="4" <% if Month(CurrentDate) = 4 then %>selected<% end if %>>April</option>
                                    <option value="5" <% if Month(CurrentDate) = 5 then %>selected<% end if %>>May</option>
                                    <option value="6" <% if Month(CurrentDate) = 6 then %>selected<% end if %>>June</option>
                                    <option value="7" <% if Month(CurrentDate) = 7 then %>selected<% end if %>>July</option>
                                    <option value="8" <% if Month(CurrentDate) = 8 then %>selected<% end if %>>August</option>
                                    <option value="9" <% if Month(CurrentDate) = 9 then %>selected<% end if %>>September</option>
                                    <option value="10" <% if Month(CurrentDate) = 10 then %>selected<% end if %>>October</option>
                                    <option value="11" <% if Month(CurrentDate) = 11 then %>selected<% end if %>>November</option>
                                    <option value="12" <% if Month(CurrentDate) = 12 then %>selected<% end if %>>December</option>
                                    </select>
                                    <select name="selYear" id="selYear">
                                    <option value="2006" <% if Year(CurrentDate) = 2006 then %>selected<% end if %>>2006</option>
                                    <option value="2007" <% if Year(CurrentDate) = 2007 then %>selected<% end if %>>2007</option>
                                    </select>
                                    <input type="button" style="font-family: Arial; font-size: 11px; height: 23px; width: 75" onclick="JumpDate()" value="Jump Date">
                                    </center>
                                    <br>
                                    <form method="post" action="calendar.save.asp">
                                    <input type="hidden" name="txtRedirect" value="calendar.asp?M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">
                                    <table border="0" cellpadding="0" cellspacing="0" width="83%" align="center">
                                      <tr>
                                        <td width="50%" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                      	  <tr>
                                      	    <td style="padding: 6px"><font face="Arial" size="2" style="font-size: 11px"><b>Date:</b><br><input type="text" name="txtDate" id="txtDate" size="40" style="font-size: 11px; width: 250px; font-family: Arial"></td>
                                      	  </tr>
                                      	  <tr>
                                      	  	<td height="2"></td>
                                      	  </tr>
                                      	  <tr>
                                      	    <td style="padding: 6px"><font face="Arial" size="2" style="font-size: 11px"><b>Category:</b><br>
                                      	    <select name="selPostType" style="font-size: 11px; width: 250px; font-family: Arial">
                                      	    <option value="1">Schedule</option>
                                      	    <option value="2">Practice</option>
                                      	    <option value="3">Meeting</option>
                                      	    <option value="8">Deadline</option>
                                      	    <option value="4">Show</option>
                                      	    <% if Session("UserID") = 17 then %>
                                      	    <option value="5">Black Out</option>
                                      	    <% elseif Session("UserID") = 22 or Session("UserID") = 21 or Session("UserID") = 19 then %>
                                      	    <option value="6">Gray Out</option>
                                      	    <% else %>
                                      	    <option value="7">Green Out</option>
                                      	    <% end if %>
                                      	    </select></td>
                                      	  </tr>
                                      	  <tr>
                                      	  	<td height="2"></td>
                                      	  </tr>
                                      	</table>
                                        </td>
                                        <td width="50%" align="right" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                      	  <tr>
                                      	    <td style="padding: 6px"><font face="Arial" size="2" style="font-size: 11px"><b>Memo:</b><br><textarea name="txtMemo" rows="4" style="font-size: 11px; width: 250px; font-family: Arial"></textarea></td>
                                      	  </tr>
                                      	  <tr>
                                      	  	<td height="2"></td>
                                      	  </tr>
                                      	</table>
                                        </td>
                                      </tr>
                                      <tr>
                                      	<td colspan="2" align="center"><input type="submit" style="font-family: Arial; font-size: 11px; height: 23px; width: 75" value="Add"></td>
                                      </tr>
                                    </table>
                                    </form>
                                    <br>
                                    <table border="0" cellpadding="0" cellspacing="4">
                                      <tr height="25" bgcolor="#EAEAEA">
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Sunday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Monday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Tuesday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Wednesday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Thursday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Friday</font></td>
                                      	<td><font face="Arial" size="2" style="font-size: 11px">Saturday</font></td>
                                      </tr>
                                    <%

                                    NextMonth = DateAdd("M", 1, CurrentDate)
                                    
                                    i = Weekday(CurrentDate)
                                    i = i - 1                                    
                                    CurrentDate = DateAdd("D", -i, CurrentDate)
                                    
                                    do while DateValue(CurrentDate) < NextMonth
                                    %>
                                      <tr height="80">
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
										<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
										
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      	<td width="100" valign="top"><font face="Arial" style="font-size: 11px"><a style="color: #000000; text-decoration: none" style="color: #000000" href="javascript:WriteDate('<% =CurrentDate %>')"><% =MonthName(Month(CurrentDate)) & " " & Day(CurrentDate) %></a>
                                      	
                                      	<%

											strSQL = "SELECT * FROM [Calendar] WHERE PostDate = #" & CurrentDate & "#"
											Set rstSchedule = objConnCal.Execute(strSQL)
											
											do while not rstSchedule.eof

										%>
											<br><img border="0" src="../images/space.gif" height="4"><br>
											<b><a style="text-decoration: none" href="javascript:OpenPost('spn<% =rstSchedule("CalendarID") %>')"><% =GetTitle(rstSchedule("PostType"), rstSchedule("UserID")) %></a></b>
											<span id="spn<% =rstSchedule("CalendarID") %>" style="display:none"><% =rstSchedule("Memo") %>&nbsp; <% if rstSchedule("UserID") = Session("UserID") then %><a href="calendar.save.asp?R=1&ID=<% =rstSchedule("CalendarID") %>&M=<% =Month(CurrentDate) %>&Y=<% =Year(CurrentDate) %>">(X)</a><% end if %></span>
										
										<%
										
											rstSchedule.moveNext
											loop

											Set rstSchedule = Nothing
										
										%>
                                      	
                                      	</font>
                                      	
                                      	</td>
                                      	<% CurrentDate = DateAdd("D", 1, CurrentDate) %>
                                      </tr>
                                      <tr>
                                      	<td colspan="7" height="1" bgcolor="#CCCCCC"></td>
                                      </tr>
                                    <%
                                    loop
                                    %>
                                    </table>
                                    
									</td>
                                  </tr>
                                  <tr>
                                    <td align="center"></td>
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