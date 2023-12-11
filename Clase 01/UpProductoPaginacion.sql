-- Implementar la búsqueda de productos por coincidencia en el nombre, que permita ordenar por nombre o categoria *(asc y desc),
-- en grupos de 10 (o los que indique el usuario), y permita el recorrido tipo página.
create or alter procedure UpProductoPaginacion
(
    @Texto         nvarchar(40),
	@TamañoPagina  int,
	@NroPagina     int,
	@NombreColumna varchar(100),
	@Orden         bit
)
as
-- Exec UpProductoPaginacion 'queso',3,2,'NombreCategoría', 1
begin
set nocount on

    Select
	    IdProducto, 
		NombreProducto, 
		IdProveedor, 
		Productos.IdCategoría, 
		Categorías.NombreCategoría,
		CantidadPorUnidad, 
		PrecioUnidad, 
		UnidadesEnExistencia, 
		UnidadesEnPedido, 
		NivelNuevoPedido, 
		Suspendido,
		count(IdProducto) over() as TotalRegistros
      from Productos
	 inner join Categorías on Categorías.IdCategoría=Productos.IdCategoría
     where NombreProducto like '%'+@Texto+'%'
	 order by
	   case when @NombreColumna='NombreProducto' and @Orden=1 then Productos.NombreProducto end asc,
	   case when @NombreColumna='NombreProducto' and @Orden=0 then Productos.NombreProducto end desc,
	   case when @NombreColumna='NombreProducto' and @Orden is null then Productos.NombreProducto end,
	   
	   case when @NombreColumna='NombreCategoría' and @Orden=1 then Categorías.NombreCategoría end asc,
	   case when @NombreColumna='NombreCategoría' and @Orden=0 then Categorías.NombreCategoría end desc,
	   case when @NombreColumna='NombreCategoría' and @Orden is null then Categorías.NombreCategoría end
	   
	   offset(@NroPagina-1)*@TamañoPagina rows
	   fetch next @TamañoPagina rows only;--El simbolo ';' es opcional, pero se recomienda su uso.

end
