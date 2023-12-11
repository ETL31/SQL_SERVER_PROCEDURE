Select 'America', 'Argentina' 
union
Select 'America', 'Bolivia' 
union
Select 'America', 'Colombia' 
union
Select 'America', 'Ecuador' 
union
Select 'America', 'Ecuador' -- Union no permite repetir resultados

Select 'America', 'Ecuador' 
union all  -- Union all si permite repetir resultados
Select 'America', 'Ecuador'