create or alter function dbo.FnMinimo
(
    @a int,
	@b int  
)
returns int
as
-- Select dbo.FnMinimo(5,7)
begin

    declare @minimo int

	if(@a > @b)
	   set @minimo = @b;
	else
	   set @minimo = @a;

	return @minimo;

end
