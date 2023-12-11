-- Listar las ventas de productos, se requiere el número de pedido y precio de venta

;with cte(
    IdPedido, NombreProducto, PrecioUnidad
) as (
    Select
       DP.IdPedido,
       P.NombreProducto,
       DP.PrecioUnidad
      from dbo.[Detalles de pedidos] DP -- DP: Alias de la tabla
     inner join Productos P on P.IdProducto= DP.IdProducto
)
Select IdPedido, NombreProducto, PrecioUnidad, sysdatetime() as FechaHora
  from cte
