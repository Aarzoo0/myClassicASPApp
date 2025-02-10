<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to User Management System</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
    <!-- Linking to the external JavaScript file -->
    <script type="text/javascript" src="js/script.js"></script>
</head>
<body onload="showGreeting()">
    <div class="container">
        <header>
            <h1>Welcome to the User Management System</h1>
        </header>
        <section id="intro-section" class="intro">
            <p>This is a simple application to manage users. You can add, update, delete, and view users in the system.</p>
            <button onclick="toggleIntro()">Hide/Show Introduction</button>
        </section>

        <section class="actions">
            <a href="pages/list_user.asp" class="btn btn-primary">View Users</a>
            <a href="pages/add_user.asp" class="btn btn-secondary" onclick="return confirmNewUser()">NEW USER</a>
        </section>
    </div>
</body>
</html>
