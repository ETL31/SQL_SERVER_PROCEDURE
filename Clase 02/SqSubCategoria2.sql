create sequence dbo.SqSubCategoria2
as int
start with 1
increment by 1;
---------------------------
drop sequence dbo.SqSubCategoria2;
---------------------------
insert into dbo.SubCategoria2
(id,Nombre)
values
(next value for dbo.SqSubCategoria2, 'Regalos');

insert into dbo.SubCategoria2
(id,Nombre)
values
(next value for dbo.SqSubCategoria2, 'Congelados');