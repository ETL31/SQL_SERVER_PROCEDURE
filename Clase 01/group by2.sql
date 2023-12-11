-- Listar el numero de pedidos y monto de ventas, por cliente
-- Incluir del cliente, NombreCompa��a, NombreContacto y IdCliente

select
    Pedidos.IdCliente,
    Clientes.NombreCompa��a,
    Clientes.NombreContacto,
    count(IdPedido) as TotalPedidos,
    sum(Cargo) as MontoVentas
  from Pedidos
 inner join Clientes on Pedidos.IdCliente=Clientes.IdCliente
 group by Pedidos.IdCliente, Clientes.NombreCompa��a,Clientes.NombreContacto
