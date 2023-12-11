-- Realizar el cálculo del detalle de las ventas, ordenados por producto, en un proceso en línea
-- Producto 1, Precio 1, cantidad 1

DECLARE @Productos table
(
    Id             int identity(1,1) not null primary key,
	IdProducto     int,
	NombreProducto nvarchar(40),
	PrecioUnidad   decimal(18,6)
);
declare @DetallePedido table
(
    Id           int identity(1,1) not null primary key,  
	IdPedido     int,
	PrecioUnidad money,
	Cantidad     smallint,
	Monto        decimal(18,6)      
)
declare @n          int
declare @i          int
declare @IdProducto int

insert into @Productos
(IdProducto, NombreProducto, PrecioUnidad)
Select IdProducto, NombreProducto, PrecioUnidad from Productos -- Insert de un select
                                   -- Permite insertar los resultados de una consulta

set @n=(Select count(*) from @Productos);
set @i=1;

while (@i<@n)
begin
    set @IdProducto =(Select IdProducto from @Productos where Id=@i);
	print @IdProducto
	insert into @DetallePedido
	(IdPedido,Cantidad,PrecioUnidad,Monto)
	select IdPedido,Cantidad,PrecioUnidad,Cantidad*PrecioUnidad from dbo.[Detalles de pedidos] where IdProducto=@IdProducto

	set @i=@i+1
end

select*from @DetallePedido
