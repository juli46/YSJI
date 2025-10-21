document.addEventListener('DOMContentLoaded', function() {
    generateCaptcha();
});

function generateCaptcha() {
    const num1 = Math.floor(Math.random() * 10);
    const num2 = Math.floor(Math.random() * 10);
    document.getElementById('captcha-question').innerText = `${num1} + ${num2}`;
    document.getElementById('captcha').dataset.answer = (num1 + num2).toString();
}

document.getElementById('recoverForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Evitar el envío del formulario por defecto

    const email = document.getElementById('email').value;
    const captcha = document.getElementById('captcha').value;
    const correctAnswer = document.getElementById('captcha').dataset.answer;

    // Validación del correo
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        document.getElementById('message').innerText = 'Por favor, ingresa un correo electrónico válido.';
        document.getElementById('message').style.color = 'red';
        return;
    }

    // Validación del captcha
    if (captcha !== correctAnswer) {
        document.getElementById('message').innerText = 'Respuesta de captcha incorrecta. Inténtalo de nuevo.';
        document.getElementById('message').style.color = 'red';
        return;
    }

    // Simulación de envío de datos
    document.getElementById('message').innerText = 'Enviando...';
    document.getElementById('message').style.color = 'black';

    // Simular un retraso de envío
    setTimeout(() => {
        document.getElementById('message').innerText = 'Se ha enviado un enlace para restablecer tu contraseña a ' + email;
        document.getElementById('message').style.color = 'green';
    }, 1500);
});
