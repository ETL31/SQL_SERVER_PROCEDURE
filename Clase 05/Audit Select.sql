-- Se le pide implementar un procedure que realice la auditor�a
-- de accesos de lectura a una tabla sensible.

create or alter procedure UpCategoriasSelectAudit
(
    @IdCategor�a int,

	@Usuario     int,
	@Ip          varchar(255),
	@Pc          varchar(255)
)
as
begin
set nocount on

    Select
        IdCategor�a,NombreCategor�a,Descripci�n
      from dbo.Categor�as
	 where IdCategor�a=@IdCategor�a;

  insert into dbo.Categor�asAccesos
  (IdCategor�a,Usuario, IpAdress, Pc)
  values
  (@IdCategor�a,@Usuario, @Ip, @Pc);

end
