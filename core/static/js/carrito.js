// Datos de ejemplo de productos
const productos = [
    { id: 1, nombre: 'Producto 1', precio: 100 },
    { id: 2, nombre: 'Producto 2', precio: 200 },
    { id: 3, nombre: 'Producto 3', precio: 300 },
];

// Referencias a elementos HTML
const productosDiv = document.getElementById('productos');
const carritoDiv = document.getElementById('carrito');
const totalSpan = document.getElementById('total');

// Función para mostrar productos
function mostrarProductos() {
    productos.forEach(producto => {
        const productoDiv = document.createElement('div');
        productoDiv.classList.add('producto');
        productoDiv.innerHTML = `
            <span>${producto.nombre} - $${producto.precio}</span>
            <button class="boton-agregar" data-id="${producto.id}">Agregar al Carrito</button>
        `;
        productosDiv.appendChild(productoDiv);
    });
}

// Carrito de compras
let carrito = [];

// Función para agregar productos al carrito
function agregarAlCarrito(id) {
    const producto = productos.find(prod => prod.id === id);
    const productoEnCarrito = carrito.find(prod => prod.id === id);

    if (productoEnCarrito) {
        productoEnCarrito.cantidad += 1;
    } else {
        carrito.push({ ...producto, cantidad: 1 });
    }
    mostrarCarrito();
}

// Función para quitar productos del carrito
function quitarDelCarrito(id) {
    carrito = carrito.filter(producto => producto.id !== id);
    mostrarCarrito();
}

// Función para modificar la cantidad de productos en el carrito
function cambiarCantidad(id, cantidad) {
    const producto = carrito.find(prod => prod.id === id);
    if (producto) {
        producto.cantidad += cantidad;
        if (producto.cantidad <= 0) {
            quitarDelCarrito(id);
        } else {
            mostrarCarrito();
        }
    }
}

// Función para mostrar el carrito y calcular el total
function mostrarCarrito() {
    carritoDiv.innerHTML = ''; // Limpiar el contenido del carrito
    let total = 0;
    carrito.forEach(producto => {
        total += producto.precio * producto.cantidad;
        const productoDiv = document.createElement('div');
        productoDiv.classList.add('producto');
        productoDiv.innerHTML = `
            <span>${producto.nombre} - $${producto.precio} x ${producto.cantidad}</span>
            <div class="cantidad">
                <button class="boton-disminuir" data-id="${producto.id}">-</button>
                <span>${producto.cantidad}</span>
                <button class="boton-aumentar" data-id="${producto.id}">+</button>
                <button class="boton-quitar" data-id="${producto.id}">Quitar</button>
            </div>
        `;
        carritoDiv.appendChild(productoDiv);
    });
    totalSpan.innerText = total; // Actualizar el total
}

// Event Listener para los botones
document.addEventListener('click', function(event) {
    const id = parseInt(event.target.getAttribute('data-id'));

    if (event.target.classList.contains('boton-agregar')) {
        agregarAlCarrito(id);
    } else if (event.target.classList.contains('boton-quitar')) {
        quitarDelCarrito(id);
    } else if (event.target.classList.contains('boton-aumentar')) {
        cambiarCantidad(id, 1);
    } else if (event.target.classList.contains('boton-disminuir')) {
        cambiarCantidad(id, -1);
    }
});

// Inicializar la página mostrando los productos
mostrarProductos();