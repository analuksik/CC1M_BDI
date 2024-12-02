CREATE DATABASE IF NOT EXISTS FORTES;
USE FORTES;

CREATE TABLE IF NOT EXISTS PROPONENTES(
CNPJ_PROP INT PRIMARY KEY,
NOME_PROP VARCHAR (100) NOT NULL,
CEP_PROP VARCHAR (8) NOT NULL,
CIDADE_PROP VARCHAR (200) NOT NULL,
LOGRADOURO_PROP VARCHAR(100) NOT NULL,
EMAIL_PROP VARCHAR(50) NOT NULL,
TELEFONE_PROP VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS RESP_TEC(
CPF_TEC VARCHAR(15) primary KEY,
RG_TEC VARCHAR(15) NOT NULL,
NOME_TEC VARCHAR(100) NOT NULL,
EMAIL_TEC VARCHAR(50) NOT NULL,
TELEFONE_TEC VARCHAR(20) NOT NULL,
CEP_TEC VARCHAR(8) NOT NULL,
CIDADE_TEC VARCHAR(200) NOT NULL,
LOGRADOURO_TEC VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS RESP_LEG(
CPF_LEG VARCHAR(15) primary KEY,
RG_LEG VARCHAR(15) NOT NULL,
NOME_LEG VARCHAR(100) NOT NULL,
EMAIL_LEG VARCHAR(50) NOT NULL,
TELEFONE_LEG VARCHAR(20) NOT NULL,
CEP_LEG VARCHAR(8) NOT NULL,
CIDADE_LEG VARCHAR(200) NOT NULL,
LOGRADOURO_LEG VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS FUNC_FORTES(
RA INT PRIMARY KEY,
NOME_FUNC VARCHAR (100) NOT NULL,
EMAIL_ORG VARCHAR(50) NOT NULL,
CARGO VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS APADRINHAMENTO(
FORTES INT PRIMARY KEY,
FOREIGN KEY (FORTES) REFERENCES FUNC_FORTES(RA)
);

CREATE TABLE IF NOT EXISTS INSTITUICOES(
ID_INST INT,
ATA_ELEICAO MEDIUMBLOB NOT NULL,
CONTRATO_SOCIAL MEDIUMBLOB NOT NULL,
DECLARACAO_BANCARIA MEDIUMBLOB NOT NULL,
CPF_PRESIDENTE MEDIUMBLOB NOT NULL,
RG_PRESIDENTE MEDIUMBLOB NOT NULL,
PROPONENTES INT,
RESP_TEC VARCHAR(15),
RESP_LEG VARCHAR(15),
PADRINHO INT NOT NULL,
PRIMARY KEY (ID_INST,RESP_TEC,PROPONENTES,RESP_LEG),
FOREIGN KEY (PROPONENTES) REFERENCES PROPONENTES(CNPJ_PROP),
FOREIGN KEY (RESP_TEC) REFERENCES RESP_TEC(CPF_TEC),
FOREIGN KEY (RESP_LEG) REFERENCES RESP_LEG(CPF_LEG),
FOREIGN KEY (PADRINHO) REFERENCES APADRINHAMENTO(FORTES)
);

CREATE TABLE IF NOT EXISTS MONITORAMENTOS(
ID_MONI INT PRIMARY KEY,
CADASTRO_BASICO INT NOT NULL,
CADASTRO_ADICIONAL VARCHAR(45) NOT NULL,
DOCUMENTOS VARCHAR(45) NOT NULL,
INSTITUICAO INT NOT NULL,
FORTES INT NOT NULL,
FOREIGN KEY (INSTITUICAO) REFERENCES INSTITUICOES(ID_INST),
FOREIGN KEY (FORTES) REFERENCES FUNC_FORTES(RA)
);

CREATE TABLE IF NOT EXISTS REUNIÕES(
ID_REUNIOES INT PRIMARY KEY,
DATA DATE NOT NULL,
HORA TIME NOT NULL,
LINK VARCHAR(45) NOT NULL,
TIPO VARCHAR(45) NOT NULL,
ID_MONI INT NOT NULL,
FOREIGN KEY (ID_MONI) REFERENCES MONITORAMENTOS(ID_MONI)
);

CREATE TABLE IF NOT EXISTS VISITAS_TÉCNICAS(
ID_VST INT PRIMARY KEY,
DATA_VST DATE NOT NULL,
HORA_VST TIME NOT NULL,
ID_MONI INT NOT NULL,
PADRINHO INT  NOT NULL,
FOREIGN KEY (ID_MONI) REFERENCES MONITORAMENTOS(ID_MONI),
FOREIGN KEY (PADRINHO) REFERENCES APADRINHAMENTO(FORTES)
);

CREATE TABLE IF NOT EXISTS RELATÓRIOS(
ID_RELATORIOS INT PRIMARY KEY,
DATA_RELAT DATE NOT NULL,
HORA_RELAT TIME NOT NULL,
RELATORIO MEDIUMBLOB NOT NULL,
ID_MONI INT NOT NULL,
FOREIGN KEY (ID_MONI) REFERENCES MONITORAMENTOS(ID_MONI)
);

CREATE TABLE IF NOT EXISTS PROPOSTAS_DOACOES(
ID_PROPOSTA INT,
METODOLOGIA TEXT NOT NULL,
METAS TEXT NOT NULL,
OBJETIVO TEXT NOT NULL,
PUBLICO_ALVO TEXT NOT NULL,
AREA_ATUAÇÃO  ENUM("SAÚDE","EDUCAÇÃO","ASSISTENCIA SOCIAL","QUALIFICAÇÃO PROFISSIONAL",
"MEIO AMBIENTE","GERAÇÃO DE EMPREGO E RENDA","ESPORTE","LAZER","CULTURA"),
INICIO DATE NOT NULL,
FIM DATE NOT NULL,
VALOR_TOTAL FLOAT NOT NULL,
INSTITUICAO INT,
FORTES INT,
PRIMARY KEY(FORTES,INSTITUICAO, ID_PROPOSTA),
foreign key (INSTITUICAO) REFERENCES INSTITUICOES(ID_INST),
FOREIGN KEY (FORTES) REFERENCES FUNC_FORTES(RA)
);