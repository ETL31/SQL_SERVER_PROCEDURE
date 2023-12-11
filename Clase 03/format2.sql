-- Se pide tres funciones que den formato a un número, 
-- como teléfono fijo, con y sin prefijo o móvil
-- Fijo: 123-4567; Con prefijo (12) 345-6789; Movil:987-654-321
/*
declare @telefonoFijo bigint

set @telefonoFijo=1234567

select @telefonoFijo

select FORMAT(@telefonoFijo,'###-####')*/

CREATE or alter FUNCTION dbo.FnTelefonoFijo
(
    @telefono  bigint
)
returns varchar(8)
as
-- select dbo.FnTelefonoFijo(1234567)
begin
    declare @TelefonoFijo varchar(8);
	
	set @TelefonoFijo = format(@telefono, '###-####');

	return @TelefonoFijo;
end