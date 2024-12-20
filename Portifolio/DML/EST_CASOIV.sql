USE EST_CASOIV;

-- Inserts para a tabela alunos
INSERT INTO ALUNOS (ALUNO_ID, ALUNO_NOME, ALUNO_DATA_NASC, ALUNO_CPF, ALUNO_NUMERO_RUA, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_BAIRRO, ALUNO_TELEFONE) 
VALUES (1, 'Carlos Silva', '2000-01-15', '12345678901', 123, 'São Paulo', 'SP', 'Brasil', 'Centro', '11987654321');

INSERT INTO ALUNOS (ALUNO_ID, ALUNO_NOME, ALUNO_DATA_NASC, ALUNO_CPF, ALUNO_NUMERO_RUA, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_BAIRRO, ALUNO_TELEFONE) 
VALUES (2, 'Mariana Oliveira', '1995-06-10', '23456789012', 456, 'Rio de Janeiro', 'RJ', 'Brasil', 'Copacabana', '21987654322');

INSERT INTO ALUNOS (ALUNO_ID, ALUNO_NOME, ALUNO_DATA_NASC, ALUNO_CPF, ALUNO_NUMERO_RUA, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_BAIRRO, ALUNO_TELEFONE)
VALUES (3, 'José Pereira', '1992-11-30', '34567890123', 789, 'Belo Horizonte', 'MG', 'Brasil', 'Savassi', '31987654323');

INSERT INTO ALUNOS (ALUNO_ID, ALUNO_NOME, ALUNO_DATA_NASC, ALUNO_CPF, ALUNO_NUMERO_RUA, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_BAIRRO, ALUNO_TELEFONE) 
VALUES (4, 'Ana Costa', '1989-03-22', '45678901234', 1011, 'Fortaleza', 'CE', 'Brasil', 'Centro', '84987654324');

INSERT INTO ALUNOS (ALUNO_ID, ALUNO_NOME, ALUNO_DATA_NASC, ALUNO_CPF, ALUNO_NUMERO_RUA, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_BAIRRO, ALUNO_TELEFONE) 
VALUES (5, 'Lucas Almeida', '1985-08-05', '56789012345', 1234, 'Salvador', 'BA', 'Brasil', 'Barra', '71987654325');

-- Updates para a tabela modalidades 
UPDATE ALUNOS SET ALUNO_CIDADE = 'São Bernardo do Campo' WHERE ALUNO_ID = 2;
UPDATE ALUNOS SET ALUNO_TELEFONE = '31987654326' WHERE ALUNO_ID = 4;

-- Delete
DELETE FROM ALUNOS WHERE ALUNO_ID = 3;

-- Inserts para a tabela modalidades
INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_numInscritos) 
VALUES (1, 'Pilates', 10);

INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_numInscritos) 
VALUES (2, 'Yoga', 15);

INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_numInscritos) 
VALUES (3, 'Musculação', 20);

INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_numInscritos) 
VALUES (4, 'Zumba', 8);

INSERT INTO MODALIDADES (MOD_ID, MOD_NOME, MOD_numInscritos) 
VALUES (5, 'Crossfit', 12);

-- Updates
UPDATE MODALIDADES SET MOD_numInscritos = 18 WHERE MOD_ID = 2;
UPDATE MODALIDADES SET MOD_NOME = 'Treinamento Funcional' WHERE MOD_ID = 5;

-- Delete
DELETE FROM MODALIDADES WHERE MOD_ID = 3;

-- Inserts para a tabela instrutores
INSERT INTO INSTRUTORES (INST_ID, INST_NOME) 
VALUES (1, 'João Almeida');

INSERT INTO INSTRUTORES (INST_ID, INST_NOME) 
VALUES (2, 'Maria Souza');

INSERT INTO INSTRUTORES (INST_ID, INST_NOME) 
VALUES (3, 'Carlos Oliveira');

INSERT INTO INSTRUTORES (INST_ID, INST_NOME) 
VALUES (4, 'Ana Pereira');

INSERT INTO INSTRUTORES (INST_ID, INST_NOME) 
VALUES (5, 'Luiz Costa');

-- Updates
UPDATE INSTRUTORES SET INST_NOME = 'Carlos Silva' WHERE INST_ID = 2;
UPDATE INSTRUTORES SET INST_NOME = 'Renata Oliveira' WHERE INST_ID = 4;

-- Delete
DELETE FROM INSTRUTORES WHERE INST_ID = 1;

-- Inserts para a tabela pagamentos
INSERT INTO PAGAMENTOS (PG_ID, PG_DATA, PG_VALOR, PG_STATUS, PG_ALUNO_ID) 
VALUES (1, '2024-01-10', 200.00, 'Pago', 2);

INSERT INTO PAGAMENTOS (PG_ID, PG_DATA, PG_VALOR, PG_STATUS, PG_ALUNO_ID) 
VALUES (2, '2024-02-15', 150.00, 'Pendente', 4);

INSERT INTO PAGAMENTOS (PG_ID, PG_DATA, PG_VALOR, PG_STATUS, PG_ALUNO_ID) 
VALUES (3, '2024-03-20', 300.00, 'Pago', 1);

INSERT INTO PAGAMENTOS (PG_ID, PG_DATA, PG_VALOR, PG_STATUS, PG_ALUNO_ID) 
VALUES (4, '2024-04-25', 250.00, 'Pendente', 3);

INSERT INTO PAGAMENTOS (PG_ID, PG_DATA, PG_VALOR, PG_STATUS, PG_ALUNO_ID) 
VALUES (5, '2024-05-30', 100.00, 'Pago', 5);

-- Updates
UPDATE PAGAMENTOS SET PG_STATUS = 'Pago' WHERE PG_ID = 2;
UPDATE PAGAMENTOS SET PG_VALOR = 280.00 WHERE PG_ID = 4;

-- Delete
DELETE FROM PAGAMENTOS WHERE PG_ID = 5;

-- Inserts para a tabela instrutores_modalidades
INSERT INTO INSTRUTORES_MODALIDADES (instMod_INSTRUTOR_ID, instMod_MOD_ID) 
VALUES (1, 1);

INSERT INTO INSTRUTORES_MODALIDADES (instMod_INSTRUTOR_ID, instMod_MOD_ID) 
VALUES (2, 2);

INSERT INTO INSTRUTORES_MODALIDADES (instMod_INSTRUTOR_ID, instMod_MOD_ID) 
VALUES (3, 3);

INSERT INTO INSTRUTORES_MODALIDADES (instMod_INSTRUTOR_ID, instMod_MOD_ID) 
VALUES (4, 4);

INSERT INTO INSTRUTORES_MODALIDADES (instMod_INSTRUTOR_ID, instMod_MOD_ID) 
VALUES (5, 5);

-- Updates
UPDATE INSTRUTORES_MODALIDADES SET instMod_MOD_ID = 2 WHERE instMod_INSTRUTOR_ID = 1;
UPDATE INSTRUTORES_MODALIDADES SET instMod_INSTRUTOR_ID = 3 WHERE instMod_MOD_ID = 4;

-- Delete
DELETE FROM INSTRUTORES_MODALIDADES WHERE instMod_INSTRUTOR_ID = 5 AND instMod_MOD_ID = 5;

-- Inserts para a tabela aulas
INSERT INTO AULAS (AULA_ID, AULA_INSTRUTOR_ID, AULA_MODALIDADE_ID, AULA_CAPACIDADE, AULA_HORARIO) 
VALUES (1, 1, 1, 20, '09:00:00');

INSERT INTO AULAS (AULA_ID, AULA_INSTRUTOR_ID, AULA_MODALIDADE_ID, AULA_CAPACIDADE, AULA_HORARIO) 
VALUES (2, 2, 2, 25, '10:00:00');

INSERT INTO AULAS (AULA_ID, AULA_INSTRUTOR_ID, AULA_MODALIDADE_ID, AULA_CAPACIDADE, AULA_HORARIO) 
VALUES (3, 3, 3, 30, '11:00:00');

INSERT INTO AULAS (AULA_ID, AULA_INSTRUTOR_ID, AULA_MODALIDADE_ID, AULA_CAPACIDADE, AULA_HORARIO) 
VALUES (4, 4, 4, 15, '12:00:00');

INSERT INTO AULAS (AULA_ID, AULA_INSTRUTOR_ID, AULA_MODALIDADE_ID, AULA_CAPACIDADE, AULA_HORARIO) 
VALUES (5, 5, 5, 20, '13:00:00');

-- Updates
UPDATE AULAS SET AULA_CAPACIDADE = 25 WHERE AULA_ID = 1;
UPDATE AULAS SET AULA_HORARIO = '14:00:00' WHERE AULA_ID = 3;

-- Delete
DELETE FROM AULAS WHERE AULA_ID = 4;

-- Inserts para a tabela planos_treinamento
INSERT INTO PLANOS_TREINAMENTO (planTrein_ID, planTrein_DESCRICAO, planTrein_DATA_CRIACAO, planTrein_DATA_ATUALIZACAO, planTrein_ALUNO_ID, planTrein_INSTRUTOR_ID, planTrein_MODALIDADE_ID) 
VALUES (1, 'Plano de treino inicial', '2024-01-01', '2024-01-01', 1, 1, 1);

INSERT INTO PLANOS_TREINAMENTO (planTrein_ID, planTrein_DESCRICAO, planTrein_DATA_CRIACAO, planTrein_DATA_ATUALIZACAO, planTrein_ALUNO_ID, planTrein_INSTRUTOR_ID, planTrein_MODALIDADE_ID) 
VALUES (2, 'Plano de treino avançado', '2024-02-01', '2024-02-01', 2, 2, 2);

INSERT INTO PLANOS_TREINAMENTO (planTrein_ID, planTrein_DESCRICAO, planTrein_DATA_CRIACAO, planTrein_DATA_ATUALIZACAO, planTrein_ALUNO_ID, planTrein_INSTRUTOR_ID, planTrein_MODALIDADE_ID) 
VALUES (3, 'Plano de treino funcional', '2024-03-01', '2024-03-01', 3, 3, 3);

INSERT INTO PLANOS_TREINAMENTO (planTrein_ID, planTrein_DESCRICAO, planTrein_DATA_CRIACAO, planTrein_DATA_ATUALIZACAO, planTrein_ALUNO_ID, planTrein_INSTRUTOR_ID, planTrein_MODALIDADE_ID) 
VALUES (4, 'Plano de treino musculação', '2024-04-01', '2024-04-01', 4, 4, 4);

INSERT INTO PLANOS_TREINAMENTO (planTrein_ID, planTrein_DESCRICAO, planTrein_DATA_CRIACAO, planTrein_DATA_ATUALIZACAO, planTrein_ALUNO_ID, planTrein_INSTRUTOR_ID, planTrein_MODALIDADE_ID) 
VALUES (5, 'Plano de treino de emagrecimento', '2024-05-01', '2024-05-01', 5, 5, 5);

-- Updates
UPDATE PLANOS_TREINAMENTO SET planTrein_DESCRICAO = 'Plano de treino personalizado' WHERE planTrein_ID = 3;
UPDATE PLANOS_TREINAMENTO SET planTrein_DATA_ATUALIZACAO = '2024-06-01' WHERE planTrein_ID = 2;

-- Delete
DELETE FROM PLANOS_TREINAMENTO WHERE planTrein_ID = 4;

-- Inserts para a tabela aulas_aluno
INSERT INTO AULAS_ALUNOS (aulaAluno_AULA_ID, aulaAluno_ALUNO_ID) 
VALUES (1, 1);

INSERT INTO AULAS_ALUNOS (aulaAluno_AULA_ID, aulaAluno_ALUNO_ID) 
VALUES (2, 2);

INSERT INTO AULAS_ALUNOS (aulaAluno_AULA_ID, aulaAluno_ALUNO_ID) 
VALUES (3, 3);

INSERT INTO AULAS_ALUNOS (aulaAluno_AULA_ID, aulaAluno_ALUNO_ID) 
VALUES (4, 4);

INSERT INTO AULAS_ALUNOS (aulaAluno_AULA_ID, aulaAluno_ALUNO_ID) 
VALUES (5, 5);

-- Updates
UPDATE AULAS_ALUNOS SET aulaAluno_ALUNO_ID = 3 WHERE aulaAluno_AULA_ID = 1;
UPDATE AULAS_ALUNOS SET aulaAluno_ALUNO_ID = 5 WHERE aulaAluno_AULA_ID = 4;

-- Delete
DELETE FROM AULAS_ALUNOS WHERE aulaAluno_AULA_ID = 2;
