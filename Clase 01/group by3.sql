-- Monto de Ventas por vendedor, ordenado por ventas, en modo descendente.

select
    IdEmpleado,
    sum(Cargo) as 'Monto Ventas'
  from Pedidos
 group by IdEmpleado
 order by sum(Cargo) desc
------------------------------------------------------------------------
-- Monto de Ventas por vendedor, ordenado por ventas, en modo descendente.
-- Mostrar el nombre completo del vendedor, incluyendo su cargo, en un solo campo
select
    Empleados.IdEmpleado,
	Empleados.Cargo + ' '+Tratamiento + ' '+Nombre + ' '+Apellidos as vendedor,
    sum(Pedidos.Cargo) as 'Monto Ventas'
  from Pedidos
 inner join Empleados on Empleados.IdEmpleado=Pedidos.IdEmpleado
 group by Empleados.IdEmpleado, Empleados.Cargo + ' '+Tratamiento + ' '+Nombre + ' '+Apellidos
 order by sum(Pedidos.Cargo) desc