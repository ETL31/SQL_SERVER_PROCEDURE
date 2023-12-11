-- Por campaña escolar, se ofrece un descuento de 20%, si la venta es mayor a S/ 50, y 30%, si es mayor a 100,
-- Debe incluir el nombre del cliente

-- |----------|-----------|----------
-- 0          50         100
--     0%          20%         30%

DECLARE @Venta          decimal(18,6);
DECLARE @NombreCliente  varchar(100);

set @Venta = 20;
set @NombreCliente = 'Juan Perez';

if (@Venta > 50 and @Venta <= 100)
begin
    select 0.8*@Venta as Venta, @NombreCliente as [Nombre Cliente]
end
else
begin
    if(@Venta > 100)
	begin
	    select 0.7*@Venta as Venta, @NombreCliente as [Nombre Cliente]
	end
	else 
	begin
	    select @Venta as Venta, @NombreCliente as [Nombre Cliente]
	end
end