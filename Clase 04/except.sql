-- Listar las paises, ciudades, cod. postal que tengan un cliente pero no un asesor
Select Pa�s,Ciudad,C�dPostal from [dbo].[Clientes]
except
Select Pa�s,Ciudad, C�dPostal from [dbo].[Empleados]
