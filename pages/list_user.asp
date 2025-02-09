<!--#include file="../includes/db_connection.asp" -->

<%
' Initialize variables
Dim rs, query, cmd

' Ensure the connection is open before executing the query
If conn.State = 0 Then
    conn.Open connStr
End If

' Define the SQL query to get users from the database
query = "SELECT UserID, FirstName, LastName, Email, Phone FROM users"

' Create the Command object
Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn  ' Use the existing connection object
cmd.CommandText = query

' Execute the query using cmd.Execute
On Error Resume Next  ' Error handling
Set rs = cmd.Execute

' Check if there was an error executing the query
If Err.Number <> 0 Then
    Response.Write("Error executing query: " & Err.Description)
    Response.End
End If
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - User Management System</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>User Management System - User List</h1>
        </header>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                ' Loop through the recordset and display user data
                Do While Not rs.EOF
                %>
                <tr>
                    <td><%= rs("UserID") %></td>
                    <td><%= rs("FirstName") %></td>
                    <td><%= rs("LastName") %></td>
                    <td><%= rs("Email") %></td>
                    <td><%= rs("Phone") %></td>
                    <td>
                        <a href="update_user.asp?id=<%= rs("UserID") %>" class="btn btn-primary">Edit</a> | 
                        <a href="delete_user.asp?id=<%= rs("UserID") %>" class="btn btn-secondary">Delete</a>
                    </td>
                </tr>
                <%
                rs.MoveNext
                Loop
                %>
            </tbody>
        </table>
        <br>
        <a href="add_user.asp" class="btn btn-primary">Add New User</a>
    </div>
</body>
</html>

<%
' Close the recordset and connection after use
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
