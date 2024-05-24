

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

function validarContraseñasIguales(){document.getElementById('formulario').addEventListener('submit', function (event){
    var password=document.getElementById("password").value;
    var passwordRepeat= document.getElementById("passwordRepeat").value;
    if(password != passwordRepeat){
        document.getElementById("passwordRepeat").setCustomValidity("Las contraseñas no coinciden.");
    }else{
        document.getElementById("passwordRepeat").setCustomValidiy("");
    }
    if(!this.checkValidity()){
        event.preventDefault();
    }
});


}

              