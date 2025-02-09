<!--#include file="../includes/db_connection.asp" -->

<%
' Get user ID from URL parameter
Dim userid, firstname, lastname, email, phone
userid = Request.QueryString("id")

' Fetch the user details from the database using a parameterized query
Dim rs, query, cmd
query = "SELECT firstname, lastname, email, phone FROM users WHERE UserID = ?"
Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = query
cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , userid)  ' 3 is adInteger
Set rs = cmd.Execute

If Not rs.EOF Then
    firstname = rs("firstname")
    lastname = rs("lastname")
    email = rs("email")
    phone = rs("phone")
End If
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>Update User</h1>
        <form method="post">
            <input type="text" name="firstname" value="<%= firstname %>" required>
            <input type="text" name="lastname" value="<%= lastname %>" required>
            <input type="email" name="email" value="<%= email %>" required>
            <input type="text" name="phone" value="<%= phone %>" required>
            <input type="submit" value="Update User">
        </form>
        <a href="list_user.asp">Back to List</a>
    </div>
</body>
</html>

<%
' Handle form submission
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    firstname = Request.Form("firstname")
    lastname = Request.Form("lastname")
    email = Request.Form("email")
    phone = Request.Form("phone")
    
    ' Update the user in the database using parameterized query
    query = "UPDATE users SET firstname = ?, lastname = ?, email = ?, phone = ? WHERE UserID = ?"
    Set cmd = Server.CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn
    cmd.CommandText = query
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, firstname)
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, lastname)
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, email)
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 20, phone)
    cmd.Parameters.Append cmd.CreateParameter(, 3, 1, , userid)
    
    cmd.Execute
    Response.Redirect "list_user.asp"
End If

rs.Close
Set rs = Nothing
%>
