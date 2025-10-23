from django import forms
from .models import Producto



class RegistroForm(forms.Form):
    nombre = forms.CharField(max_length=255, required=True, widget=forms.TextInput(attrs={'placeholder': 'Nombre'}))
    correo = forms.EmailField(max_length=255, required=True, widget=forms.EmailInput(attrs={'placeholder': 'Correo Electrónico'}))
    contraseña = forms.CharField(max_length=255, required=True, widget=forms.PasswordInput(attrs={'placeholder': 'Contraseña'}))
    confirmar_contraseña = forms.CharField(max_length=255, required=True, widget=forms.PasswordInput(attrs={'placeholder': 'Confirmar Contraseña'}))

    def clean(self):
        cleaned_data = super().clean()
        contraseña = cleaned_data.get('contraseña')
        confirmar = cleaned_data.get('confirmar_contraseña')

        if contraseña and confirmar and contraseña != confirmar:
            raise forms.ValidationError("Las contraseñas no coinciden.")
        
        return cleaned_data


from django import forms
from .models import Producto, Categoria, Proveedor, Marca, Stock

class ProductoForm(forms.ModelForm):
    # Campo extra para manejar el stock (tabla separada)
    stock_cantidad = forms.IntegerField(required=False, min_value=0, initial=0, label='Stock',
                                       widget=forms.NumberInput(attrs={'placeholder': 'Stock', 'min': '0'}))
    class Meta:
        model = Producto
        fields = [
            'codigo_producto',
            'nombre_producto',
            'descripcion_producto',
            'valor_producto',
            'categoria',
            'marca',            # Nuevo campo
            'proveedor',        # Nuevo campo
            'imagen_producto',
            'tallas_disponibles', 
            'colores_disponibles', 
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['codigo_producto'].widget.attrs.update({'placeholder': 'Código del Producto'})
        self.fields['nombre_producto'].widget.attrs.update({'placeholder': 'Nombre del Producto'})
        self.fields['descripcion_producto'].widget.attrs.update({'placeholder': 'Descripción'})
        self.fields['valor_producto'].widget.attrs.update({'placeholder': 'Valor', 'min': '1'})
        self.fields['tallas_disponibles'].widget.attrs.update({
            'placeholder': 'Ej: S, M, L, XL',
            'class': 'form-control',
        })
        self.fields['colores_disponibles'].widget.attrs.update({
            'placeholder': 'Ej: Rojo, Azul, Verde',
            'class': 'form-control',
        })
        self.fields['marca'].queryset = Marca.objects.all()
        self.fields['proveedor'].queryset = Proveedor.objects.all()
        # asegurar que el campo categoria exista y tenga queryset si es FK
        if 'categoria' in self.fields:
            self.fields['categoria'].queryset = Categoria.objects.all()
        # inicializar stock desde la relación OneToOne Stock si existe el instance
        if 'stock_cantidad' in self.fields:
            try:
                if getattr(self, 'instance', None) and hasattr(self.instance, 'stock') and self.instance.stock is not None:
                    self.fields['stock_cantidad'].initial = self.instance.stock.cantidad
            except Exception:
                # no bloquear si hay problemas al leer stock
                pass

    def save(self, commit=True):
        product = super().save(commit=commit)
        # actualizar/crear registro stock si se guardó el producto
        try:
            stock_val = self.cleaned_data.get('stock_cantidad')
        except Exception:
            stock_val = None
        if commit and stock_val is not None:
            try:
                Stock.objects.update_or_create(producto=product, defaults={'cantidad': int(stock_val) if stock_val is not None else 0})
            except Exception:
                # no detener el guardado del producto por errores de stock
                pass
        else:
            # si commit=False, dejar el valor pendiente en la instancia
            if stock_val is not None:
                setattr(product, '_pending_stock', stock_val)
        return product

from .models import Categoria

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nombre']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre de la categoría'}),
        }

from django import forms
from .models import Usuario

class UsuarioForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = ['nombre', 'correo', 'rol']

from django import forms
from .models import Marca, Proveedor

class MarcaForm(forms.ModelForm):
    class Meta:
        model = Marca
        fields = ['nombre', 'proveedores']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nombre de la marca'}),
            'proveedores': forms.SelectMultiple(attrs={'class': 'form-control'}),
        }
        
from .models import Proveedor

class ProveedorForm(forms.ModelForm):
    class Meta:
        model = Proveedor
        fields = ['nombre', 'correo', 'telefono', 'cedula', 'activo']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control'}),
            'telefono': forms.TextInput(attrs={'class': 'form-control'}),
            'cedula': forms.TextInput(attrs={'class': 'form-control'}),
            'activo': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
        }

from .models import Blog, Mensaje

class BlogForm(forms.ModelForm):
    class Meta:
        model = Blog
        fields = ['titulo', 'cuerpo', 'foto']
        
from django import forms
from .models import Mensaje

class MensajeForm(forms.ModelForm):
    class Meta:
        model = Mensaje
        fields = ['nombre', 'correo', 'telefono', 'mensaje']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su nombre'}),
            'correo': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su correo'}),
            'telefono': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese su número'}),
            'mensaje': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Ingrese su mensaje', 'rows': 4}),
        }

