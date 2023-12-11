-- Le piden un reporte de los productos mas vendidos, por cantidad, por clientes y por monto total de
-- ventas, en un rango de fechas. Deberá mostrar el precio y categoria.
-- Deberá usar tabla temporal y procedimiento almacenado para mostrar los resultados.

create or alter procedure UpProductosReporte
(
    @FechaInicial datetime2(7),
    @FechaFinal   datetime2(7)
)
as
-- Exec UpProductosReporte '1996-07-01','1996-08-31'
begin
set nocount on

    declare @ProductosReporte table
	(
	    id int identity(1,1) not null primary key,
		NombreCategoría nvarchar(15),
		IdProducto   int,
		NombreProducto  nvarchar(40),
		PrecioUnidad  money,
		ProductosMasVendidosCantidad int,
		CantidadClientes int,
		MontoTotalDeVentas decimal(18,6)
	);

	insert into @ProductosReporte
	(NombreCategoría,IdProducto,NombreProducto,PrecioUnidad,ProductosMasVendidosCantidad,CantidadClientes,MontoTotalDeVentas)
   select
       Categorías.NombreCategoría,
       Productos.IdProducto,
	   Productos.NombreProducto,
	   Productos.PrecioUnidad,
	   sum(DP.Cantidad) as ProductosMasVendidosCantidad,
	   count(Clientes.IdCliente)as CantidadClientes,
	   sum(DP.Cantidad*Productos.PrecioUnidad-DP.Descuento) as MontoTotalDeVentas
	 from
        dbo.[Detalles de pedidos] DP
	 inner join Pedidos on Pedidos.IdPedido=DP.IdPedido
     inner join Productos on DP.IdProducto=Productos.IdProducto
	 inner join Categorías on Categorías.IdCategoría=Productos.IdCategoría
	 inner join Clientes on Clientes.IdCliente=Pedidos.IdCliente
	where Pedidos.FechaPedido between @FechaInicial and @FechaFinal
	 group by Categorías.NombreCategoría,
	   Productos.IdProducto,
	   Productos.NombreProducto,
	   Productos.PrecioUnidad
	 order by sum(DP.Cantidad) desc;

	 select*from @ProductosReporte
end
