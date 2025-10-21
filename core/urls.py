from django.urls import path
from . import views
from .views import usuarios_lista
from .views import buscar_view

urlpatterns = [
    #Inicio
    path('', views.index_view, name='index'), 
    path('SobreNostros/', views.SobreNosotros_view, name='SobreNosotros'),
    path('Catalogo/', views.Catalogo_view, name='Catalogo'),
    path('Contactenos/', views.Contactenos_view, name='Contactenos'),
    
    #Login
    path('login/', views.login_register_view, name='login'),
    path('logout/', views.logout_view, name='logout'),

    #Cliente
    path('cuenta/', views.cuenta_view, name='cuenta'),
    path('editar_perfil/', views.editar_perfil_view, name='editar_perfil'),
    path('pedido/<int:pedido_id>/cancelar/', views.cancelar_pedido_view, name='cancelar_pedido'),
    path('producto/<int:pk>/', views.producto_detalle_publico, name='producto_detalle_publico'),

    #Administracion
    path('dashboard/', views.dashboard_view, name='dashboard'),
   
    #--Usuarios--
    path('usuarios/', usuarios_lista, name='dashboard_usuarios'),
    path('usuarios/agregar/', views.usuario_agregar, name='usuario_agregar'),
    path('usuarios/editar/<int:pk>/', views.usuario_editar, name='usuario_editar'),
    path('usuarios/eliminar/<int:pk>/', views.usuario_eliminar, name='usuario_eliminar'),
    path('usuarios/', usuarios_lista, name='usuarios_lista'),
    
    #--Proveedor--
    path('proveedores/', views.dashboard_proveedores, name='dashboard_proveedores'),
    path('proveedores/agregar/', views.proveedor_agregar, name='proveedor_agregar'),
    path('proveedores/editar/<int:pk>/', views.proveedor_editar, name='proveedor_editar'),
    path('proveedores/eliminar/<int:pk>/', views.proveedor_eliminar, name='proveedor_eliminar'),
    path('proveedores/',views.dashboard_proveedores, name='dashboard_proveedores'),
    
    #--Productos--
    path('AgregarProducto/', views.AgregarProducto_view, name='AgregarProducto'),
    path('productos/editar/<int:producto_id>/', views.editar_producto_view, name='editar_producto'),
    path('productos/eliminar/<int:producto_id>/', views.eliminar_producto_view, name='eliminar_producto'),
    path('producto/<int:producto_id>/', views.producto_detalle, name='producto_detalle'),
    path('dashboard/producto/<int:pk>/', views.producto_detalle_dashboard, name='producto_detalle_dashboard'),
    path('productos/buscar/', buscar_view, name='buscar_productos'),
    path('validar-codigo/', views.validar_codigo_unico, name='validar_codigo'),
    
    #--Pedidos---
    path('pedidos/', views.pedidos_dashboard_view, name='dashboard_pedidos'),
    path('pedidos/cambiar_estado/<int:pedido_id>/', views.cambiar_estado_pedido_view, name='cambiar_estado_pedido'),

    #--Marcas--
    path('marcas/', views.marcas_list, name='marcas_list'),
    path('marcas/agregar/', views.marca_agregar, name='marca_agregar'),
    path('marcas/<int:pk>/editar/', views.marca_editar, name='marca_editar'),
    path('marcas/<int:pk>/eliminar/', views.marca_eliminar, name='marca_eliminar'),
    
    #--Categoria--
    path('AgregarCategoria/', views.AgregarCategoria_view, name='AgregarCategoria'),
    path('dashboard/categorias/', views.categorias_list, name='dashboard_categorias'),
    path('categoria/agregar/', views.categoria_agregar, name='categoria_agregar'),
    path('categoria/editar/<int:pk>/', views.categoria_editar, name='categoria_editar'),
    path('categoria/eliminar/<int:pk>/', views.categoria_eliminar, name='categoria_eliminar'),
    path('editar_categoria/<int:categoria_id>/', views.editar_categoria_view, name='editar_categoria'),
    path('eliminar_categoria/<int:categoria_id>/', views.eliminar_categoria_view, name='eliminar_categoria'),

    #--Pagos--
    path('pago/', views.pago_view, name='pago'),
    path('verificar-correo/', views.verificar_correo, name='verificar_correo'),
    path('verificar-correo-proveedor/', views.verificar_correo_proveedor, name='verificar_correo_proveedor'),
    
    #--Informes Excel--
    path('dashboard/exportar/<str:modelo>/', views.exportar_modelo_excel, name='exportar_modelo_excel'),

    #--Informe PDF--
    path("informe-ventas/", views.generar_informe_ventas, name="informe_ventas"),

    #--Blog--
    path('blogs/', views.dashboard_blogs, name='blog_list'),
    path('blog/editar/<int:blog_id>/', views.editar_blog, name='editar_blog'),
    path('blog/eliminar/<int:blog_id>/', views.eliminar_blog, name='eliminar_blog'),
    # --Mensajes de Contacto--
    path('contacto/', views.Contactenos_view, name='contacto'),
    path('dashboard/contactos/', views.dashboard_contacto, name='dashboard_contacto'),
    path('contactos/eliminar/<int:mensaje_id>/', views.eliminar_mensaje, name='eliminar_mensaje'),
    path('contactos/eliminar-todos/', views.eliminar_todos_mensajes, name='eliminar_todos_mensajes'),
]


