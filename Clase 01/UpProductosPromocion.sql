-- Un centro comercial, necesita mostrar las promociones de sus productos, en su catalogo virtual
-- Si es categoria 1,2, tendra el mensaje: Descuento por categoria.
-- Si es categoria 3,4, tendra el mensaje: Descuento por fiestas patrias.
-- Si es categoria 5,6, tendra el mensaje: Acumula el doble de puntos.

create or alter procedure UpProductosPromocion
as
-- Exec UpProductosPromocion
begin
set nocount on

    select 
	    IdProducto, 
		NombreProducto, 
		IdProveedor, 
		IdCategor�a, 
		CantidadPorUnidad, 
		PrecioUnidad, 
		UnidadesEnExistencia, 
		UnidadesEnPedido, 
		NivelNuevoPedido, 
		Suspendido,
		case
		    when IdCategor�a=1 or IdCategor�a=2 then 'Descuento por categor�a'
		    when IdCategor�a=3 or IdCategor�a=4 then 'Descuento por fiestas patrias'
		    when IdCategor�a=5 or IdCategor�a=6 then 'Acumula el doble de puntos'
			-- No siempre se pone 'else'
		end as Promocion
   from Productos
end
