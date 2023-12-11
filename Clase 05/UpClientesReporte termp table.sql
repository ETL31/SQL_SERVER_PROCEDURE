-- Le piden informacion de los clientes:
--  - 10 clientes con mas pedidos y las cantidades.
--  - 10 clientes con mayor monto de pedidos.

-- Por optimizacion, le piden usar tablas temporales.


create or alter proc UpClientesReporte
(
     @FechaInicio datetime2(7),
     @FechaFin    datetime2(7)
)
as
-- Exec UpClientesReporte '1996-01-01T00:00:00.0000000','1996-12-31T23:59:59.9999999'
begin
set nocount on

create table #ClientesPedidosCantidades
(
    Id   int identity(1,1) not null primary key,
	IdCliente nvarchar(5),
	NombreCompa��a nvarchar(40),
	cantidad int
);

create table #ClientesPedidosMonto
(
    Id   int identity(1,1) not null primary key,
	IdCliente nvarchar(5),
	NombreCompa��a nvarchar(40),
	Monto decimal(18,6)
);

   insert into #ClientesPedidosCantidades
   (IdCliente,NombreCompa��a,cantidad)
    Select top 10
	   Pedidos.IdCliente,
	   NombreCompa��a,
	   count(IdPedido) as Cantidades
	  from Pedidos
    inner join Clientes on Clientes.IdCliente =Pedidos.IdCliente
	where Pedidos.FechaPedido between @FechaInicio and @FechaFin
	group by Pedidos.IdCliente,NombreCompa��a
	order by count(IdPedido) desc;


   insert into #ClientesPedidosMonto
   (IdCliente,NombreCompa��a,Monto)
    Select top 10
	   Pedidos.IdCliente,
	   NombreCompa��a,
	   sum(Cargo) as Monto
	  from Pedidos
    inner join Clientes on Clientes.IdCliente =Pedidos.IdCliente
	where Pedidos.FechaPedido between @FechaInicio and @FechaFin
	group by Pedidos.IdCliente,NombreCompa��a
	order by sum(Cargo) desc;

Select*from #ClientesPedidosCantidades
Select*from #ClientesPedidosMonto

end
