insert into dbo.CategoriasEliminadas
(IdCategoría, NombreCategoría, Descripción, 
MotivoEliminacion, UsuarioCreacion, IpCreacion, PcCreacion, FechaHoraCreacion)
select IdCategoría, NombreCategoría, Descripción,
'No se vende ese tipo de producto',
3,'192.168.1.102','PC-01',SYSDATETIME()
from dbo.Categorías
where  dbo.Categorías.IdCategoría=10;

delete from dbo.Categorías
where  dbo.Categorías.IdCategoría=10;
