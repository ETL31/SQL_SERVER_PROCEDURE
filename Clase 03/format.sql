-- Se pide una implementación que de formato a un número, 
-- como teléfono fijo, con y sin prefijo o móvil
--Fijo: 123-4567; Con prefijo (12) 345-6789; Movil:987-654-321

Select
    1234567   as NroFijo,
	FORMAT(1234567, '###-####')as NroFijo,

	123456789 as NroPrefijo,
	FORMAT(123456789, '(##) ###-####') NroPrefijo,

	987654321 as Móvil,
	FORMAT(987654321,'###-###-###') 'Móvil' 
