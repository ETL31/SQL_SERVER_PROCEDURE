-- Implementar la b�squeda de productos por coincidencia en el nombre, que permita ordenar por nombre o categoria *(asc y desc),
-- en grupos de 10 (o los que indique el usuario), y permita el recorrido tipo p�gina.
create or alter procedure UpProductoPaginacion
(
    @Texto         nvarchar(40),
	@Tama�oPagina  int,
	@NroPagina     int,
	@NombreColumna varchar(100),
	@Orden         bit
)
as
-- Exec UpProductoPaginacion 'queso',3,2,'NombreCategor�a', 1
begin
set nocount on

    Select
	    IdProducto, 
		NombreProducto, 
		IdProveedor, 
		Productos.IdCategor�a, 
		Categor�as.NombreCategor�a,
		CantidadPorUnidad, 
		PrecioUnidad, 
		UnidadesEnExistencia, 
		UnidadesEnPedido, 
		NivelNuevoPedido, 
		Suspendido,
		count(IdProducto) over() as TotalRegistros
      from Productos
	 inner join Categor�as on Categor�as.IdCategor�a=Productos.IdCategor�a
     where NombreProducto like '%'+@Texto+'%'
	 order by
	   case when @NombreColumna='NombreProducto' and @Orden=1 then Productos.NombreProducto end asc,
	   case when @NombreColumna='NombreProducto' and @Orden=0 then Productos.NombreProducto end desc,
	   case when @NombreColumna='NombreProducto' and @Orden is null then Productos.NombreProducto end,
	   
	   case when @NombreColumna='NombreCategor�a' and @Orden=1 then Categor�as.NombreCategor�a end asc,
	   case when @NombreColumna='NombreCategor�a' and @Orden=0 then Categor�as.NombreCategor�a end desc,
	   case when @NombreColumna='NombreCategor�a' and @Orden is null then Categor�as.NombreCategor�a end
	   
	   offset(@NroPagina-1)*@Tama�oPagina rows
	   fetch next @Tama�oPagina rows only;--El simbolo ';' es opcional, pero se recomienda su uso.

end
