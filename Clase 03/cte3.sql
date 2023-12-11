-- Listar las ventas de productos, se requiere el numero de pedido, precio de venta,
-- mediante un procedimiento almacenado
create or alter proc UpProductosVentas -- PROC: Abreviatura de procedure
as
begin
set nocount on

    ;with cte3 (
	    IdPedido, IdProducto, NombreProducto, PrecioUnidad
    ) as (Select
	        DP.IdPedido,
	        DP.IdProducto,
	    	P.NombreProducto,
	    	DP.PrecioUnidad
	      from dbo.[Detalles de pedidos] DP
	     inner join Productos P on P.IdProducto=dp.IdProducto
    )
	Select IdPedido, IdProducto, NombreProducto, PrecioUnidad
	  from cte3

end
