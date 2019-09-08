CREATE SCHEMA empresaschema;

SET search_path  = 'empresaschema';

CREATE TABLE empresaschema.departamento (
    dnome character varying(255) NOT NULL,
    dnumero integer NOT NULL,
    cpf_gerente integer DEFAULT 0,
    data_inicio_gerente date
);

CREATE TABLE empresaschema.dependente (
    fcpf integer NOT NULL,
    nome_dependente character varying(255) NOT NULL,
    sexo character(1),
    datanasc date,
    parentesco character varying(255),
    CONSTRAINT dependente_sexo_check CHECK ((sexo = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);

CREATE TABLE empresaschema.depto_localizacoes (
    dnumero integer NOT NULL,
    dlocal character varying(255) NOT NULL
);

CREATE TABLE empresaschema.funcionario (
    pnome character varying(255) NOT NULL,
    minicial character(1),
    unome character varying(255) NOT NULL,
    cpf integer NOT NULL,
    datanasc date,
    endereco character varying(255),
    sexo character(2),
    salario numeric(10,2) DEFAULT 0.0,
    cpf_supervisor integer,
    dnr integer,
    CONSTRAINT funcionario_dnr_check CHECK ((dnr > 0)),
    CONSTRAINT funcionario_salario_check CHECK ((salario > (0)::numeric)),
    CONSTRAINT funcionario_sexo_check CHECK ((sexo = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);

CREATE TABLE empresaschema.projeto (
    projnome character varying(255),
    projnumero integer NOT NULL,
    projlocal character varying(255),
    dnum integer
);

CREATE TABLE empresaschema.trabalha_em (
    fcpf integer NOT NULL,
    pnr integer NOT NULL,
    horas real
);

ALTER TABLE ONLY empresaschema.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (dnumero);

ALTER TABLE ONLY empresaschema.dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (fcpf, nome_dependente);

ALTER TABLE ONLY empresaschema.depto_localizacoes
    ADD CONSTRAINT depto_localizacoes_pkey PRIMARY KEY (dnumero, dlocal);

ALTER TABLE ONLY empresaschema.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);

ALTER TABLE ONLY empresaschema.projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (projnumero);

ALTER TABLE ONLY empresaschema.trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (fcpf, pnr);

ALTER TABLE ONLY empresaschema.departamento
    ADD CONSTRAINT gerente FOREIGN KEY (cpf_gerente) REFERENCES empresaschema.funcionario(cpf);

ALTER TABLE ONLY empresaschema.depto_localizacoes
    ADD CONSTRAINT numerodepartamento FOREIGN KEY (dnumero) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE ONLY empresaschema.projeto
    ADD CONSTRAINT numerodepartamento FOREIGN KEY (dnum) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE ONLY empresaschema.funcionario
    ADD CONSTRAINT numerodepto FOREIGN KEY (dnr) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE ONLY empresaschema.trabalha_em
    ADD CONSTRAINT numeroprojeto FOREIGN KEY (pnr) REFERENCES empresaschema.projeto(projnumero);

ALTER TABLE ONLY empresaschema.dependente
    ADD CONSTRAINT cpffuncionario FOREIGN KEY (fcpf) REFERENCES empresaschema.funcionario(cpf);

ALTER TABLE ONLY empresaschema.funcionario
    ADD CONSTRAINT supervisor FOREIGN KEY (cpf_supervisor) REFERENCES empresaschema.funcionario(cpf);