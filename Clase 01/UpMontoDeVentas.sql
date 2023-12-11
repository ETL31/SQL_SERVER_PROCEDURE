-- Implementar un procedure:
--  * Listar el monto de las ventas de los empleados en un rango de fechas.
--  * Incluir numero de Pedidos.
--  * Incluir el mayor y menor monto de ventas.
create or alter procedure UpMontoDeVentas
(
    @FechaInicial  datetime,
    @FechaFinal    datetime
)
as
-- EXEC UpMontoDeVentas '1996-05-01T00:00:00.000', '1996-08-31T23:59:59.997'
begin
set nocount on

    select
	    IdEmpleado,
	    sum(Cargo) as 'Monto de las ventas',
		count(IdPedido) as 'Numero de Pedidos',
	    max(Cargo) as 'Maxima venta',
	    min(Cargo) as 'Minima venta'
      from Pedidos
	 where FechaPedido>=@FechaInicial and FechaPedido<=@FechaFinal
	  group by IdEmpleado
end
