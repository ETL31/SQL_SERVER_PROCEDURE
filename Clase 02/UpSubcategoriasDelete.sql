-- Implementar un procedure de eliminacion de subcategorias, con transacciones.
create or alter procedure UpSubcategoriasDelete
(
    @Id int
)
as
-- Exec UpSubcategoriasDelete 3
begin
set nocount on

    begin try
	    begin transaction
	    DELETE FROM dbo.SubCategoria WHERE id=@id;
		commit transaction -- Confirma la operación
		print 'Eliminación exitosa.'
	end try
	begin catch
	    print 'Ocurrió un error al eliminar.'
		rollback
	end catch

end
