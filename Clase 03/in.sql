-- Se requiere listar los clientes de la ciudad de Londres

Select*
  from Clientes
 where Ciudad in('Londres')

 Select*
  from Clientes
 where Ciudad ='Londres'


 -- Se requiere listar los clientes de la ciudad de Londres, Madrid, Buenos Aires, Lisboa
  Select*
    from Clientes
   where Ciudad in('Londres', 'Madrid', 'Buenos Aires', 'Lisboa')

-- Se requiere listar los clientes de todas las ciudades, excepto Lion o Helsinki
  Select*from Clientes
  Select*from Clientes where Ciudad not in('Lion', 'Helsinki')
  Select*from Clientes where Ciudad in('Lion', 'Helsinki')

  -- Listar los vendedores que no sean de Seattle o Tacoma
    Select*from Empleados
    Select*from Empleados where Ciudad not in('Seattle','Tacoma') --in omite en su evaluacion los null
    Select*from Empleados where Ciudad in('Seattle','Tacoma')