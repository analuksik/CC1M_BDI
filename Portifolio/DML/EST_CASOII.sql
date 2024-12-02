USE EST_CASOII;
-- INSERINDO DADOS NAS TABELAS

-- Tabela PASSAGEIROS
INSERT INTO PASSAGEIROS VALUES 
('123.456.789-00', 'João Silva', '(27) 99999-9999', 'Brasil', 'ES', 'Vitória', 'Centro', 'Rua A', 101),
('987.654.321-00', 'Maria Oliveira', '(11) 98888-8888', 'Brasil', 'SP', 'São Paulo', 'Moema', 'Av. B', 202),
('321.654.987-00', 'Ana Costa', '(21) 97777-7777', 'Brasil', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua C', 303),
('456.789.123-00', 'Carlos Sousa', '(31) 96666-6666', 'Brasil', 'MG', 'Belo Horizonte', 'Savassi', 'Av. D', 404),
('789.123.456-00', 'Fernanda Lima', '(41) 95555-5555', 'Brasil', 'PR', 'Curitiba', 'Centro', 'Rua E', 505);

-- Tabela AEROPORTOS
INSERT INTO AEROPORTOS VALUES 
('VIX', 'Eurico de Aguiar Salles', 'Vitória', 'Brasil'),
('GRU', 'Guarulhos', 'São Paulo', 'Brasil'),
('SDU', 'Santos Dumont', 'Rio de Janeiro', 'Brasil'),
('CNF', 'Confins', 'Belo Horizonte', 'Brasil'),
('CWB', 'Afonso Pena', 'Curitiba', 'Brasil');

-- Tabela AERONAVES
INSERT INTO AERONAVES VALUES 
(1, 'Boeing 737', 160),
(2, 'Airbus A320', 180),
(3, 'Embraer E195', 132),
(4, 'ATR 72', 70),
(5, 'Cessna 208', 12);

-- Tabela FUNCIONARIOS
INSERT INTO FUNCIONARIOS VALUES 
(101, 'Pedro Almeida', 'Piloto'),
(102, 'Juliana Mendes', 'Copiloto'),
(103, 'Roberto Costa', 'Comissário de Bordo'),
(104, 'Sandra Rocha', 'Atendente'),
(105, 'Thiago Ribeiro', 'Mecânico');

-- Tabela VOOS
INSERT INTO VOOS (VOO_COD, VOO_ORIGEM, VOO_DESTINO, VOO_PARTIDA, VOO_CHEGADA, AERONAVE_ID) VALUES
(1001, 'VIX', 'GRU', '2024-12-01 08:00:00', '2024-12-01 10:00:00', 1),
(1002, 'GRU', 'SDU', '2024-12-01 12:00:00', '2024-12-01 14:00:00', 2),
(1003, 'SDU', 'CNF', '2024-12-01 16:00:00', '2024-12-01 18:00:00', 3),
(1004, 'CNF', 'CWB', '2024-12-01 20:00:00', '2024-12-01 22:00:00', 4),
(1005, 'CWB', 'VIX', '2024-12-02 06:00:00', '2024-12-02 08:00:00', 5);

-- Tabela RESERVAS
INSERT INTO RESERVAS (PASSAGEIRO_CPF, VOO_COD, DATA_RESERVA) VALUES 
('123.456.789-00', 1001, '2024-11-15'),
('987.654.321-00', 1002, '2024-11-16'),
('321.654.987-00', 1003, '2024-11-17'),
('456.789.123-00', 1004, '2024-11-18'),
('789.123.456-00', 1005, '2024-11-19');

-- Tabela OPERACOES_VOO
INSERT INTO OPERACOES_VOO VALUES 
(1001, 101, 'Piloto'),
(1001, 102, 'Copiloto'),
(1002, 103, 'Comissário'),
(1003, 104, 'Atendente'),
(1004, 105, 'Mecânico');

-- ATUALIZANDO DADOS NAS TABELAS

-- Tabela PASSAGEIROS
UPDATE PASSAGEIROS SET PASSAGEIRO_TELEFONE = '(27) 90000-0000' WHERE PASSAGEIRO_CPF = '123.456.789-00';
UPDATE PASSAGEIROS SET PASSAGEIRO_CIDADE = 'Serra' WHERE PASSAGEIRO_CPF = '789.123.456-00';

-- Tabela AEROPORTOS
UPDATE AEROPORTOS SET AEROPORTO_CIDADE = 'São José dos Campos' WHERE AEROPORTO_COD = 'GRU';
UPDATE AEROPORTOS SET AEROPORTO_NOME = 'Aeroporto Santos Dumont' WHERE AEROPORTO_COD = 'SDU';

-- Tabela AERONAVES
UPDATE AERONAVES SET AERONAVE_CAPACIDADE = 200 WHERE AERONAVE_ID = 1;
UPDATE AERONAVES SET AERONAVE_MODELO = 'Airbus A321' WHERE AERONAVE_ID = 2;

-- Tabela FUNCIONARIOS
UPDATE FUNCIONARIOS SET CARGO = 'Chefe de Mecânicos' WHERE FUNCIONARIO_ID = 105;
UPDATE FUNCIONARIOS SET FUNCIONARIO_NOME = 'Juliana Santos' WHERE FUNCIONARIO_ID = 102;

-- Tabela VOOS
UPDATE VOOS SET VOO_PARTIDA = '2024-12-01 09:00:00' WHERE VOO_COD = 1001;
UPDATE VOOS SET VOO_DESTINO = 'VIX' WHERE VOO_COD = 1005;

-- Tabela RESERVAS
UPDATE RESERVAS SET DATA_RESERVA = '2024-11-20' WHERE RESERVA_ID = 1;
UPDATE RESERVAS SET VOO_COD = 1002 WHERE RESERVA_ID = 2;

-- Tabela OPERACOES_VOO
UPDATE OPERACOES_VOO SET FUNCAO = 'Supervisor de Operações' WHERE FUNCIONARIO_ID = 105;
UPDATE OPERACOES_VOO SET FUNCAO = 'Instrutor de Voo' WHERE FUNCIONARIO_ID = 101;

-- DELETANDO DADOS DAS TABELAS

-- Tabela PASSAGEIROS
DELETE FROM PASSAGEIROS WHERE PASSAGEIRO_CPF = '321.654.367-00';

-- Tabela AEROPORTOS
DELETE FROM AEROPORTOS WHERE AEROPORTO_COD = 'CWB';

-- Tabela AERONAVES
DELETE FROM AERONAVES WHERE AERONAVE_ID = 5;

-- Tabela FUNCIONARIOS
DELETE FROM FUNCIONARIOS WHERE FUNCIONARIO_ID = 104;

-- Tabela VOOS
DELETE FROM VOOS WHERE VOO_COD = 1003;

-- Tabela RESERVAS
DELETE FROM RESERVAS WHERE RESERVA_ID = 3;

-- Tabela OPERACOES_VOO
DELETE FROM OPERACOES_VOO WHERE FUNCIONARIO_ID = 103;