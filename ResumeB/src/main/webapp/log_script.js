function validateForm() {
    var username = document.getElementById("username").value.trim();
    var password = document.getElementById("password").value;

    if (username === "") {
        alert("Please enter your username");
        return false;
    }

    if (password === "") {
        alert("Please enter your password");
        return false;
    }

    // Here you can add additional validation or authentication logic if needed

    return true; // Form submission
}
