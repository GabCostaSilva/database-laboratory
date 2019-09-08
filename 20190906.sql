-- Nome: Gabriel Costa Silva
-- RGA: 201719070660


-- J1: Para cada funcionário, recupere o primeiro e o último nome do funcionário e o primeiro e o último nome  de seus supervisor imediato.
SELECT f.pnome AS pnome_funcionario, f.unome AS unome_funcionario, s.pnome AS pnome_supervisor, s.unome AS unome_supervisor FROM funcionario f INNER JOIN funcionario s ON f.cpf_supervisor = s.cpf; 

-- J2: Listar pnome, unome, endereco e dnr de funcionário e dnome, dnumero de departamento (mesmo departamentos que não possuem funcionários e funcionários sem departamento).
SELECT f.pnome AS pnome_funcionario, f.unome AS unome_funcionario, f.endereco AS endereco_funcionario, d.dnome AS nome_departamento, d.dnumero AS numero_departamento FROM funcionario f RIGHT JOIN departamento d ON f.dnr = d.dnumero;

-- J3: Retorne  pnome do funcionário e de seu supervisor. Liste todos os funcionários, mesmo aqueles que não possuem supervisor.
SELECT f.pnome AS pnome_funcionario, s.pnome AS pnome_supervisor FROM funcionario f LEFT JOIN funcionario s ON f.cpf_supervisor = s.cpf;

-- J4: Listar todos os departamentos (dnome, dnumero) e seus respectivos funcionários (pnome, unome, dnr). Listar também aqueles departamentos que não possuem funcionário.
SELECT d.dnome AS nome_departamento, d.dnumero AS numero_departamento, f.pnome AS pnome_funcionario, f.unome unome_funcionario FROM departamento d LEFT JOIN funcionario f ON d.dnumero = f.dnr ORDER BY d.dnumero; 

-- J5: Listar todos os departamentos (dnome, dnumero) combinados com todos os funcionários (pnome, unome, dnr). 
SELECT d.dnome AS nome_departamento, d.dnumero AS numero_departamento, f.pnome AS pnome_funcionario, f.unome AS unome_funcionario, f.dnr AS dep_funcionario FROM departamento d CROSS JOIN funcionario f ORDER BY d.dnumero; 

-- J1: Listar o nome e endereço dos funcionários que trabalham no departamento Administração.
SELECT f.pnome AS nome_funcionario, f.unome AS unome_funcionario, f.endereco FROM funcionario f INNER JOIN departamento d ON f.dnr = d.dnumero WHERE d.dnome = 'Administracao';

-- J4: Listar pnome, unome, endereco e dnr de funcionários e dnome e dnumero de departamento. Listar todos os funcionários (mesmo aqueles que não possuem departamento).
SELECT f.pnome AS nome_funcionario, f.unome AS unome_funcionario, f.endereco, f.dnr AS dep_funcionario FROM funcionario f LEFT JOIN departamento d ON f.dnr = d.dnumero; 

-- J9: Descobrir os nomes dos funcionários que trabalham em algum projeto controlado pelo departamento número 5.
SELECT f.pnome AS nome_funcionario, f.unome AS unome_funcionario FROM funcionario f JOIN trabalha_em t ON f.cpf = t.fcpf JOIN projeto p ON t.pnr = p.projnumero WHERE p.dnum = 5;

-- J10. Para cada departamento, recupere seu número, o número de funcionarios que nele trabalham e a média de seus salários.
SELECT d.dnumero, count(d.dnumero) AS qtd_funcionarios, round(avg(f.salario), 2) AS media_salarial FROM departamento d LEFT JOIN funcionario f ON f.dnr = d.dnumero GROUP BY d.dnumero ORDER BY qtd_funcionarios;
