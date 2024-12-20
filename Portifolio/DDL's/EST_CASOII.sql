DROP SCHEMA EST_CASOII;
CREATE SCHEMA EST_CASOII;
USE EST_CASOII;

#criando as tabelas sem chaves estrangeiras
#criando tabela passageiros
CREATE TABLE IF NOT EXISTS PASSAGEIROS (
    PASSAGEIRO_CPF VARCHAR(14) PRIMARY KEY,
    PASSAGEIRO_NOME VARCHAR(50) NOT NULL,
    PASSAGEIRO_TELEFONE VARCHAR(15) NOT NULL,
    PASSAGEIRO_PAIS VARCHAR(30) NOT NULL,
    PASSAGEIRO_ESTADO VARCHAR(30) NOT NULL,
    PASSAGEIRO_CIDADE VARCHAR(30) NOT NULL,
    PASSAGEIRO_BAIRRO VARCHAR(30) NOT NULL,
    PASSAGEIRO_RUA VARCHAR(30) NOT NULL,
    PASSAGEIRO_NUM INT
);

#criando alter da tabela passageiros
ALTER TABLE PASSAGEIROS ADD COLUMN EMAIL VARCHAR(50);
ALTER TABLE PASSAGEIROS CHANGE COLUMN EMAIL PASSAGEIRO_EMAIL VARCHAR(50);
ALTER TABLE PASSAGEIROS MODIFY COLUMN PASSAGEIRO_EMAIL VARCHAR(100);
ALTER TABLE PASSAGEIROS DROP COLUMN PASSAGEIRO_EMAIL;


#criando a tabela aeroportos
CREATE TABLE IF NOT EXISTS AEROPORTOS (
    AEROPORTO_COD VARCHAR(10) PRIMARY KEY,
    AEROPORTO_NOME VARCHAR(50) NOT NULL,
    AEROPORTO_CIDADE VARCHAR(50),
    AEROPORTO_PAIS VARCHAR(50)
);

#criando alter da tabela aeroportos
ALTER TABLE AEROPORTOS ADD COLUMN CAPACIDADE_PISTA INT;
ALTER TABLE AEROPORTOS CHANGE COLUMN CAPACIDADE_PISTA AEROPORTO_CAP_PISTA INT;
ALTER TABLE AEROPORTOS MODIFY COLUMN AEROPORTO_CAP_PISTA INT NOT NULL;
ALTER TABLE AEROPORTOS DROP COLUMN AEROPORTO_CAP_PISTA;

#criando tabela aeronaves
CREATE TABLE IF NOT EXISTS AERONAVES (
    AERONAVE_ID INT PRIMARY KEY,
    AERONAVE_MODELO VARCHAR(50) NOT NULL,
    AERONAVE_CAPACIDADE INT NOT NULL
);
#criando alter da tabela aeronaves
ALTER TABLE AERONAVES ADD COLUMN ANO_FABRICACAO INT;
ALTER TABLE AERONAVES CHANGE COLUMN ANO_FABRICACAO AERONAVE_ANO_FABRICACAO INT;
ALTER TABLE AERONAVES MODIFY COLUMN AERONAVE_ANO_FABRICACAO YEAR;
ALTER TABLE AERONAVES DROP COLUMN AERONAVE_ANO_FABRICACAO;


#criando tabela funcionarios
CREATE TABLE IF NOT EXISTS FUNCIONARIOS (
    FUNCIONARIO_ID INT PRIMARY KEY,
    FUNCIONARIO_NOME VARCHAR(50) NOT NULL,
    CARGO VARCHAR(30) NOT NULL
);
#criando alter da tabela funcionarios
ALTER TABLE FUNCIONARIOS ADD COLUMN DATA_CONTRATACAO DATE;
ALTER TABLE FUNCIONARIOS CHANGE COLUMN DATA_CONTRATACAO FUNC_DATA_CONTRATACAO DATE;
ALTER TABLE FUNCIONARIOS MODIFY COLUMN FUNC_DATA_CONTRATACAO DATE NOT NULL;
ALTER TABLE FUNCIONARIOS DROP COLUMN FUNC_DATA_CONTRATACAO;


#criando tabelas com FK
#criando tabela voos
CREATE TABLE IF NOT EXISTS VOOS (
    VOO_COD INT PRIMARY KEY,
    VOO_ORIGEM VARCHAR(10),
    VOO_DESTINO VARCHAR(10),
    VOO_PARTIDA DATETIME NOT NULL,
    VOO_CHEGADA DATETIME NOT NULL,
    AERONAVE_ID INT,
    CONSTRAINT FK_ORIGEM FOREIGN KEY (VOO_ORIGEM) REFERENCES AEROPORTOS(AEROPORTO_COD),
    CONSTRAINT FK_DESTINO FOREIGN KEY (VOO_DESTINO) REFERENCES AEROPORTOS(AEROPORTO_COD),
    CONSTRAINT FK_AERONAVE FOREIGN KEY (AERONAVE_ID) REFERENCES AERONAVES(AERONAVE_ID)
);
#criando alter da tabela voos
ALTER TABLE VOOS ADD COLUMN TEMPO_ESTIMADO TIME;
ALTER TABLE VOOS CHANGE COLUMN TEMPO_ESTIMADO VOO_TEMPO_ESTIMADO TIME;
ALTER TABLE VOOS MODIFY COLUMN VOO_TEMPO_ESTIMADO VARCHAR(10);
ALTER TABLE VOOS DROP COLUMN VOO_TEMPO_ESTIMADO;


#criando tabela reservas
CREATE TABLE IF NOT EXISTS RESERVAS (
    RESERVA_ID INT PRIMARY KEY AUTO_INCREMENT,
    PASSAGEIRO_CPF VARCHAR(14),
    VOO_COD INT,
    DATA_RESERVA DATE NOT NULL,
    CONSTRAINT FK_PASSAGEIRO FOREIGN KEY (PASSAGEIRO_CPF) REFERENCES PASSAGEIROS(PASSAGEIRO_CPF),
    CONSTRAINT FK_VOO FOREIGN KEY (VOO_COD) REFERENCES VOOS(VOO_COD)
);
#criando alter da tabela reservas
ALTER TABLE RESERVAS ADD COLUMN STATUS_RESERVA ENUM('CONFIRMADA', 'PENDENTE', 'CANCELADA');
ALTER TABLE RESERVAS CHANGE COLUMN STATUS_RESERVA RESERVA_STATUS ENUM('CONFIRMADA', 'PENDENTE', 'CANCELADA');
ALTER TABLE RESERVAS MODIFY COLUMN RESERVA_STATUS ENUM('CONFIRMADA', 'PENDENTE', 'CANCELADA') NOT NULL;
ALTER TABLE RESERVAS DROP COLUMN RESERVA_STATUS;


#criando tabela da entidade associativa operações_voos
CREATE TABLE IF NOT EXISTS OPERACOES_VOO (
    VOO_COD INT,
    FUNCIONARIO_ID INT,
    FUNCAO VARCHAR(30),
    PRIMARY KEY (VOO_COD, FUNCIONARIO_ID),
    CONSTRAINT FK_VOO_OPERACAO FOREIGN KEY (VOO_COD) REFERENCES VOOS(VOO_COD),
    CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (FUNCIONARIO_ID) REFERENCES FUNCIONARIOS(FUNCIONARIO_ID)
);
#criando alter da tabela operacoes_voos
ALTER TABLE OPERACOES_VOO ADD COLUMN FUNCAO_EXTRA VARCHAR(50);
ALTER TABLE OPERACOES_VOO CHANGE COLUMN FUNCAO_EXTRA OPERACAO_FUNCAO_EXTRA VARCHAR(50);
ALTER TABLE OPERACOES_VOO MODIFY COLUMN OPERACAO_FUNCAO_EXTRA VARCHAR(100);
ALTER TABLE OPERACOES_VOO DROP COLUMN OPERACAO_FUNCAO_EXTRA;

#criando tabela extra e utilizando o comando DROP TABLE
CREATE TABLE IF NOT EXISTS CLIENTES_VIP (
    VIP_ID INT PRIMARY KEY AUTO_INCREMENT,
    PASSAGEIRO_CPF VARCHAR(14) UNIQUE,
    BENEFICIOS VARCHAR(100),
    DATA_CADASTRO DATE NOT NULL,
    CONSTRAINT FK_CLIENTE_VIP FOREIGN KEY (PASSAGEIRO_CPF) REFERENCES PASSAGEIROS(PASSAGEIRO_CPF)
);
DROP TABLE CLIENTES_VIP;




