document.getElementById("contactForm").addEventListener("submit", function(event) {
   
    event.preventDefault();
    
    
    let errores = [];

    
    let nombre = document.getElementById("name").value;
    let regexNombre = /^[A-Za-záéíóúÁÉÍÓÚñÑ\s]+$/;
    if (!regexNombre.test(nombre)) {
        errores.push("El nombre solo puede contener letras y espacios.");
    }

    
    let correo = document.getElementById("email").value;
    if (!correo || !/\S+@\S+\.\S+/.test(correo)) {
        errores.push("Por favor, ingresa un correo electrónico válido.");
    }

    
    let telefono = document.getElementById("phone").value;
    let regexTelefono = /^\d{10}$/;
    if (!regexTelefono.test(telefono)) {
        errores.push("El teléfono debe contener exactamente 10 dígitos sin espacios.");
    }

   
    let mensaje = document.getElementById("message").value;
    if (!mensaje.trim()) {
        errores.push("El mensaje no puede estar vacío.");
    }

    
    if (errores.length > 0) {
        let errorMessage = errores.join('<br>');
        Swal.fire({
            title: '¡Error!',
            html: errorMessage,
            icon: 'error',
            confirmButtonText: 'Cerrar'
        });
    } else {
        
        Swal.fire({
            title: '¡Formulario enviado!',
            text: 'Tu mensaje ha sido enviado correctamente.',
            icon: 'success',
            confirmButtonText: 'Cerrar'
        }).then(() => {
            
            document.getElementById("contactForm").reset();  
        });
    }
});
