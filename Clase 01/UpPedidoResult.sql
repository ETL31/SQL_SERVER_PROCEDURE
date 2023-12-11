-- Un centro comercial, necesita calcular el igv de sus productos, si el producto es cat 1,2,3 es perecible y no tiene
-- igv, si la compra en un restaurante, es categoria 4,5,6, tiene igv del 8%, sino tiene igv del 18%.
-- Se le pide un procedimiento almacenado. Se pide el detalle por pedido, enviado por parámetro.

create or alter procedure dbo.UpPedidoResult
(
    @IdPedido  int
)
as
-- EXEC dbo.UpPedidoResult 10248
begin
set nocount on
	Select 
	    P.NombreProducto,
		P.IdCategoría,
	    DP.IdProducto,
		DP.PrecioUnidad,
		DP.Cantidad,
		(DP.PrecioUnidad*DP.Cantidad-DP.Descuento) as Monto Neto,
		case
		    when P.IdCategoría=1 or P.IdCategoría=2 or P.IdCategoría=3 then 0.0
			when P.IdCategoría=4 or P.IdCategoría=5 or P.IdCategoría=6 then (DP.PrecioUnidad*DP.Cantidad-DP.Descuento)*0.08
			else (DP.PrecioUnidad*DP.Cantidad-DP.Descuento)*0.18
		end as Igv
	  from dbo.Detalles de pedidos DP
	 inner join Productos P on P.IdProducto=DP.IdProducto
	  where DP.IdPedido=@IdPedido
end
