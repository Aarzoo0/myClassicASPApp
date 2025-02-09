<%
' Database connection configuration
Dim conn, connStr
On Error Resume Next  ' Enable error handling

' Connection string with ODBC
connStr = "Driver={MySQL ODBC 9.2 Unicode Driver};Server=localhost;Database=UserDB;User=root;Password=Suchithra@1352;"

' Create the connection object
Set conn = Server.CreateObject("ADODB.Connection")

' Open the connection
conn.Open connStr

' Check for errors
If Err.Number <> 0 Then
    Response.Write("Error connecting to the database: " & Err.Description)
    Response.End
End If
%>
