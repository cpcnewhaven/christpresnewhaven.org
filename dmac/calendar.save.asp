<!--#include file="includes.asp" -->
<%

if request.querystring("R") <> "1" then

Set objRS = Server.CreateObject("ADODB.Recordset")
strSQL = "SELECT * FROM Calendar WHERE CalendarID = 0"
objRS.Open strSQL, objConnCal, 1, 3

objRS.AddNew

objRS("UserID") = Session("UserID")
objRS("PostType") = SQLClean(Request.Form("selPostType"))
objRS("PostDate") = SQLClean(Request.Form("txtDate"))
objRS("Memo") = SQLClean(Request.Form("txtMemo"))

objRS.Update

objRS.Close
Set objRS = Nothing

response.redirect Request.Form("txtRedirect")

else

strSQL = "DELETE FROM Calendar WHERE CalendarID = " & SQLClean(request.querystring("ID"))
objConnCal.Execute(strSQL)

response.redirect "calendar.asp?M=" & SQLClean(request.querystring("M")) & "&Y=" & SQLClean(request.querystring("Y"))

end if

%>
