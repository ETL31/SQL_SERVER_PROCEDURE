create OR ALTER trigger dbo.TrCompa�iaDeEnviosUpdate
on dbo.[Compa��as de env�os]
after Update
as
begin
set nocount on

    insert into dbo.Compa��asDeEnv�osAudit
	(IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, Evento, FechaHora)
	select IdCompa��aEnv�os, NombreCompa��a, Tel�fono, Ruc, 'UPDATE', SYSDATETIME()
      from INSERTED;

end
