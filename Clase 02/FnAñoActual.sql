-- Implementar una función que devuelva el año actual
-- Select dbo.FnAñoActual();
create or alter function dbo.FnAñoActual()
returns int
as
begin
    return year(getdate());
end
