--'2015-08-25', '2022-08-25', tiempo transcurrido
-- Expresado en d�as, semanas, meses, trimestres, a�os.

select '2015-08-25', '2022-08-25'
 
select 
    datediff(day,'2015-08-25', '2022-08-25') as [d�as transcurridos]

select    -- wk: abreviatura de semana
    datediff(wk,'2015-08-25', '2022-08-25') as [semanas transcurridas]

select    -- M: abreviatura de mes
    datediff(M,'2015-08-25', '2022-08-25') as [meses transcurridos]

select    -- qq: abreviatura de trimestre
    datediff(qq,'2015-08-25', '2022-08-25') as [trimestres transcurridos]

select    -- yy: abreviatura de a�o
    datediff(yy,'2015-08-25', '2022-08-25') as [A�os transcurridos]



-- '2022-08-20T10:10:10', '2022-08-25T20:20:20', expresar la diferencia en horas
Select 
    datediff(hour,'2022-08-20T10:10:10', '2022-08-25T20:20:20')
-- '2022-08-20T10:10:10', '2022-08-25T20:20:20', expresar la diferencia en minutos
Select 
    datediff(MINUTE,'2022-08-20T10:10:10', '2022-08-25T20:20:20')
-- '2022-08-20T10:10:10', '2022-08-25T20:20:20', expresar la diferencia en segundos
Select 
    datediff(SECOND,'2022-08-20T10:10:10', '2022-08-25T20:20:20')