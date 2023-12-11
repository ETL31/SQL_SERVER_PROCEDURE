-- Listar las paises, ciudades, cod. postal que tengan un cliente o un asesor
Select País,Ciudad,CódPostal from [dbo].[Clientes]

Select País,Ciudad, CódPostal from [dbo].[Empleados]

Select País,Ciudad,CódPostal from [dbo].[Clientes]
union
Select País,Ciudad, CódPostal from [dbo].[Empleados]
