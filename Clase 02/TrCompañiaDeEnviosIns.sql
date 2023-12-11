create OR ALTER trigger dbo.TrCompañiaDeEnviosIns
on dbo.[Compañías de envíos]
after insert
as
begin
set nocount on

    insert into dbo.CompañíasDeEnvíosAudit
	(IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, Evento, FechaHora)
	select IdCompañíaEnvíos, NombreCompañía, Teléfono, Ruc, 'INSERT', SYSDATETIME()
      from INSERTED; -- Es una tabla especial, que solo existe dentro del trigger,
	                 -- con los datos del registro insertado.
end
