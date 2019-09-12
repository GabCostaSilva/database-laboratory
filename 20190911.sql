-- Nome: GABRIEL COSTA SILVA
-- RGA: 201719070660


-------------- (F) CONSULTAS ANINHADAS IN | NOT IN --------------

-- F1. Recuperar os números do CPF de todos os funcionários que trabalham nos projetos ProdutoX ou Automatizacao.
	SELECT cpf 
	FROM funcionario f
	WHERE f.cpf 
	IN (
		SELECT f2.cpf 
		FROM trabalha_em t 
		JOIN funcionario f2 
		ON t.fcpf = f2.cpf 
		JOIN projeto p 
		ON t.pnr = p.projnumero 
		WHERE p.projnome 
		IN ('ProdutoX', 'Automatizacao')
	);

-- F2: Relacione os nomes dos gerentes que possuam ao menos dois dependente.
	SELECT DISTINCT f.pnome 
	FROM funcionario f 
	JOIN funcionario g 
	ON f.cpf = g.cpf_supervisor 
	WHERE f.cpf 
	NOT IN (
		SELECT d.fcpf 
		FROM dependente d 
		GROUP BY d.fcpf
		HAVING count(d.fcpf) > 2
	);

-- F3: Para cada departamento que tenha mais de quatro funcionarios, recupere o número do departamento e o número dos funcionarios que recebem mais de 40 mil.
	SELECT d.dnumero, f.pnome 
	FROM departamento d 
	JOIN funcionario f 
	ON d.dnumero = f.dnr 
	WHERE d.dnumero 
	IN (
		SELECT d2.dnumero
		FROM departamento d2
		JOIN funcionario f2
		ON d2.dnumero = f2.dnr
		WHERE f2.salario > 40000
		GROUP BY 
			d2.dnumero, f2.pnome
		HAVING
			count(d2.dnumero) > 4
	);

-- F4. Recuperar os nomes dos funcionários que não possuem dependentes
-- UTILIZE IN / NOT IN
	SELECT pnome 
	FROM funcionario f 
	WHERE f.cpf 
	NOT IN (
		SELECT d.fcpf 
		FROM dependente d
	);

-- UTILIZE EXISTS / NOT EXISTS
	SELECT pnome 
	FROM funcionario f 
	WHERE NOT EXISTS (
		SELECT * 
		FROM dependente d
		WHERE d.fcpf = f.cpf
	);

-- UTILIZE GROUP BY
	SELECT f.pnome 
	FROM funcionario f 
	GROUP BY f.pnome, f.cpf 
	HAVING f.cpf 
	NOT IN (
		SELECT d.fcpf FROM dependente d
	);

-- F5. Recupere o cpf de todos os funcionarios que trabalham nos projetos 1, 2 ou 3.
	SELECT f.cpf 
	FROM funcionario f 
	WHERE EXISTS (
		SELECT * 
		FROM trabalha_em t 
		JOIN funcionario 
		ON t.fcpf = f.cpf 
		JOIN projeto p 
		ON p.projnumero = t.pnr 
		WHERE p.projnumero 
		IN (1, 2, 3)
	); 

-------------- (G) CONSULTAS ANINHADA EXISTS | NOT EXISTS  --------------

-- G1. Listar os nomes dos gerentes que possuem pelo menos um dependente.
SELECT g.pnome 
FROM funcionario g
JOIN funcionario f
ON g.cpf = f.cpf_supervisor
WHERE NOT EXISTS (
	SELECT d.fcpf 
	FROM dependente d 
	GROUP BY d.fcpf 
	HAVING count(d.fcpf) < 1
);

-------------- (H) CONSULTAS ANINHADAS ANY |SOME | ALL --------------

-- H1. Retorne o nome e o salario dos funcionários  cujos salários são superiores ao salário de algum funcionário do departamento 4
SELECT f.pnome, f.salario FROM funcionario f WHERE f.salario > SOME(SELECT f2.salario FROM funcionario f2 WHERE f2.dnr = 4);

-- H2. Retorna os nomes dos funcionários cujo salário é maior do que o salário de todos os funcionários no departamento 5
SELECT f.pnome FROM funcionario f WHERE f.salario > ALL(SELECT f2.salario FROM funcionario f2 WHERE f2.dnr = 5);
