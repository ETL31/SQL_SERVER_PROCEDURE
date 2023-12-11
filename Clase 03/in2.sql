-- Listar Los clientes que tengan un asesor en su ciudad

Select*from Clientes
where ciudad in(Select ciudad from Empleados)


Select*from Clientes
where ciudad in(Select distinct ciudad from Empleados)

Select ciudad from Empleados 
Select distinct ciudad from Empleados -- Distinct omite repetidos