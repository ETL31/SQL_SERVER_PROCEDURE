-- Implementar una funci�n que devuelva el a�o actual
-- Select dbo.FnA�oActual();
create or alter function dbo.FnA�oActual()
returns int
as
begin
    return year(getdate());
end
