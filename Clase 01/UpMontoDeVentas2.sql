-- Listar el monto de las ventas de los empleados en un rango de fechas.
-- Incluir numero de Pedidos.
-- Incluir el promedio, mayor y menor monto de ventas.
-- Debera incluir aquellos empleados que cumplan con monto de ventas minimo.
create or alter procedure UpMontoDeVentas2
(
    @FechaInicial  datetime,
    @FechaFinal    datetime,
	@MontoMinimo   decimal(18,6)
)
as
-- EXEC UpMontoDeVentas2 '1996-05-01T00:00:00.000', '1996-08-31T23:59:59.997', 0
-- EXEC UpMontoDeVentas2 '1996-05-01T00:00:00.000', '1996-08-31T23:59:59.997', 30
begin
set nocount on

    select
	    IdEmpleado,
	    sum(Cargo) as 'Monto de las ventas',
		count(IdPedido) as 'Numero de Pedidos',
		avg(Cargo) as 'Promedio', 
	    max(Cargo) as 'Maxima venta',
	    min(Cargo) as 'Minima venta'
      from Pedidos
	 where FechaPedido>=@FechaInicial and FechaPedido<=@FechaFinal
	 group by IdEmpleado
	having sum(Cargo)>=@MontoMinimo
end