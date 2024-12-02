#FASE 1: CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE):
#MEU PRIMEIRO BANQUINHO
DROP SCHEMA EST_CASOI;
CREATE SCHEMA EST_CASOI;

#FASE 2: SELECIONAR O NOVO SCHEMA OU DATABASE PARA USO:
#USANDO MEU BANQUINHO
USE EST_CASOI;


# FASE 3: CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS

#CRIANDO A TABELINHA FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES(
#NOMEDOATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
FORNEC_COD INT PRIMARY KEY,
FORNEC_NOME VARCHAR(45) NOT NULL,
FORNEC_RUA VARCHAR(45) NOT NULL,
FORNEC_NUMRUA INT,
FORNEC_BAIRRO VARCHAR(45) NOT NULL,
FORNEC_CIDADE VARCHAR(45) NOT NULL,
FORNEC_ESTADO VARCHAR(45) NOT NULL,
FORNEC_PAIS VARCHAR(30) NOT NULL,
FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
FORNEC_TELEFONE VARCHAR(15) NOT NULL,
FORNEC_CONTATO TEXT NOT NULL
);

#criando alter para a tabela fornecedores
 alter table fornecedores add column num varchar(30);
 alter table fornecedores change column num forn_num varchar(30);
 alter table fornecedores modify column forn_num varchar(50);
 alter table fornecedores drop column forn_num;

#CRIANDO A TABELINHA FILIAIS
CREATE TABLE IF NOT EXISTS FILIAIS(
FILIAL_COD INT PRIMARY KEY,
FILIAL_NOME VARCHAR(45) NOT NULL,
FILIAL_RUA VARCHAR(100) NOT NULL,
FILIAL_NUMRUA INT,
FILIAL_BAIRRO VARCHAR(50) NOT NULL,
FILIAL_CIDADE VARCHAR(50) NOT NULL,
FILIAL_ESTADO VARCHAR(50) NOT NULL,
FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
FILIAL_CAPACIDADE TEXT NOT NULL);

#adicionando alter na tabela filiais
 alter table filiais add column pais varchar(30);
 alter table filiais change column pais filial_pais varchar(30);
 alter table filiais modify column filial_pais varchar(50);
 alter table filiais drop column filial_pais;

#CRIANDO A TABELINHA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS(
PROD_COD INT PRIMARY KEY,
PROD_NOME VARCHAR(50) NOT NULL,
PROD_DESCRICAO TEXT NOT NULL,
PROD_ESPECTEC TEXT NOT NULL,
PROD_QUANT DECIMAL(10,3) NOT NULL,
PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

#criando alter para a tabela produtos
alter table produtos add column VALIDADE varchar(5);
alter table produtos change column VALIDADE PROD_VALIDADE varchar(5);
alter table produtos modify column PROD_VALIDADE varchar(10);
alter table produtos drop column PROD_VALIDADE;

#FASE 4: CRIAR AS TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA

#CRIANDO A TABELA PEDIDOS
CREATE TABLE IF NOT EXISTS PEDIDOS(
PED_CODIGO INT PRIMARY KEY,
PED_DATA DATE NOT NULL,
PED_HORA TIME NOT NULL,
PED_PREVISAO DATE NOT NULL,
PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
PED_FORNECEDOR INT NOT NULL, #NOSSA CHAVE ESTRANGEIRA DE FORNECEDOR
#CRIANDO A REFERENCIA PARA A CHAVE ESTRANGEIRA
#RESTRIÇÃO APELIDO CH.ESTRANGEIRA(CAMPO CRIADO) REFERENCIA TABELA(CH.PRIMÁRIA)
CONSTRAINT FK_FORNECEDOR FOREIGN KEY (PED_FORNECEDOR) #DAR NOME A RESTRIÇÃO(CONSTRAINT) É UMA BOA PRÁTICA
REFERENCES FORNECEDORES(FORNEC_COD) #REFERENCIA A CHAVE PRIMÁRIA DE FORNECEDORES
);
#criando alter para a tabela pedidos
alter table pedidos add column comprador varchar(15);
alter table pedidos change column comprador ped_comprador varchar(15);
alter table pedidos modify column ped_comprador varchar(20);
alter table pedidos drop column ped_comprador;


#CRIANDO A TABELA RECEBIMENTOS (VEIO DEPOIS POIS TEM DEPENDÊNCIA DE PEDIDOS)
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
RECEB_DATA DATE NOT NULL,
RECEB_HORA TIME NOT NULL,
RECEB_QUANT_PROD DECIMAL(10,3),
RECEB_CONDICAO TEXT NOT NULL,
RECEB_PEDIDOS INT PRIMARY KEY,
CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO));

#criando alter para a tabela recebimentos

alter table recebimentos add column fornecedor varchar(20);
alter table recebimentos change column fornecedor receb_fornecedor varchar(20);
alter table recebimentos modify column receb_fornecedor varchar(30);
alter table recebimentos drop column receb_fornecedor;

#FASE 5: CRIANDO AS TABELAS ASSOCIATIVAS (ENTIDADES ASSOCIATIVAS)

#CRIANDO A TABELA PEDIDOS_PRODUTOS
CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
PDPR_PEDIDOS INT,
PDPR_PRODUTOS INT,
PRIMARY KEY(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

#criando alter para tabela pedidos_produtos
alter table pedidos_produtos add column desconto varchar(5);
alter table pedidos_produtos change column desconto pdpr_desconto varchar(5);
alter table pedidos_produtos modify column pdpr_desconto varchar(15);
alter table pedidos_produtos drop column pdpr_desconto;

#CRIANDO A TABELA FILIAIS_PRODUTOS
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
FLPR_FILIAL INT,
FLPR_PRODUTOS INT,
PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD));

#criando alter da tabela filiais_produtos
alter table filiais_produtos add column tempoEntrega int;
alter table filiais_produtos change column tempoEntrega flpr_tempoEntrega int;
alter table filiais_produtos modify column flpr_tempoEntrega time;
alter table filiais_produtos drop column flpr_tempoEntrega;

#CRIAR A TABELA FORNECEDORES_PRODUTOS
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
FRPR_FORNECEDOR INT,
FRPR_PRODUTOS INT,
PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR)
REFERENCES FORNECEDORES(FORNEC_COD),
CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) 
REFERENCES PRODUTOS(PROD_COD));

#criando alter da tabela fornecedores_produtos
alter table fornecedores_produtos add column tempoEntrega varchar(10);
alter table fornecedores_produtos change column tempoEntrega frpr_tempoEntrega varchar(10);
alter table fornecedores_produtos modify column frpr_tempoEntrega time;
alter table fornecedores_produtos drop column frpr_tempoEntrega;

#criando tabela extra
CREATE TABLE IF NOT EXISTS CLIENTES(
cliente_cpf varchar(14) primary key,
cliente_nome varchar(30) not null
);

#usando comando drop para a tabela clientes
DROP table clientes;
