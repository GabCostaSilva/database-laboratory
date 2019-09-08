
select case
	when salario < 10000 then 'baixo'
	when salario < 30000 then 'medio'
	when salario < 50000 then 'alto'
	else 'super alto'
	end as 'classificacao_salario'
	count(*) as quantidade
	from funcionario
	group by classificacao_salario;
