<!--#include file="../includes/db_connection.asp" -->

<%
' Initialize form variables
Dim firstname, lastname, email, phone

' Handle form submission
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    firstname = Request.Form("firstname")
    lastname = Request.Form("lastname")
    email = Request.Form("email")
    phone = Request.Form("phone")
    
    ' Ensure the connection is open
    If conn.State = 0 Then
        conn.Open connStr
    End If
    
    ' Prepare the SQL query with parameters (no UserID)
    Dim query, cmd
    query = "INSERT INTO users (firstname, lastname, email, phone) VALUES (?, ?, ?, ?)"
    Set cmd = Server.CreateObject("ADODB.Command")
    cmd.ActiveConnection = conn
    cmd.CommandText = query
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, firstname)  ' 8 is adVarChar, 1 is adParamInput
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, lastname)
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 100, email)
    cmd.Parameters.Append cmd.CreateParameter(, 8, 1, 20, phone)

    ' Execute the query and check for errors
    On Error Resume Next
    cmd.Execute
    If Err.Number <> 0 Then
        Response.Write("Error inserting data: " & Err.Description)
        Response.End
    Else
        ' Redirect to list_users.asp after successful insertion
        Response.Redirect "list_user.asp"
    End If
End If  ' <-- Added missing End If here

%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New User</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>Add New User</h1>
        <form method="post">
            <input type="text" name="firstname" placeholder="First Name" required>
            <input type="text" name="lastname" placeholder="Last Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number" required>
            <input type="submit" value="Add User">
        </form>
    </div>
</body>
</html>
