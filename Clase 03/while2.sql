-- Sumar los 6 primeros números, pares e impares, y mostrar los resultados.
--1,3,5=9; 2,4,6=12
-- El residuo se obtiene con %

declare @n int;
declare @i int;
declare @sumaP int;
declare @sumaI int;

set @n=6
set @i=1
set @sumaP=0
set @sumaI=0

while (@i<=@n)
begin
    if(@i%2=0)
	   set @sumaP=@sumaP+@i;
	else
	   set @sumaI=@sumaI+@i;
	set @i=@i+1
	print @i
end

Select @sumaI, @sumaP