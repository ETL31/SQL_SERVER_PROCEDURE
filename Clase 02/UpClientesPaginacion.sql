-- Se requiere un procedimiento que sirva de origen de datos para un reporte de Clientes.
-- Debe mostrar todos los datos de cliente, permitir� ordenar por cualquiera de sus columnas.

create or alter proc dbo.UpClientesPaginacion
(
    @NombreCompa��a  nvarchar(5),
	@Tama�oPagina    int,
	@NroPagina       int,
	@NombreColumna   varchar(100),
	@Orden           bit
)
as
-- Exec dbo.UpClientesPaginacion 'fo' ,2,2,'IdCliente',null
begin
set nocount on

    Select
	    IdCliente, NombreCompa��a, NombreContacto, CargoContacto, Direcci�n, Ciudad, Regi�n, C�dPostal, Pa�s, Tel�fono, Fax, Dni,
		COUNT(IdCliente) over() TotalRegistros
      from Clientes
	 where NombreCompa��a like '%'+ @NombreCompa��a + '%'
	 order by 
	     case when @NombreColumna='IdCliente' and @Orden=1 then NombreCompa��a end asc,
	     case when @NombreColumna='IdCliente' and @Orden=0 then NombreCompa��a end desc,
	     case when @NombreColumna='IdCliente' and @Orden is null then NombreCompa��a end,
	
	     case when @NombreColumna='NombreCompa��a' and @Orden=1 then NombreCompa��a end asc,
	     case when @NombreColumna='NombreCompa��a' and @Orden=0 then NombreCompa��a end desc,
	     case when @NombreColumna='NombreCompa��a' and @Orden is null then NombreCompa��a end,
	
	     case when @NombreColumna='NombreContacto' and @Orden=1 then NombreCompa��a end asc,
	     case when @NombreColumna='NombreContacto' and @Orden=0 then NombreCompa��a end desc,
	     case when @NombreColumna='NombreContacto' and @Orden is null then NombreCompa��a end  
	 
	 offset (@NroPagina-1)*@Tama�oPagina rows
	 fetch next @Tama�oPagina rows only;
end