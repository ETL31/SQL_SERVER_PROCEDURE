update dbo.Categorías
set NombreCategoría='Panadería', 
    Descripción='Todos los productos de panadería',

	UsuarioModificacion=2,
	IpModificacion='192.168.1.101',
	PcModificacion=null,
	FechaHoraModificacion=SYSDATETIME()
where IdCategoría=10
