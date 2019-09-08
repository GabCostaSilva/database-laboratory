-- A2
SELECT p.projnome from projeto AS p WHERE dnum = 5;

-- A3
SELECT * from dependente WHERE sexo = 'F';

-- A4
SELECT f.pnome, f.unome FROM funcionario f WHERE salario > 2699;

-- A5
SELECT projnumero AS Numero_do_Projeto, projnome AS Nome_do_Projeto 
FROM projeto WHERE dnum = 4;

-- A6
SELECT projnome, projlocal FROM projeto WHERE projnumero = 10 AND dnum = 4;

-- A7
SELECT * FROM funcionario ORDER BY pnome ASC;

-- A8
SELECT salario, pnome, unome FROM funcionario ORDER BY 1 ASC, 3 ASC;

-- A11
SELECT * FROM funcionario WHERE datanasc < '1960-01-01' AND datanasc > '1949-12-31';

-- C2
SELECT DISTINCT salario FROM funcionario ORDER BY 1 ASC;

-- C3 
SELECT salario, pnome, unome FROM funcionario ORDER BY 1 ASC, 2 ASC, 3 ASC;