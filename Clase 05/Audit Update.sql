update dbo.Categor�as
set NombreCategor�a='Panader�a', 
    Descripci�n='Todos los productos de panader�a',

	UsuarioModificacion=2,
	IpModificacion='192.168.1.101',
	PcModificacion=null,
	FechaHoraModificacion=SYSDATETIME()
where IdCategor�a=10
