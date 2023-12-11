-- En el procedure de configuración, el auditor le pide agregar los campos fecha de creación y fecha de modificación
-- Agregar transacciones y excepciones en el procedimiento
create or alter procedure parametros.UpConfiguracionesSet3
(
    @ConfigKey   varchar(100),
	@ConfigValue varchar(100)
)
as
-- EXEC parametros.UpConfiguracionesSet3 'COTIZACION','3.63'
-- EXEC parametros.UpConfiguracionesSet3 'MONEDA_SIMBOLO','$'
-- EXEC parametros.UpConfiguracionesSet3 'RUC','12345678901'
begin
set nocount on

    declare @Resultados     int;
	declare @ErrorNum       int;
	declare @ErrorProcedure varchar(200);
	declare @ErrorMessage   varchar(MAX);

	begin try
	    begin transaction
	                              -- COUNT(*): Cuenta cuantos registros existen.
	    set @Resultados = (Select count(*) from parametros.Configuraciones where ConfigKey=@ConfigKey);
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
		commit transaction
		print 'Operación exitosa.'
	end try
	begin catch
	    set @ErrorNum = ERROR_NUMBER();
	    set @ErrorProcedure = ERROR_PROCEDURE();
	    set @ErrorMessage = ERROR_MESSAGE();

		insert into dbo.Errores
		(ErrorNum,ErrorProcedure,ErrorMessage)
		values
		(@ErrorNum,@ErrorProcedure,@ErrorMessage)
	    print 'Ocurrió un error al realizar la operación.'
		rollback
	end catch

end
