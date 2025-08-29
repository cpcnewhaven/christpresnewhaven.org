<% PostingID = Replace(Replace(request.querystring("PostingID"), "'", "''"), "<", "") %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC - Login</title></head>

<body bgcolor="#DBDBDB" onLoad="document.all.txtUsername.focus()">

<div align="left">
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="100%">
    <tr>
      <td width="100%" align="center">
      <div align="center">
        <center>
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber2">
          <tr>
            <td><img border="0" src="images/logo.jpg"></td>
          </tr>
          <tr>
            <td>
            <div align="left">
              <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3" bgcolor="#A9A9A9">
                <tr>
                  <td width="100%">
                  <div align="left">
                    <table border="0" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4" bgcolor="#FFFFFF">
                      <tr>
                        <td width="100%"><br>
&nbsp;<div align="center">
                          <center>
                          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="350" id="AutoNumber5">
                            <tr>
                              <td><font face="Arial" size="2" style="font-size: 11px">Please provide your username and password to access the system.</font></td>
                            </tr>
                            <tr>
                              <td>
                              <form method="post" action="login.asp?PostingID=<% =PostingID %>">
                              <div align="left">
                                <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="280" id="AutoNumber6">
                                  <tr>
                                    <td colspan="3" height="10"></td>
                                  </tr>
                                  <tr>
                                    <td width="64"><font face="Arial" size="2" style="font-size: 11px"><b>Username</b></font></td>
                                    <td width="138"><input type="text" name="txtUsername" tabindex="1" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px" size="20" value="guest"></td>
                                    <td width="78" rowspan="2"><input type="submit" value="Login" style="font-family: Arial; font-size: 11px; height: 25px; width: 40px"></td>
                                  </tr>
                                  <tr>
                                    <td width="64"><font face="Arial" size="2" style="font-size: 11px"><b>Password</b></font></td>
                                    <td width="138"><input type="password" name="txtPassword" tabindex="2" onFocus="this.style.background='#F3F3F3'" onBlur="this.style.background='#FFFFFF'" style="border: 1px solid #000000; font-family: Arial; font-size: 11px" size="20" value="guest"></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3" height="10" width="280"></td>
                                  </tr>
                                </table>
                              </div>
                              </form>
                              </td>
                            </tr>
                            <% if Session("Error") = "True" then %>
                            <tr>
                              <td><font face="Arial" size="2" style="font-size: 11px" color="red"><b>The Username and Password you have provided is invalid.</b></font></td>
                            </tr>
                            <% end if %>
                          </table>
                          </center>
                        </div>
                        <p><br>
&nbsp;</td>
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