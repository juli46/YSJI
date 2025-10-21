// static/js/js.js
document.addEventListener("DOMContentLoaded", () => {
  // ---------- Helpers: selectores tolerantes con "ñ" ----------
  const q = (sel) => document.querySelector(sel);
  const qAll = (sel) => document.querySelectorAll(sel);

  // ---------- Toggle entre formularios - CORREGIDO ----------
  const sign_in_btn = q("#sign-in-btn");
  const sign_up_btn = q("#sign-up-btn");
  const container = q(".container");

  // Debug para verificar elementos
  console.log("Sign up button:", sign_up_btn);
  console.log("Sign in button:", sign_in_btn);
  console.log("Container:", container);

  if (sign_up_btn && container) {
    sign_up_btn.addEventListener("click", (e) => {
      e.preventDefault();
      console.log("Click en sign-up-btn");
      container.classList.add("sign-up-mode");
    });
  }

  if (sign_in_btn && container) {
    sign_in_btn.addEventListener("click", (e) => {
      e.preventDefault();
      console.log("Click en sign-in-btn");
      container.classList.remove("sign-up-mode");
    });
  }

  // ---------- Función global para mostrar contraseñas ----------
  window.mostrarContraseñas = function() {
    const pass = q("#contraseña");
    const confirm = q("#confirmar_contraseña");
    const check = q("#mostrarContraseña");
    
    if (pass && confirm && check) {
      pass.type = check.checked ? "text" : "password";
      confirm.type = check.checked ? "text" : "password";
    }
  };

  // ---------- Validación registro ----------
  function validarRegistro() {
    const nombreInput = q('#registerForm input[name="nombre"]');
    const correoInput = q('#registerForm input[name="correo"]');
    const passInput = q('#contraseña');
    const confirmInput = q('#confirmar_contraseña');

    const nombre = nombreInput?.value.trim() ?? "";
    const correo = correoInput?.value.trim() ?? "";
    const contraseña = passInput?.value ?? "";
    const confirmarContraseña = confirmInput?.value ?? "";

    let esValido = true;
    const errores = [];

    if (!nombre) {
      errores.push("El nombre es obligatorio");
      esValido = false;
    } else if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/.test(nombre)) {
      errores.push("El nombre solo debe contener letras");
      esValido = false;
    } else if (nombre.length < 2) {
      errores.push("El nombre debe tener al menos 2 caracteres");
      esValido = false;
    }

    if (!correo) {
      errores.push("El correo electrónico es obligatorio");
      esValido = false;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo)) {
      errores.push("El formato del correo electrónico es inválido");
      esValido = false;
    }

    if (!contraseña) {
      errores.push("La contraseña es obligatoria");
      esValido = false;
    } else {
      if (contraseña.length < 8) {
        errores.push("La contraseña debe tener mínimo 8 caracteres");
        esValido = false;
      }
      if (!/[a-z]/.test(contraseña)) {
        errores.push("La contraseña debe tener al menos una letra minúscula");
        esValido = false;
      }
      if (!/[A-Z]/.test(contraseña)) {
        errores.push("La contraseña debe tener al menos una letra mayúscula");
        esValido = false;
      }
      if (!/[0-9]/.test(contraseña)) {
        errores.push("La contraseña debe tener al menos un número");
        esValido = false;
      }
      if (!/[^a-zA-Z0-9]/.test(contraseña)) {
        errores.push("La contraseña debe tener al menos un carácter especial");
        esValido = false;
      }
    }

    if (!confirmarContraseña) {
      errores.push("Debe confirmar la contraseña");
      esValido = false;
    } else if (contraseña !== confirmarContraseña) {
      errores.push("Las contraseñas no coinciden");
      esValido = false;
    }

    if (!esValido) {
      Swal.fire({
        icon: "error",
        title: "¡Campos incompletos o incorrectos!",
        html:
          '<div style="text-align: left; padding: 10px;">' +
          errores.map((error) => `• ${error}`).join("<br>") +
          "</div>",
        confirmButtonText: "Entendido",
      });
    }

    return esValido;
  }

  // ---------- Login con AJAX ----------
  const loginForm = q("#loginForm");
  if (loginForm) {
    loginForm.addEventListener("submit", function (e) {
      e.preventDefault();

      const correo = loginForm.querySelector('input[name="correo"]')?.value.trim() ?? "";
      const contraseña = loginForm.querySelector('input[name="contraseña"]')?.value ?? "";

      if (!correo || !contraseña) {
        Swal.fire({
          icon: "warning",
          title: "¡Campos requeridos!",
          text: "Debes completar el correo y la contraseña",
          confirmButtonText: "Entendido",
        });
        return;
      }

      const formData = new FormData(loginForm);
      formData.append("login", "1");

      Swal.fire({
        title: "Iniciando sesión...",
        didOpen: () => Swal.showLoading(),
        allowOutsideClick: false,
        allowEscapeKey: false,
        showConfirmButton: false,
      });

      fetch(window.location.href, {
        method: "POST",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "X-CSRFToken": formData.get("csrfmiddlewaretoken"),
        },
        body: formData,
      })
        .then((res) => res.json())
        .then((data) => {
          Swal.close();
          Swal.fire({
            icon: data.success ? "success" : "error",
            title: data.success ? "¡Bienvenido!" : "Error",
            text: data.message,
            confirmButtonText: "Aceptar",
          }).then(() => {
            if (data.success && data.redirect_url) {
              window.location.href = data.redirect_url;
            } else {
              loginForm.reset();
            }
          });
        })
        .catch((err) => {
          Swal.close();
          console.error("Error en login AJAX:", err);
          Swal.fire("¡Error!", "No se pudo conectar al servidor.", "error");
        });
    });
  }

  // ---------- Submit registro ----------
  const registerForm = q("#registerForm");
  if (registerForm) {
    registerForm.addEventListener("submit", function (e) {
      if (!validarRegistro()) {
        e.preventDefault();
      } else {
        Swal.fire({
          title: "Creando cuenta...",
          didOpen: () => Swal.showLoading(),
          allowOutsideClick: false,
        });
      }
    });
  }
});