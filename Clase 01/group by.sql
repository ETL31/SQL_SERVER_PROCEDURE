-- Listar el numero de pedidos y monto de ventas, por cliente

select
    IdCliente,
    count(IdPedido) as TotalPedidos,
    sum(Cargo) as MontoVentas
  from Pedidos
 group by IdCliente
