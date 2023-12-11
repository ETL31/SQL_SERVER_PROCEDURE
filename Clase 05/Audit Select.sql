-- Se le pide implementar un procedure que realice la auditoría
-- de accesos de lectura a una tabla sensible.

create or alter procedure UpCategoriasSelectAudit
(
    @IdCategoría int,

	@Usuario     int,
	@Ip          varchar(255),
	@Pc          varchar(255)
)
as
begin
set nocount on

    Select
        IdCategoría,NombreCategoría,Descripción
      from dbo.Categorías
	 where IdCategoría=@IdCategoría;

  insert into dbo.CategoríasAccesos
  (IdCategoría,Usuario, IpAdress, Pc)
  values
  (@IdCategoría,@Usuario, @Ip, @Pc);

end
