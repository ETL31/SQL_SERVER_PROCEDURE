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
		IdCategoría, 
		CantidadPorUnidad, 
		PrecioUnidad, 
		UnidadesEnExistencia, 
		UnidadesEnPedido, 
		NivelNuevoPedido, 
		Suspendido,
		case
		    when IdCategoría=1 or IdCategoría=2 then 'Descuento por categoría'
		    when IdCategoría=3 or IdCategoría=4 then 'Descuento por fiestas patrias'
		    when IdCategoría=5 or IdCategoría=6 then 'Acumula el doble de puntos'
			-- No siempre se pone 'else'
		end as Promocion
   from Productos
end
