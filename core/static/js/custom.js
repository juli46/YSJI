
(function ($) {
	"use strict";

	// Loader
	$(window).on('load', function () {
		$('.preloader').fadeOut();
		$('#preloader').delay(550).fadeOut('slow');
		$('body').delay(450).css({ 'overflow': 'visible' });
	});

	// Fixed Menu
	$(window).on('scroll', function () {
		if ($(window).scrollTop() > 50) {
			$('.main-header').addClass('fixed-menu');
		} else {
			$('.main-header').removeClass('fixed-menu');
		}
	});

	// Gallery
	$('#slides-shop').superslides({
		inherit_width_from: '.cover-slides',
		inherit_height_from: '.cover-slides',
		play: 5000,
		animation: 'fade',
	});
	$(".cover-slides ul li").append("<div class='overlay-background'></div>");

	// Map Full
	$(document).ready(function () {
		$(window).on('scroll', function () {
			if ($(this).scrollTop() > 100) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
		$('#back-to-top').click(function () {
			$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
		});
	});

	// Special Menu
	var Container = $('.container');
	Container.imagesLoaded(function () {
		var portfolio = $('.special-menu');
		portfolio.on('click', 'button', function () {
			$(this).addClass('active').siblings().removeClass('active');
			var filterValue = $(this).attr('data-filter');
			$grid.isotope({ filter: filterValue });
		});
		var $grid = $('.special-list').isotope({
			itemSelector: '.special-grid'
		});
	});

	// BaguetteBox
	baguetteBox.run('.tz-gallery', {
		animation: 'fadeIn',
		noScrollbars: true
	});

	// Offer Box
	$('.offer-box').inewsticker({
		speed: 3000,
		effect: 'fade',
		dir: 'ltr',
		font_size: 13,
		color: '#ffffff',
		font_family: 'Montserrat, sans-serif',
		delay_after: 1000
	});

	// Tooltip
	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	});

	// Owl Carousel Instagram Feed
	$('.main-instagram').owlCarousel({
		loop: true,
		margin: 0,
		dots: false,
		autoplay: true,
		autoplayTimeout: 3000,
		autoplayHoverPause: true,
		navText: ["<i class='fas fa-arrow-left'></i>", "<i class='fas fa-arrow-right'></i>"],
		responsive: {
			0: { items: 2, nav: true },
			600: { items: 4, nav: true },
			1000: { items: 8, nav: true, loop: true }
		}
	});

	// Featured Products
	
	// Scroll
	$(document).ready(function () {
		$(window).on('scroll', function () {
			if ($(this).scrollTop() > 100) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
		$('#back-to-top').click(function () {
			$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
		});
	});

	// Slider Range y Filtros
	$(".brand-box").niceScroll({ cursorcolor: "#9b9b9c" });

	$("#slider-range").slider({
		range: true,
		min: 0,
		max: 5000000,
		values: [100000, 500000],
		slide: function (event, ui) {
			$("#amount").val("$" + ui.values[0].toLocaleString() + " - $" + ui.values[1].toLocaleString());
		}
	});
	$("#amount").val(
		"$" + $("#slider-range").slider("values", 0).toLocaleString() +
		" - $" + $("#slider-range").slider("values", 1).toLocaleString()
	);

	$("#filter-button").on("click", function () {
		const min = $("#slider-range").slider("values", 0);
		const max = $("#slider-range").slider("values", 1);

		const products = document.querySelectorAll('.product-col');
		products.forEach(product => {
			const price = parseInt(product.getAttribute('data-price'));
			product.style.display = (price >= min && price <= max) ? '' : 'none';
		});
	});

	// --- FUNCIONES GLOBALES PARA BOTONES (window.XXX) ---
	window.buyNow = function(nombre, precio, imagen) {
		localStorage.setItem('buyNowProduct', JSON.stringify([{ nombre, precio: parseFloat(precio), imagen, cantidad: 1 }]));
		window.location.href = "/pago/?buynow=1";
	};

	window.addToCart = function(nombre, precio, imagen) {
		let cart = JSON.parse(localStorage.getItem('cart')) || [];
		let producto = cart.find(p => p.nombre === nombre);
		if (producto) {
			producto.cantidad += 1;
		} else {
			cart.push({ nombre, precio: parseFloat(precio), imagen, cantidad: 1 });
		}
		localStorage.setItem('cart', JSON.stringify(cart));
		updateCartModal();
		const toastEl = document.getElementById('toastAddCart');
		if (toastEl) {
			const toast = new bootstrap.Toast(toastEl);
			toast.show();
		}
	};

	window.pay = function() {
		const toastEl = document.getElementById('toastPago');
		if (toastEl) {
			const toast = new bootstrap.Toast(toastEl);
			toast.show();
			setTimeout(() => {
				window.location.href = "/pago/";
			}, 1500);
		} else {
			window.location.href = "/pago/";
		}
	};

	window.clearCart = function() {
		localStorage.setItem('cart', JSON.stringify([]));
		updateCartModal();
	};

	window.updateCartModal = updateCartModal;

})(jQuery);

// --- FUNCIONES AUXILIARES FUERA DEL IIFE ---

function updateCartModal() {
	let cart = JSON.parse(localStorage.getItem('cart')) || [];
	let cartProducts = document.querySelector('.cart-products');
	if (!cartProducts) return;
	if (cart.length === 0) {
		cartProducts.innerHTML = '<p class="text-muted text-center">Tu carrito está vacío.</p>';
	} else {
		cartProducts.innerHTML = cart.map((item, index) => `
			<div class="d-flex align-items-center justify-content-between border-bottom py-2">
				<div class="d-flex align-items-center">
					<img src="${item.imagen}" alt="${item.nombre}" style="width:50px;height:50px;object-fit:cover;margin-right:10px;">
					<div>
						<strong>${item.nombre}</strong><br>
						<span class="text-primary">$${item.precio.toLocaleString()} COP</span>
						<br>Cantidad: ${item.cantidad}
					</div>
				</div>
				<div class="d-flex align-items-center gap-2">
					<input type="number" min="1" value="${item.cantidad}" onchange="updateQuantity(${index}, this.value)" style="width:60px;" class="form-control form-control-sm">
					<button class="btn btn-sm btn-outline-danger px-2 py-1" onclick="removeItem(${index})" title="Eliminar"><i class="bi bi-trash"></i></button>

				</div>
			</div>
		`).join('');
	}
	let total = cart.reduce((sum, item) => sum + item.precio * item.cantidad, 0);
	let totalElem = document.getElementById('total');
	if (totalElem) totalElem.textContent = `$${total.toLocaleString()} COP`;
	let badge = document.getElementById('cart-badge');
	if (badge) badge.textContent = cart.reduce((sum, item) => sum + item.cantidad, 0);
}

function updateQuantity(index, nuevaCantidad) {
	let cart = JSON.parse(localStorage.getItem('cart')) || [];
	nuevaCantidad = parseInt(nuevaCantidad);
	if (!isNaN(nuevaCantidad) && nuevaCantidad > 0) {
		cart[index].cantidad = nuevaCantidad;
		localStorage.setItem('cart', JSON.stringify(cart));
		updateCartModal();
	}
}

function removeItem(index) {
	let cart = JSON.parse(localStorage.getItem('cart')) || [];
	cart.splice(index, 1);
	localStorage.setItem('cart', JSON.stringify(cart));
	updateCartModal();
}

// Filtros de productos
function filterProducts() {
	const selectedBrand = document.querySelector('input[name="brand"]:checked')?.value;
	const products = document.querySelectorAll('.product-col');
	if (selectedBrand === undefined) {
		products.forEach(product => product.style.display = '');
	} else {
		products.forEach(product => {
			const productBrand = product.getAttribute('data-brand');
			product.style.display = (productBrand === selectedBrand) ? '' : 'none';
		});
	}
}
function showAllProducts() {
	const products = document.querySelectorAll('.product-col');
	products.forEach(product => product.style.display = '');
	const brandRadios = document.querySelectorAll('input[name="brand"]');
	brandRadios.forEach(radio => radio.checked = false);
}
function filterCategory(event, category) {
	event.preventDefault();
	const products = document.querySelectorAll('.product-col');
	if (category === 'Todos') {
		products.forEach(product => product.style.display = '');
	} else {
		products.forEach(product => {
			const productCategory = product.getAttribute('data-category');
			product.style.display = (productCategory === category) ? '' : 'none';
		});
	}
}

window.filterBrand = function(event, marca) {
    event.preventDefault();
    const url = new URL(window.location);
    if (marca === 'Todas') {
        url.searchParams.delete('marca');
    } else {
        url.searchParams.set('marca', marca);
    }
    url.searchParams.delete('page');
    window.location = url.toString();
};

// Inicialización del modal del carrito al cargar la página
document.addEventListener('DOMContentLoaded', updateCartModal);

function toggleFiltro(nombre) {
    // Cierra los otros
    ['categorias', 'marcas', 'precio'].forEach(id => {
        if (id !== nombre) {
            document.getElementById('filtro-' + id).classList.remove('show');
            document.querySelector('#filtro-' + id + ' .filtro-btn').setAttribute('aria-expanded','false');
        }
    });
    // Toggle el actual
    var cont = document.getElementById('filtro-' + nombre);
    var btn = cont.querySelector('.filtro-btn');
    cont.classList.toggle('show');
    btn.setAttribute('aria-expanded', cont.classList.contains('show'));
}
// Cerrar desplegables al hacer click fuera
document.addEventListener('click', function(e){
    ['categorias', 'marcas', 'precio'].forEach(id => {
        var el = document.getElementById('filtro-' + id);
        if (el && !el.contains(e.target)) {
            el.classList.remove('show');
            el.querySelector('.filtro-btn').setAttribute('aria-expanded','false');
        }
    });
});

$(function() {
    var minPrice = 0;
    var maxPrice = 5000000;
    var selectedMin = minPrice;
    var selectedMax = maxPrice;
    $("#slider-range").slider({
      range: true,
      min: minPrice,
      max: maxPrice,
      values: [selectedMin, selectedMax],
      slide: function(event, ui) {
        $("#precio-min-label").text('$' + ui.values[0].toLocaleString());
        $("#precio-max-label").text('$' + ui.values[1].toLocaleString());
      }
    });
    $("#precio-min-label").text('$' + selectedMin.toLocaleString());
    $("#precio-max-label").text('$' + selectedMax.toLocaleString());
});

$("#filter-button").on("click", function () {
    var slider = $("#slider-range").slider("values");
    var min = slider[0];
    var max = slider[1];
    const products = document.querySelectorAll('.product-col');
    products.forEach(product => {
        const price = parseInt(product.getAttribute('data-price'));
        product.style.display = (price >= min && price <= max) ? '' : 'none';
    });
});

function filterCategory(event, categoria) {
    event.preventDefault();
    const products = document.querySelectorAll('.product-col');
    if (categoria === 'Todos') {
        products.forEach(product => product.style.display = '');
    } else {
        products.forEach(product => {
            const productCategory = product.getAttribute('data-category');
            product.style.display = (productCategory === categoria) ? '' : 'none';
        });
    }
    document.querySelectorAll('.categoria-grid li').forEach(el => el.classList.remove('selected'));
    event.target.classList.add('selected');
}


