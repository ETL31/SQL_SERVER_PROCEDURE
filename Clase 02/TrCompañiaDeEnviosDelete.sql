create OR ALTER trigger dbo.TrCompa�iaDeEnviosDelete
on dbo.[Compa��as de env�os]
after Delete
as
begin
set nocount on

    insert into dbo.Compa��asDeEnv�osAudit
	(IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, Evento, FechaHora)
	select IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, 'DELETE', SYSDATETIME()
      from DELETED;

end
