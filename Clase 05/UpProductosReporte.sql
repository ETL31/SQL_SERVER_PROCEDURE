-- Le piden un reporte de los productos mas vendidos, por cantidad, por clientes y por monto total de
-- ventas, en un rango de fechas. Deber� mostrar el precio y categoria.
-- Deber� usar tabla temporal y procedimiento almacenado para mostrar los resultados.

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
		NombreCategor�a nvarchar(15),
		IdProducto   int,
		NombreProducto  nvarchar(40),
		PrecioUnidad  money,
		ProductosMasVendidosCantidad int,
		CantidadClientes int,
		MontoTotalDeVentas decimal(18,6)
	);

	insert into @ProductosReporte
	(NombreCategor�a,IdProducto,NombreProducto,PrecioUnidad,ProductosMasVendidosCantidad,CantidadClientes,MontoTotalDeVentas)
   select
       Categor�as.NombreCategor�a,
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
	 inner join Categor�as on Categor�as.IdCategor�a=Productos.IdCategor�a
	 inner join Clientes on Clientes.IdCliente=Pedidos.IdCliente
	where Pedidos.FechaPedido between @FechaInicial and @FechaFinal
	 group by Categor�as.NombreCategor�a,
	   Productos.IdProducto,
	   Productos.NombreProducto,
	   Productos.PrecioUnidad
	 order by sum(DP.Cantidad) desc;

	 select*from @ProductosReporte
end
