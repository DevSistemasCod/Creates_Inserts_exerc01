CREATE DATABASE banco_modelo01;

USE banco_modelo01;

-- Criação da tabela departamento
CREATE TABLE departamento (
	sigla_depto VARCHAR(20) PRIMARY KEY,
    nome_depto VARCHAR(50),
    qtd_funcionarios_depto INT NOT NULL CHECK(qtd_funcionarios_depto >= 0)
);

-- Criação da tabela funcionario
CREATE TABLE funcionario (
	codigo_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
	sigla_depto VARCHAR(20) NOT NULL,
    data_admissao DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_departamento_funcionario FOREIGN KEY (sigla_depto) 
    REFERENCES departamento(sigla_depto) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criação da tabela projeto
CREATE TABLE projeto (
	sigla_projeto VARCHAR(20),
    nome_projeto VARCHAR(50),
    codigo_funcionario INT NOT NULL,
    sigla_depto VARCHAR(20) NOT NULL,
    CONSTRAINT pk_projeto PRIMARY KEY (sigla_projeto, nome_projeto),
    CONSTRAINT fk_departamento_projeto FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto) ON DELETE CASCADE ON UPDATE CASCADE,	
    CONSTRAINT fk_funcionario_projeto FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo_funcionario) ON DELETE CASCADE ON UPDATE CASCADE
);
