-- Implementar la presentación de fecha con el siguiente formato:
--11/06/2023 3:13
declare @fecha datetime;
declare @fecha2 datetime2(7);

set @fecha='2023-06-11T15:13:00.000';
         --'yyyy-MM-ddThh:mm:ss.fff' : mascara
		 
set @fecha2='2023-06-11T15:13:00.0000000';

select @fecha  -- Milisegundos
select @fecha2 -- Nanosegundos

Select FORMAT(GETDATE(),'dd-MM-yy h:m:s.fff') -- 30-05-23 3:41:14.160

Select FORMAT(GETDATE(),'dd.MM.yy')-- 11.02.23

Select FORMAT(GETDATE(),'dd-MMMM-yy hh:mm:ss.ff')--30/December/22 03:58:13.96

Select FORMAT(GETDATE(),'dd-MM-yyyy h:m:s tt') -- 30/12/2022 4:28:48 PM
