-- Sumar los 10 primeros números naturales
-- 1,2,3,4,5,6,7,8,9,10; ir mostrando el valor acumulado
-- 1,3,6,10,...

declare @n    int
declare @i    int
declare @suma int

set @n=10
set @i=1
set @suma=0

while @i<=@n
begin
    set @suma=@suma+@i;
	print @i;
	print @suma;
	set @i=@i+1;
end

select @suma as suma