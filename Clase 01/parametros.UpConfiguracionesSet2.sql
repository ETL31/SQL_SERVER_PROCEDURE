-- Se le encarga la creación de un procedimiento almacenado. Registrará las variables de configuracion, mediante una
-- estructura de clave/valor: si la clave no existe, la agrega, sino la actualiza.

create or alter procedure parametros.UpConfiguracionesSet2
(
    @ConfigKey   varchar(100),
	@ConfigValue varchar(100)
)
as
-- EXEC parametros.UpConfiguracionesSet2 'MONEDA','USD'
-- EXEC parametros.UpConfiguracionesSet2 'MONEDA_SIMBOLO','$'
-- EXEC parametros.UpConfiguracionesSet2 'RUC','12345678901'
begin
set nocount on

    declare @Resultados int;
	                          -- COUNT(*): Cuenta cuantos registros existen.
	set @Resultados = (Select count(*) from parametros.Configuraciones where ConfigKey=@ConfigKey);
	SELECT @Resultados AS Resultados
	if(@Resultados = 0)
	begin
	    insert into parametros.Configuraciones
		(ConfigKey, ConfigValue,FechaCreacion,FechaModificacion)
		values
		(@ConfigKey, @ConfigValue, GETDATE(), SYSDATETIME())
	end
	else
	begin
	    update parametros.Configuraciones
		   set ConfigValue = @ConfigValue,
		       FechaModificacion =SYSDATETIME()
		 where ConfigKey = @ConfigKey;
	end

end
