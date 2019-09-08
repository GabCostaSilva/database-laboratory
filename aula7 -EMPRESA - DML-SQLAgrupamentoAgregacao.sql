-- Nome: Gabriel Costa Silva	
-- RGA: 201719070660


-- ATIVDADE 1: Crie um script SQL para o banco de dados empresa com as seguintes consultas:

-- E1. Qual a média dos salários dos funcionários? 
SELECT AVG(salario) AS media_salarial FROM funcionario;

-- E2. Qual a soma dos salários dos funcionários?
SELECT SUM(salario) AS soma_salarial FROM funcionario;

-- E3. Qual é o salário mais baixo dos salários dos funcionários?
SELECT MIN(salario) AS menor_salario FROM funcionario;

-- E4. Qual é o salário mais alto dos salários dos funcionários?
SELECT MAX(salario) AS maior_salario FROM funcionario;

-- E5. Quantos registros de supervisores existem na relação funcionário?
SELECT count(cpf_supervisor) AS qtd_registros_supervisores FROM funcionario;

-- E6. Quantos supervisores existem na relação funcionário?
SELECT count(DISTINCT cpf_supervisor) AS qtd_supervisores FROM funcionario;

-- E7. Qual o maior salário, o menor salário e a média de salários na relação funcionário por supervisor?
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario,  AVG(salario) AS media_salarial FROM funcionario;

-- E8. Qual o maior salário, o menor salário e a média de salários na relação funcionário por supervisor, para médias salariais superiores a 30000?
SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario,  AVG(salario) AS media_salarial_maior_30000 FROM funcionario HAVING AVG(salario) > 29999;

-- E9. Para cada projeto em que mais de dois funcionários trabalham, recupere o número e o nome do projeto e o número de funcionários que trabalham no projeto
SELECT count(projnumero) AS numero_projeto, count(fcpf) AS qtd_funcionarios, projnome AS projnome FROM projeto, trabalha_em WHERE projeto.projnumero = trabalha_em.pnr GROUP BY fcpf, projnome HAVING trabalha_em.fcpf > 2;

-- E10. Listar os nomes de todos os funcionários com dois ou mais dependentes
SELECT pnome, unome FROM funcionario, dependente WHERE funcionario.cpf = dependente.fcpf GROUP BY pnome, unome HAVING count(dependente.fcpf) > 1;

-- E11. Para cada projeto, recupere seu número, seu nome e o número de funcionarios que nele trabalham.
SELECT projnumero AS numero_projeto, projnome AS nome_projeto, count(fcpf) AS qtd_funcionarios FROM projeto, trabalha_em GROUP BY projnumero, projnome, fcpf; 