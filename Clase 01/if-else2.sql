-- Un centro comercial, necesita calcular el igv de sus productos, si el producto es cat 1,2,3 es perecible y no tiene
-- igv, si la compra en un restaurante, es categoria 4,5,6, tiene igv del 8%, sino tiene igv del 18%.

declare @Categoria int
declare @Venta     decimal(18,6)

set @Categoria=8
set @Venta=100 

if(@Categoria = 1 or @Categoria = 2 or @Categoria = 3)
begin
    Select 0 as Igv
end
else
begin
    if(@Categoria = 4 or @Categoria = 5 or @Categoria = 6)
    begin
        Select @Venta*0.08 as Igv
    end
	else
	begin
        Select @Venta*0.18 as Igv
	end
end
