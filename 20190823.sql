-- D1
SELECT p.projnome, p.projlocal, d.dnome FROM projeto p, departamento d WHERE d.dnumero = 5 OR d.dnumero = 1;

-- D2
SELECT * FROM departamento d WHERE d.dnome LIKE 'Pesquisa' AND d.dnumero = 1 OR d.dnumero = 3;

-- D4
SELECT * FROM funcionario WHERE CAST(cpf AS varchar) LIKE '8%';

-- D5
SELECT * FROM funcionario WHERE EXTRACT('Year' from datanasc) BETWEEN 1937 AND 1965;

-- D6
SELECT pnome, unome, CHAR_LENGTH(pnome) AS total_caracteres_pnome, CHAR_LENGTH(unome) AS total_caracteres_unome, CHAR_LENGTH(pnome) + CHAR_LENGTH(unome) AS total_caracteres_pnome_e_unome FROM funcionario;

-- D7
SELECT * FROM funcionario WHERE CHAR_LENGTH(pnome) BETWEEN 4 AND 5;

-- D8
SELECT * FROM funcionario WHERE pnome LIKE '%i_';

-- D9
SELECT UPPER(d.nome_dependente) AS nome_dependente, LOWER(d.parentesco) parentesco FROM dependente d;