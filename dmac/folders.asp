<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>DMAC</title></head>

<body>

<% 
strSQL = "SELECT * FROM [Folders] ORDER BY OrderPosition"
Set rstFolders = objConn.Execute(strSQL)
%>

<% do while not rstFolders.eof %>
<div align="center">
  <table border="0" onMouseOver="this.style.background='#DBDBDB'" onMouseOut="this.style.background='#A9A9A9'" cellpadding="0" cellspacing="0" bgcolor="#A9A9A9" width="159" id="AutoNumber1">
    <tr>
      <td width="22"><img src="images/arrow.gif"></td>
      <td>
      	<table border="0" cellpadding="0" cellspacing="0">
      		<tr>
      		 <td width="5"></td>
      		 <td><a href="dmac.board.asp?FolderID=<% =rstFolders("FolderID") %>"><font face="Arial" size="1" style="font-size: 11px" color="#FFFFFF"><% =rstFolders("FolderName") %></font></a></td>
      		</tr>
      	</table>
      </td>
    </tr>
    <tr>
      <td height="1" colspan="2" bgcolor="#FFFFFF"></td>
    </tr>
  </table>
</div>
<% rstFolders.moveNext %>
<% loop %>

</body>

</html>