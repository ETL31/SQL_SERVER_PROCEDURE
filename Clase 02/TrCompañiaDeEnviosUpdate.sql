create OR ALTER trigger dbo.TrCompañiaDeEnviosUpdate
on dbo.[Compañías de envíos]
after Update
as
begin
set nocount on

    insert into dbo.CompañíasDeEnvíosAudit
	(IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, Evento, FechaHora)
	select IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, 'UPDATE', SYSDATETIME()
      from INSERTED;

end
