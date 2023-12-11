CREATE or alter PROCEDURE UP_ERRORES_INSERT
AS
BEGIN
SET NOCOUNT ON

    DECLARE @ErrorNum        INT
	DECLARE @ErrorProcedure  varchar(200)
	DECLARE @ErrorMessage    varchar(MAX)
	
	DECLARE @a int
	DECLARE @b int
	DECLARE @c int
	
	set @a=1
	set @b=0

	begin try
	    set @c= @a/@b;
	end try
	begin catch
	   set @ErrorNum= ERROR_NUMBER();
	   set @ErrorProcedure= ERROR_PROCEDURE();
	   set @ErrorMessage= ERROR_MESSAGE();

	   insert into dbo.Errores
	   (ErrorNum,ErrorProcedure,ErrorMessage)
	   values
	   (@ErrorNum,@ErrorProcedure,@ErrorMessage);

	end catch 
END
