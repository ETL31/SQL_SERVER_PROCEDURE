insert into dbo.CategoriasEliminadas
(IdCategor�a, NombreCategor�a, Descripci�n, 
MotivoEliminacion, UsuarioCreacion, IpCreacion, PcCreacion, FechaHoraCreacion)
select IdCategor�a, NombreCategor�a, Descripci�n,
'No se vende ese tipo de producto',
3,'192.168.1.102','PC-01',SYSDATETIME()
from dbo.Categor�as
where  dbo.Categor�as.IdCategor�a=10;

delete from dbo.Categor�as
where  dbo.Categor�as.IdCategor�a=10;
