create OR ALTER trigger dbo.TrCompañiaDeEnviosDelete
on dbo.[Compañías de envíos]
after Delete
as
begin
set nocount on

    insert into dbo.CompañíasDeEnvíosAudit
	(IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, Evento, FechaHora)
	select IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, 'DELETE', SYSDATETIME()
      from DELETED;

end
