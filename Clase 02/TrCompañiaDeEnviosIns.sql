create OR ALTER trigger dbo.TrCompa�iaDeEnviosIns
on dbo.[Compa��as de env�os]
after insert
as
begin
set nocount on

    insert into dbo.Compa��asDeEnv�osAudit
	(IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, Evento, FechaHora)
	select IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, 'INSERT', SYSDATETIME()
      from INSERTED; -- Es una tabla especial, que solo existe dentro del trigger,
	                 -- con los datos del registro insertado.
end
