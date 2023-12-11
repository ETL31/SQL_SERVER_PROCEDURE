-- Un centro comercial, necesita calcular el igv de sus productos, si el producto es cat 1,2,3 es perecible y no tiene
-- igv, si la compra en un restaurante, es categoria 4,5,6, tiene igv del 8%, sino tiene igv del 18%.
-- Se le pide un procedimiento almacenado. Se pide el detalle por pedido, enviado por par�metro.

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
		P.IdCategor�a,
	    DP.IdProducto,
		DP.PrecioUnidad,
		DP.Cantidad,
		(DP.PrecioUnidad*DP.Cantidad-DP.Descuento) as Monto Neto,
		case
		    when P.IdCategor�a=1 or P.IdCategor�a=2 or P.IdCategor�a=3 then 0.0
			when P.IdCategor�a=4 or P.IdCategor�a=5 or P.IdCategor�a=6 then (DP.PrecioUnidad*DP.Cantidad-DP.Descuento)*0.08
			else (DP.PrecioUnidad*DP.Cantidad-DP.Descuento)*0.18
		end as Igv
	  from dbo.Detalles de pedidos DP
	 inner join Productos P on P.IdProducto=DP.IdProducto
	  where DP.IdPedido=@IdPedido
end
