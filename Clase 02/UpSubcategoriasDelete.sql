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
		commit transaction -- Confirma la operaci�n
		print 'Eliminaci�n exitosa.'
	end try
	begin catch
	    print 'Ocurri� un error al eliminar.'
		rollback
	end catch

end
