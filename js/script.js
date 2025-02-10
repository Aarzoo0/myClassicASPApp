// Function to show a greeting message when the page is loaded
function showGreeting() {
    alert("Welcome to the User Management System! You can manage users here.");
}

// Function to toggle the visibility of the introduction section
function toggleIntro() {
    var introSection = document.getElementById('intro-section');
    if (introSection.style.display === "none") {
        introSection.style.display = "block";
    } else {
        introSection.style.display = "none";
    }
}

// Function to confirm the action of adding a new user
function confirmNewUser() {
    return confirm("Are you sure you want to add a new user?");
}
