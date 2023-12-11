-- Implementar la funcion porcentaje, que devuelva el % de un monto
-- Select dbo.FnPorcentaje(50,10), devuelve 5.

create or alter function dbo.FnPorcentaje
(
    @Monto decimal(18,6),
    @Tasa  decimal(18,6)
)
returns decimal(18,6)
as
-- Select dbo.FnPorcentaje(50,10) 
begin

    declare @porcentaje decimal(18,6);

	set @porcentaje=@Monto*@Tasa/100;

	return @porcentaje;
end