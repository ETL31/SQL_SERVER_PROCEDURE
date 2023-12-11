-- Listar las ventas por cliente, agregar una columna de numeración

;with cte2 (
    IdCliente,NombreCompañía, Ventas
) as (
    Select
        Pedidos.IdCliente,
    	Clientes.NombreCompañía,
    	sum(Pedidos.Cargo) as Ventas
      from dbo.Pedidos
     inner join Clientes on Clientes.IdCliente=Pedidos.IdCliente
     group by Pedidos.IdCliente, Clientes.NombreCompañía
)
Select 
    ROW_NUMBER() over(Order by IdCliente) as Fila,
    IdCliente,NombreCompañía, Ventas as [Resultado Ventas]
  from cte2;
