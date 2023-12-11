-- Listar las paises, ciudades, cod. postal que tengan un cliente pero no un asesor
Select País,Ciudad,CódPostal from [dbo].[Clientes]
except
Select País,Ciudad, CódPostal from [dbo].[Empleados]
