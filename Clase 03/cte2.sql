-- Listar las ventas por cliente, agregar una columna de numeraci�n

;with cte2 (
    IdCliente,NombreCompa��a, Ventas
) as (
    Select
        Pedidos.IdCliente,
    	Clientes.NombreCompa��a,
    	sum(Pedidos.Cargo) as Ventas
      from dbo.Pedidos
     inner join Clientes on Clientes.IdCliente=Pedidos.IdCliente
     group by Pedidos.IdCliente, Clientes.NombreCompa��a
)
Select 
    ROW_NUMBER() over(Order by IdCliente) as Fila,
    IdCliente,NombreCompa��a, Ventas as [Resultado Ventas]
  from cte2;
