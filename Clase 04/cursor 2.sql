-- Elaborar un reporte de lista de productos, si las unidades en existencia son menores al stock, mostrar COMPRAR URGENTE,
-- de lo contrario mostrar STOCK ADECUADO

Declare @IdProducto            int
declare @NombreProducto        nvarchar(40)
declare @UnidadesEnExistencia  int
declare @UnidadesEnPedido      int

declare CrProductosCompra cursor for
Select IdProducto, NombreProducto, UnidadesEnExistencia, UnidadesEnPedido from Productos

Open CrProductosCompra
fetch next from CrProductosCompra
into @IdProducto, @NombreProducto, @UnidadesEnExistencia, @UnidadesEnPedido

while @@FETCH_STATUS=0
begin
    if(@UnidadesEnExistencia< @UnidadesEnPedido)
	    print @NombreProducto+': COMPRAR URGENTE'
	else
	    print @NombreProducto+': STOCK ADECUADO'

    fetch next from CrProductosCompra
    into @IdProducto, @NombreProducto, @UnidadesEnExistencia, @UnidadesEnPedido
end

close CrProductosCompra
deallocate CrProductosCompra