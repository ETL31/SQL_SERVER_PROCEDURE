-- Listar las paises, ciudades, cod. postal que tengan un cliente o un asesor
Select Pa�s,Ciudad,C�dPostal from [dbo].[Clientes]

Select Pa�s,Ciudad, C�dPostal from [dbo].[Empleados]

Select Pa�s,Ciudad,C�dPostal from [dbo].[Clientes]
union
Select Pa�s,Ciudad, C�dPostal from [dbo].[Empleados]
