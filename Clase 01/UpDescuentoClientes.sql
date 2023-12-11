-- Se le pide crear un procedimiento almacenado que gestione los descuentos que le remitio el analista(20%,30%).

create procedure dbo.UpDescuentoClientes
(
    @Venta          decimal(18,6),
    @NombreCliente  varchar(100)
)
as
-- EXEC dbo.UpDescuentoClientes 200, 'Juan Perez'
begin
set nocount on

    if (@Venta > 50 and @Venta <= 100)
    begin -- Si la instruccion es solo una linea, 'begin', 'end' es opcional
        select 0.8*@Venta as Venta, @NombreCliente as [Nombre Cliente]
    end
    else
    begin -- Si las instrucciones son multilineas, 'begin', 'end' es obligatorio
        if(@Venta > 100)
    	begin
    	    select 0.7*@Venta as Venta, @NombreCliente as [Nombre Cliente]
    	end
    	else 
    	begin
    	    select @Venta as Venta, @NombreCliente as [Nombre Cliente]
    	end
    end

end
