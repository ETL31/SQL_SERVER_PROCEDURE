-- Un sistema contable requiere los datos de los proveedores
-- Si el proveedor tiene Ruc, mostrarlo, sino mostrar el Dni, sino un mensaje
-- 'Sin documento'

--Coalesce
declare @Ruc char(11)
declare @Dni char(8)
declare @Mensaje varchar(50)

set @Ruc='12345678901'
set @Mensaje='Sin documento'
Select Coalesce(@Ruc, @Dni, @Mensaje)

set @Ruc=null
set @Dni='12345678'
Select Coalesce(@Ruc, @Dni, @Mensaje)

set @Ruc=null
set @Dni=null
Select Coalesce(@Ruc, @Dni, @Mensaje)
