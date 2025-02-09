<!--#include file="../includes/db_connection.asp" -->

<%
' Get user ID from URL parameter
Dim userid
userid = Request.QueryString("id")

' Prepare and execute the DELETE query with parameters
Dim query, cmd
query = "DELETE FROM users WHERE UserID = ?"
Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = query
cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , userid)  ' 3 is adInteger
cmd.Execute

' Redirect to user list
Response.Redirect "list_user.asp"
%>
