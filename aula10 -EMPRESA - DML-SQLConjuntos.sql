-- Nome: Gabriel Costa Silva
-- RGA: 201719070660

-- Crie um script SQL para o banco de dados empresa com as seguintes consultas:

-------------- (I) CONJUNTOS UNION / INTERSECT / EXCEPT  --------------

-- I1. Listar o nome e o tipo ‘P’ projeto e ‘D’ departamento de todos
-- os departamentos com identificação 5 ou 4 e projetos que estejam alocados nestes departamentos
SELECT nome, tipo
FROM (
	SELECT d.dnome AS nome, 'D' AS tipo
	FROM departamento d
	WHERE d.dnumero = 5 OR d.dnumero = 4
	UNION ALL
	SELECT p.projnome AS nome, 'P' AS tipo
	FROM projeto p
	WHERE p.dnum = 5 OR p.dnum = 4
) tb1
ORDER BY tipo;
--	nome       		| tipo 
------------------+------
-- Administracao    | D
-- ProdutoX         | P
-- ...	          	| ..

-- I2. Fazer uma lista de todos os números de projeto para aqueles que envolvam
-- um funcionário cujo último nome é ‘Borg’, 
--seja como um trabalhador ou como um gerente do departamento que controla o projeto.
SELECT projnumero
FROM projeto
INTERSECT
SELECT t.pnr AS projnumero
FROM trabalha_em t
JOIN funcionario f
ON t.fcpf = f.cpf
WHERE f.unome LIKE 'Borg'
INTERSECT
SELECT projnumero
FROM projeto p
JOIN departamento d
ON d.dnumero = p.dnum
JOIN funcionario f
ON f.cpf = d.cpf_gerente
WHERE f.unome LIKE 'Borg';

-- I3. Liste o cpf dos funcionários que também são gerentes 
SELECT cpf
FROM funcionario
INTERSECT
SELECT cpf_gerente AS cpf
FROM departamento;

-- I4. Liste o cpf dos funcionários que não possuem dependentes
SELECT cpf
FROM funcionario
EXCEPT
SELECT fcpf
FROM dependente;

-- I5: Listar o nome, sexo e data de nascimento de todos os funcionários e dependentes que nasceram após 1945
SELECT nome, sexo, datanasc 
FROM (
	SELECT pnome AS nome, sexo, datanasc
	FROM funcionario f
	UNION
	SELECT nome_dependente AS nome, sexo, datanasc
	FROM dependente
) tb1
WHERE datanasc > '1945-12-31';

-- I6: Liste os nomes dos empregados que não têm filhos (filho e/ou filha).
SELECT pnome AS nome
FROM funcionario
EXCEPT
SELECT f.pnome AS nome
FROM funcionario f
JOIN dependente d
ON d.fcpf = f.cpf
WHERE d.parentesco LIKE 'FILH%';

-- I9: Liste o nome, cpf e salario dos funcionários que nunca trabalharam em nenhum projeto
SELECT pnome AS nome, cpf, salario
FROM funcionario
EXCEPT
SELECT pnome AS nome, cpf, salario
FROM funcionario f
JOIN trabalha_em t
ON t.fcpf = f.cpf;