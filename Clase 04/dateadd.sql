-- Mostrar al usuario la semana de ofertas, del 17 de setiembre en adelante
Select 
    getdate() as InicioSemana,
	dateadd(day,7,getdate()) as FinSemana,
	dateadd(week,1,getdate()) as FinSemana

-- Muestre los resultados de ventas de la última semana
Select 
    getdate() as FinSemana,
	dateadd(day,-7,getdate()) as InicioSemana

-- Muestre los resultados de ventas del último mes
Select
    dateadd(month,-1,getdate()) AS InicioDeMes,
    getdate() AS FinDeMes

-- Muestre los resultados de ventas, de las ultimas 4 semanas, desde la presente fecha.
Select 
    DATEADD(week,-4,SYSDATETIME()) as Semana1,
    SYSDATETIME() as Semana4

-- Proyección de ventas del 1er trimestre del año 2023
declare @fecha date
set @fecha='2023-01-01'

Select
    @fecha AS PrimerDia,
    dateadd(QUARTER,1,@fecha) AS UltimoDia

-- Proyeccion de ventas del año 2023
declare @FechaAnual datetime2(7)

set @FechaAnual='2023-01-01'

Select 
    @FechaAnual,
	DATEADD(year,1,@FechaAnual)