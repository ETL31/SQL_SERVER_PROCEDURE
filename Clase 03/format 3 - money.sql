-- Se le pide implementar el formateo a monedas de variables numéricas


declare @moneda1 decimal(18,6)
declare @moneda2 decimal(18,6)
declare @moneda3 decimal(18,6)
declare @moneda4 decimal(18,6)

set @moneda1 = 123.456
set @moneda2 = 123.456789
set @moneda3 = 12345.678901

Select @moneda1

Select CONVERT(decimal(18,2),@moneda1)-- Se requiere que los montos tengan presentación de 2 decimales

-- Se requiere que los montos tengan presentación de 4 decimales
Select CONVERT(decimal(18,4),@moneda1)-- Agrega '0's.
Select CONVERT(decimal(18,4),@moneda2)-- Hace un redondeo, no truncamiento

-- Se requiere que los montos tengan presentación de 2 decimales y separación por comas
Select FORMAT(@moneda1, '#,0.00')
Select FORMAT(@moneda3, '#,0.00')

Select FORMAT(12345678.901234, '#,0.00')

Select FORMAT(@moneda3, 'c2','es-PE')-- Hace un redondeo, no truncamiento. El simbolo tiene un espacio intermedio

Select FORMAT(@moneda3, 'c3','en-US')-- No tiene un espacio entre el símbolo moneda y monto

Select FORMAT(@moneda3, 'c4','es-ES')
Select FORMAT(@moneda3, 'c4','es-AR')-- El símbolo va despues del monto

Select FORMAT(@moneda3, 'c4','jp-JP')

Select '$ '+FORMAT(@moneda3, '#,0.00')
Select '€ '+FORMAT(@moneda3, '#,0.00')

