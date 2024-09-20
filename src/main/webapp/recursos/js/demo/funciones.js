

function mostrarPopup() {
    var overlay = document.getElementById("overlay");
    var popup = document.getElementById("popup");
    overlay.style.display = "block";
    popup.style.display = "block";
}

function cerrarPopup() {
    var overlay = document.getElementById("overlay");
    var popup = document.getElementById("popup");
    overlay.style.display = "none";
    popup.style.display = "none";
}

window.togglePassword = function() {
    var passwordField = document.getElementById("password");
    
    var eyeIcon = document.getElementById("eyeIcon");

    if (passwordField.type === "password") {
        passwordField.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordField.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
    
   
    
    
    
    
};


window.togglePasswordRepeat =function  (){
    var passwordRepeat = document.getElementById("passwordRepeat");
        
    var eyeIcon = document.getElementById("eyeIconRepeat");

     if (passwordRepeat.type === "password") {
        passwordRepeat.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        passwordRepeat.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
    
}






              