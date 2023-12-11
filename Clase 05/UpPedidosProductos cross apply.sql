-- Listar las ventas de productos, se requiere el número de pedido, código y nombre de producto.

create or alter proc UpPedidosProductos
as
begin
set nocount on

    Select
	    DP.IdPedido,
	    DP.IdProducto,
		Productos.NombreProducto
	from dbo.[Detalles de pedidos] DP
	inner join Productos on Productos.IdProducto=DP.IdProducto;

    Select
	    DP.IdPedido,
	    DP.IdProducto,
		prod.NombreProducto
	from dbo.[Detalles de pedidos] DP
   cross apply(Select Productos.NombreProducto, Productos.CantidadPorUnidad
	             from Productos 
				 where Productos.IdProducto=DP.IdProducto) prod
end
