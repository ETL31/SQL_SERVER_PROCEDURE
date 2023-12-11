-- Se requiere un procedimiento que sirva de origen de datos para un reporte de Clientes.
-- Debe mostrar todos los datos de cliente, permitirá ordenar por cualquiera de sus columnas.

create or alter proc dbo.UpClientesPaginacion
(
    @NombreCompañía  nvarchar(5),
	@TamañoPagina    int,
	@NroPagina       int,
	@NombreColumna   varchar(100),
	@Orden           bit
)
as
-- Exec dbo.UpClientesPaginacion 'fo' ,2,2,'IdCliente',null
begin
set nocount on

    Select
	    IdCliente, NombreCompañía, NombreContacto, CargoContacto, Dirección, Ciudad, Región, CódPostal, País, Teléfono, Fax, Dni,
		COUNT(IdCliente) over() TotalRegistros
      from Clientes
	 where NombreCompañía like '%'+ @NombreCompañía + '%'
	 order by 
	     case when @NombreColumna='IdCliente' and @Orden=1 then NombreCompañía end asc,
	     case when @NombreColumna='IdCliente' and @Orden=0 then NombreCompañía end desc,
	     case when @NombreColumna='IdCliente' and @Orden is null then NombreCompañía end,
	
	     case when @NombreColumna='NombreCompañía' and @Orden=1 then NombreCompañía end asc,
	     case when @NombreColumna='NombreCompañía' and @Orden=0 then NombreCompañía end desc,
	     case when @NombreColumna='NombreCompañía' and @Orden is null then NombreCompañía end,
	
	     case when @NombreColumna='NombreContacto' and @Orden=1 then NombreCompañía end asc,
	     case when @NombreColumna='NombreContacto' and @Orden=0 then NombreCompañía end desc,
	     case when @NombreColumna='NombreContacto' and @Orden is null then NombreCompañía end  
	 
	 offset (@NroPagina-1)*@TamañoPagina rows
	 fetch next @TamañoPagina rows only;
end