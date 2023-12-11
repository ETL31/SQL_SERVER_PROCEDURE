-- Listar los productos del catálogo (IdProducto, NombreProducto)
-- Select IdProducto, NombreProducto from Productos

Declare @IdProducto     int
declare @NombreProducto nvarchar(40)

declare CrProductosCatalogo cursor for -- Declaración variable cursor
Select IdProducto, NombreProducto from Productos -- Apunta a un query

Open CrProductosCatalogo -- Abrir el cursor
fetch next from CrProductosCatalogo -- Apuntar a la primera fila
into @IdProducto, @NombreProducto

while @@FETCH_STATUS=0 -- Mientras halla filas
begin
    print '@IdProducto:'+str(@IdProducto)+', @NombreProducto:'+@NombreProducto

    fetch next from CrProductosCatalogo
    into @IdProducto, @NombreProducto
end

close CrProductosCatalogo -- Cerrar el cursor
deallocate CrProductosCatalogo -- Liberar memoria
