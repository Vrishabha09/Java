function validateForm() {
    var username = document.getElementById("username").value.trim();
    var fullname = document.getElementById("fullname").value.trim();
    var email = document.getElementById("email").value.trim();
    var age = document.getElementById("age").value.trim();
    var password = document.getElementById("password").value;
    var confirm_password = document.getElementById("confirm_password").value;

    // Validate Username and Full Name
    if (username === "" || fullname === "") {
        alert("Username and Full Name must not be empty");
        return false;
    }

    // Validate Email using regular expression
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert("Please enter a valid email address");
        return false;
    }

    // Validate Password
    if (password.length < 8) {
        alert("Password must be at least 8 characters");
        return false;
    }

    // Validate Confirm Password
    if (password !== confirm_password) {
        alert("Passwords do not match");
        return false;
    }

    // Optionally, validate Age (if required)

    // If all validations pass, form is valid
    return true;
}
