-- Se pide una implementaci�n que de formato a un n�mero, 
-- como tel�fono fijo, con y sin prefijo o m�vil
--Fijo: 123-4567; Con prefijo (12) 345-6789; Movil:987-654-321

Select
    1234567   as NroFijo,
	FORMAT(1234567, '###-####')as NroFijo,

	123456789 as NroPrefijo,
	FORMAT(123456789, '(##) ###-####') NroPrefijo,

	987654321 as M�vil,
	FORMAT(987654321,'###-###-###') 'M�vil' 
