--Grupos de datos:
--1) Numéricos: Bit, Int, Bigint, Decimal
--2) Fecha/Hora: Datetime, Datetime2, Date
--3) Cadena: Char, varchar, Nchar, Nvarchar

--123, '123',
--2023, '2023', #2023#

Select 123, '123'

Select 123.45, '123.45'

Select CAST('123.45' AS DECIMAL(18,2)) -- Conversión de texto a número

Select CAST('123.45' AS DECIMAL(18,2))+1

Select '123.45'+1-- No se puede operar variables de diferentes tipos de datos

Select CAST('123.45' AS float)

Select CAST('123.45' AS int)-- Al tener parte decimal, da error

Select CAST('123.45' AS bigint)-- Al tener parte decimal, da error

Select CAST('123.45' AS bit)-- No permite convertir a tipo binario

Select CAST('123.45' AS DECIMAL(18,6))-- Le agrega '0's a la operación

Select CAST('2023-04-01T01:02:03.456' as datetime)

Select CAST('2023-04-01T01:02:03.456' as date)-- Date trunca la parte tiempo

Select CAST('2023-04-01T01:02:03.456' as datetime2)-- 7 fracciones de segundo

Select CAST('2023-04-01T01:02:03.4567' as datetime2) -- Con 4 fracciones de segundo

Select CAST('2023-04-01T01:02:03.45678' as datetime2) -- Con 5 fracciones de segundo

Select CAST('2023-04-01T01:02:03.1234567' as datetime2)-- Con 7 fracciones de segundo

Select CAST('2023-04-01T01:02:03.12345678' as datetime2)-- Con 8 fracciones de segundo
                                                        -- realiza un redondeo.
														-- No se recomienda

Select CAST('2023-04-01T01:02:03.999' as datetime)-- Si se pone 999 milisegundos,
                                                  -- hace un redondeo
												  
Select CAST('2023-04-01T01:02:03.997' as datetime)-- El limite de milisegundos es 997


declare @texto varchar(20)
declare @fecha varchar(50)

set @texto='123.45'
Select CAST(@texto AS DECIMAL(18,2))
		
set @fecha='2023-04-01T01:02:03.997'				  
Select CAST(@fecha as datetime)
