function toggleMenu(resetForm = false) {
    const menu = document.getElementById('addMenu');
    const overlay = document.getElementById('overlay');
    const form = document.getElementById('productForm');
    const isMenuVisible = menu.classList.contains('show');

    if (isMenuVisible) {
        if (resetForm) form.reset();
        menu.classList.remove('show');
        overlay.classList.remove('show');
        document.body.style.overflow = '';
    } else {
        form.reset();
        menu.classList.add('show');
        overlay.classList.add('show');
        document.body.style.overflow = 'hidden';
    }
}

function guardarFormulario() {
    let valid = true;

    const codigoProducto = (document.querySelector('[name="codigo_producto"]') || {}).value?.trim() || '';
    const nombreProducto = (document.querySelector('[name="nombre_producto"]') || {}).value?.trim() || '';
    const descripcionProducto = (document.querySelector('[name="descripcion_producto"]') || {}).value?.trim() || '';
    const valorProducto = (document.querySelector('[name="valor_producto"]') || {}).value?.trim() || '';
    const cantidadProducto = (document.querySelector('[name="cantidad_producto"]') || {}).value?.trim() || '';
    const categoriaProducto = (document.querySelector('[name="categoria"]') || {}).value?.trim() || '';

    const regexCodigo = /^[A-Z0-9]+$/;
    const regexNombre = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/;

    if (!regexCodigo.test(codigoProducto)) {
        Swal.fire("Error", "El código debe contener solo letras mayúsculas y números sin espacios.", "error");
        valid = false;
    }

    if (!regexNombre.test(nombreProducto)) {
        Swal.fire("Error", "El nombre solo puede contener letras y espacios.", "error");
        valid = false;
    }

    if (!regexNombre.test(descripcionProducto)) {
        Swal.fire("Error", "La descripción solo puede contener letras y espacios.", "error");
        valid = false;
    }

    if (!/^\d+(\.\d{1,2})?$/.test(valorProducto) || parseFloat(valorProducto) <= 0) {
        Swal.fire("Error", "El valor debe ser un número positivo.", "error");
        valid = false;
    }

    if (!/^\d+$/.test(cantidadProducto) || parseInt(cantidadProducto) <= 0) {
        Swal.fire("Error", "La cantidad debe ser un número entero positivo.", "error");
        valid = false;
    }

    if (!categoriaProducto) {
        Swal.fire("Error", "Debe seleccionar una categoría.", "error");
        valid = false;
    }

    if (valid) {
        const formData = new FormData();
        formData.append("codigo_producto", codigoProducto);
        formData.append("nombre_producto", nombreProducto);
        formData.append("descripcion_producto", descripcionProducto);
        formData.append("valor_producto", valorProducto);
        formData.append("cantidad_producto", cantidadProducto);
    formData.append("categoria", categoriaProducto);

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/AgregarProducto/", true);
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest"); // ✔️ Clave para que Django reconozca AJAX
        xhr.onload = function () {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.success) {
                    cargarProductos();
                    toggleMenu(true);
                    Swal.fire("Producto Agregado", "", "success");
                } else {
                    Swal.fire("Error", response.error || "Hubo un problema al guardar.", "error");
                }
            } else {
                Swal.fire("Error", "Error en la solicitud al servidor", "error");
            }
        };
        xhr.send(formData);

        return false;
    }

    return false;
}

window.onload = cargarProductos;



        
