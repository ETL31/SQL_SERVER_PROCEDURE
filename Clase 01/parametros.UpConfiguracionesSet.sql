-- Se le encarga la creación de un procedimiento almacenado. Registrará las variables de configuracion, mediante una
-- estructura de clave/valor: si la clave no existe, la agrega, sino la actualiza.

create or alter procedure parametros.UpConfiguracionesSet
(
    @ConfigKey   varchar(100),
	@ConfigValue varchar(100)
)
as
-- EXEC parametros.UpConfiguracionesSet 'MONEDA','USD'
-- EXEC parametros.UpConfiguracionesSet 'MONEDA_SIMBOLO','S/'
begin
set nocount on

    declare @Resultados int;
	                          -- COUNT(*): Cuenta cuantos registros existen.
	set @Resultados = (Select count(*) from parametros.Configuraciones where ConfigKey=@ConfigKey);
	SELECT @Resultados AS Resultados
	if(@Resultados = 0)
	begin
	    insert into parametros.Configuraciones
		(ConfigKey, ConfigValue)
		values
		(@ConfigKey, @ConfigValue)
	end
	else
	begin
	    update parametros.Configuraciones
		   set ConfigValue = @ConfigValue
		 where ConfigKey = @ConfigKey;
	end

end
