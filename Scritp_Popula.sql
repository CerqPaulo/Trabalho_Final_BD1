--
-- -------- < TF2 - Eventos POPULA > --------
--
--                    SCRIPT DE INSERÇÃO (DML)
--
-- Data Criacao ...........: 24/06/2024
-- Autor(es) ..............: Wolfgang Friedrich Stein,Raquel Ferreira Andrade, 	João Lucas Miranda de Sousa, 
--                           Paulo Henrique Virgilio Cerqueira
-- Banco de Dados .........: MySQL 
-- Base de Dados (nome) ...: TF2_2A_JoaoSousa
--
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas

-- ---------------------------------------------------------

USE TF2_2A_JoaoSousa;

INSERT INTO CLIENTE (nomeCliente, emailCliente) VALUES 
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Pedro Santos', 'pedro.santos@example.com'),
('Ana Paula', 'ana.paula@example.com'),
('Carlos Eduardo', 'carlos.eduardo@example.com'),
('Fernanda Lima', 'fernanda.lima@example.com'),
('Lucas Mendes', 'lucas.mendes@example.com'),
('Juliana Pereira', 'juliana.pereira@example.com'),
('Ricardo Gomes', 'ricardo.gomes@example.com'),
('Patrícia Fernandes', 'patricia.fernandes@example.com');

INSERT INTO telefoneCliente (telefoneCliente, idCliente) VALUES 
(61912345678, 1),
(61923456789, 2),
(61934567890, 3),
(61945678901, 4),
(61956789012, 5),
(61967890123, 6),
(61978901234, 7),
(61989012345, 8),
(61990123456, 9),
(61901234567, 10);

INSERT INTO CLIENTE_FISICO (cpfCliente, dtNascimento, idCliente) VALUES 
(12345678901, '1980-01-01', 1),
(23456789012, '1981-02-02', 2),
(34567890123, '1982-03-03', 3),
(45678901234, '1983-04-04', 4),
(56789012345, '1984-05-05', 5),
(67890123456, '1985-06-06', 6),
(78901234567, '1986-07-07', 7),
(89012345678, '1987-08-08', 8),
(90123456789, '1988-09-09', 9),
(12345098765, '1989-10-10', 10);

INSERT INTO CLIENTE_JURIDICO (cnpjCliente, razaoSocial, idCliente) VALUES 
(11222333000101, 'Empresa A', 1),
(22333444000102, 'Empresa B', 2),
(33444555000103, 'Empresa C', 3),
(44555666000104, 'Empresa D', 4),
(55666777000105, 'Empresa E', 5),
(66777888000106, 'Empresa F', 6),
(77888999000107, 'Empresa G', 7),
(88999000000108, 'Empresa H', 8),
(99000111000109, 'Empresa I', 9),
(10111222000110, 'Empresa J', 10);

INSERT INTO ITEM_CARDAPIO (nomeItem, tipoItem, precoItem, itemAlcoolico, unidadeMedidaItem) VALUES -- adicionar BOOLEANOS
('Coxinha', 'Entrada', 3.50, NULL, 'Kg'),
('Refrigerante', 'Bebida', 4.00, NULL, 'LITRO'),
('Risoto', 'Doce', 15.00, NULL, 'Kg'),
('Brigadeiro', 'Doce', 2.00, NULL, 'Kg'),
('Esfiha', 'Salgado', 3.00, NULL, 'Kg'),
('Suco de Laranja', 'Bebida', 5.00, NULL, 'LITRO'),
('Torta de Limão', 'Doce', 12.00, NULL, 'Kg'),
('Pastel', 'Salgado', 4.00, NULL, 'UNITARIO'),
('Água Mineral', 'Bebida', 2.50, NULL, 'LITRO'),
('Salgadinho', 'Salgado', 3.00, NULL, 'UNITARIO');

INSERT INTO BUFFET (qtdItem, idItem) VALUES 
(100, 1),
(150, 2),
(200, 3),
(250, 4),
(300, 5),
(350, 6),
(400, 7),
(450, 8),
(500, 9),
(550, 10);

INSERT INTO tem (idItem, idBuffet) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO SALAO (qtdCadeira, qtdMesa) VALUES 
(100, 20),
(150, 30),
(200, 40),
(250, 50),
(300, 50),
(350, 70),
(400, 80),
(450, 90),
(500, 100),
(550, 110);

INSERT INTO EVENTO (tipoEvento, dataHoraEvento, idBuffet, idSalao) VALUES
    ('Casamento', '2024-06-30 18:00:00', 1, 1),
    ('Aniversário', '2024-07-15 19:30:00', 2, NULL),
    ('Conferência', '2024-08-05 09:00:00', NULL, 3),
    ('Festa de Formatura', '2024-09-10 20:00:00', 3, NULL),
    ('Coquetel', '2024-10-12 17:00:00', NULL, 2),
    ('Show', '2024-11-20 21:00:00', NULL, 3),
    ('Evento Corporativo', '2024-12-05 10:30:00', 1, 1),
    ('Festival', '2025-01-15 16:00:00', NULL, 2),
    ('Exposição', '2025-02-20 14:00:00', NULL, 3),
    ('Feira', '2025-03-08 10:00:00', 3, NULL);


INSERT INTO CONTRATO (indicacao, qtdPessoa, valorPagamento, dtPagamento, formaPagamento, tipoContrato, idCliente, idEvento) VALUES 
('abel', 100, 5000.00, '2024-06-01', 'Cartão', 'Contrato Unificado', 1, 1),
('bianca', 50, 3000.00, '2024-06-10', 'Boleto', 'Contrato Salao', 2, 2),
('carlos', 200, 8000.00, '2024-07-01', 'Transferência', 'Contrato Salao', 3, 3),
('diana', 150, 6000.00, '2024-07-15', 'Cartão', 'Contrato Salao', 4, 4),
('eric', 250, 3600.00, '2024-08-01', 'Dinheiro', 'Contrato Buffet', 5, 5),
('fabiana', 80, 3500.00, '2024-08-10', 'Cartão', 'Contrato Unificado', 6, 6),
('gael', 120, 5500.00, '2024-08-20', 'Boleto', 'Contrato Salao', 7, 7),
('halibel', 300, 1500.00, '2024-09-01', 'Cartão', 'Contrato Buffet', 8, 8),
('irineu', 60, 2500.00, '2024-09-10', 'Transferência', 'Contrato Unificado', 9, 9),
('jessica', 70, 2800.00, '2024-09-20', 'Dinheiro', 'Contrato Buffet', 10, 10);


INSERT INTO FORNECEDOR (cnpjFornecedor, nomeFantasia) VALUES 
(12345678000199, 'Fornecedor A'),
(98765432000199, 'Fornecedor B'),
(45678912000199, 'Fornecedor C'),
(32165498000199, 'Fornecedor D'),
(65498731000199, 'Fornecedor E'),
(78912345000199, 'Fornecedor F'),
(85296374000199, 'Fornecedor G'),
(96385274000199, 'Fornecedor H'),
(74125896000199, 'Fornecedor I'),
(36925814000199, 'Fornecedor J');

INSERT INTO telefoneFornecedor (telefoneFornecedor, cnpjFornecedor) VALUES 
('61912345678', 12345678000199),
('61923456789', 98765432000199),
('61934567890', 45678912000199),
('61945678901', 32165498000199),
('61956789012', 65498731000199),
('61967890123', 78912345000199),
('61978901234', 85296374000199),
('61989012345', 96385274000199),
('61990123456', 74125896000199),
('61901234567', 36925814000199);

INSERT INTO PRODUTO_FORNECEDOR (nomeProduto, tipoProduto, valorProduto, cnpjFornecedor, ehAlcoolico) VALUES 
('Salgadinho', 'Alimento', 100, 12345678000199, NULL),
('Coxinha', 'Alimento', 200, 98765432000199, NULL),
('Esfiha', 'Alimento', 150, 45678912000199, NULL),
('Empada', 'Alimento', 120, 32165498000199, NULL),
('Pastel', 'Alimento', 180, 65498731000199, NULL),
('Refrigerante', 'Bebida', 220, 78912345000199, FALSE),
('Suco', 'Bebida', 160, 85296374000199, FALSE),
('Água', 'Bebida', 140, 96385274000199, FALSE),
('Cerveja', 'Bebida', 190, 74125896000199, TRUE),
('Vinho', 'Bebida', 130, 36925814000199, TRUE);

INSERT INTO fornece (cnpjFornecedor, idProduto) VALUES 
(12345678000199, 1),
(98765432000199, 2),
(45678912000199, 3),
(32165498000199, 4),
(65498731000199, 5),
(78912345000199, 6),
(85296374000199, 7),
(96385274000199, 8),
(74125896000199, 9),
(36925814000199, 10);

INSERT INTO NOTA (valorNota, cnpjFornecedor) VALUES -- idProduto
(500.00, 12345678000199),
(750.00, 98765432000199),
(800.00, 45678912000199),
(600.00, 32165498000199),
(950.00, 65498731000199),
(700.00, 78912345000199),
(850.00, 85296374000199),
(900.00, 96385274000199),
(650.00, 74125896000199),
(550.00, 36925814000199);

INSERT INTO FUNCIONARIO (cpfFuncionario, nomeFuncionario, funcao, dtNascimentoFuncionario) VALUES 
(12345678901, 'Carlos Almeida', 'Garçom', '1985-05-10'),
(10987654321, 'Ana Souza', 'Cozinheira', '1990-07-22'),
(12312312312, 'Marcos Lima', 'Segurança', '1987-11-30'),
(32132132132, 'Beatriz Silva', 'Recepcionista', '1992-03-15'),
(45645645645, 'Rafael Torres', 'Barman', '1988-08-25'),
(65465465465, 'Juliana Martins', 'Garçonete', '1995-12-05'),
(78978978978, 'Pedro Henrique', 'DJ', '1984-06-18'),
(98798798798, 'Luana Almeida', 'Decoradora', '1989-09-22'),
(14714714714, 'Fernando Costa', 'Auxiliar de Limpeza', '1986-04-12'),
(25825825825, 'Tatiana Souza', 'Organizadora', '1993-10-10');

INSERT INTO trabalha (idFuncionario, idEvento) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO telefoneFuncionario (telefoneFuncionario, idFuncionario) VALUES 
('61912345678', 1),
('61923456789', 2),
('61934567890', 3),
('61945678901', 4),
('61956789012', 5),
('61967890123', 6),
('61978901234', 7),
('61989012345', 8),
('61990123456', 9),
('61901234567', 10);

INSERT INTO FICHADO (ctps, rg, certidaoNascimento, tituloEleitor, cartaoVacina, escolaridade, salario, idFuncionario) VALUES 
(12345678901, 1234567, '226330 01 55 2021 1 34922 063 4222487-26', 123456789012, 123456789012345, 'Ensino Médio', 2500, 1),
(23456789012, 2345678, '199584 01 55 2016 1 42860 768 3001217-90', 234567890123, 234567890123456, 'Ensino Superior', 3000, 2),
(34567890123, 3456789, '241897 01 55 2010 1 03743 906 8154657-43', 345678901234, 345678901234567, 'Ensino Médio', 2800, 3),
(45678901234, 4567890, '169888 01 55 2018 1 55296 581 9120404-08', 456789012345, 456789012345678, 'Ensino Superior', 3200, 4),
(56789012345, 5678901, '174448 01 55 2020 1 55237 089 7762601-72', 567890123456, 567890123456789, 'Ensino Médio', 2600, 5),
(67890123456, 6789012, '230074 01 55 2013 1 53616 824 5613733-94', 678901234567, 678901234567890, 'Ensino Superior', 3100, 6),
(78901234567, 7890123, '279310 01 55 2015 1 20802 038 4130897-20', 789012345678, 789012345678901, 'Ensino Médio', 2700, 7),
(89012345678, 8901234, '246684 01 55 2015 1 08075 585 8949911-95', 890123456789, 890123456789012, 'Ensino Superior', 3300, 8),
(90123456789, 9012345, '262254 01 55 2020 1 77750 758 6532742-81', 901234567890, 901234567890123, 'Ensino Médio', 2900, 9),
(12345098765, 0123456, '238375 01 55 2019 1 53402 316 7571744-73', 012345678901, 012345678901234, 'Ensino Superior', 3400, 10);

INSERT INTO DADOBANCARIO (conta, agencia, codigoBanco, tipoConta, ctps, cnpjFornecedor) VALUES 
(1234567890, 123456789012, 001, 'Corrente', 12345678901, NULL),
(2345678901, 234567890123, 002, 'Poupança', NULL, 98765432000199),
(3456789012, 345678901234, 003, 'Corrente', 34567890123, NULL),
(4567890123, 456789012345, 004, 'Poupança', NULL, 45678912000199),
(5678901234, 567890123456, 005, 'Corrente', 56789012345, NULL),
(6789012345, 678901234567, 006, 'Poupança', NULL, 65498731000199),
(7890123456, 789012345678, 007, 'Corrente', 78901234567, NULL),
(8901234567, 890123456789, 008, 'Poupança', NULL, 85296374000199),
(9012345678, 901234567890, 009, 'Corrente', 90123456789, NULL),
(1234567891, 112345678901, 010, 'Poupança', NULL, 74125896000199);

INSERT INTO FREELANCER (valorDiaria, ranking, idFuncionario, cpfIndicacao) VALUES
(200, 5, 1, NULL),
(300, 4, 2, 85806392040),
(250, 3, 3, NULL),
(350, 4, 4, NULL),
(400, 5, 5, NULL),
(220, 4, 6, 98798798798),
(280, 3, 7, NULL),
(330, 5, 8, NULL),
(370, 4, 9, NULL),
(410, 5, 10, NULL);

INSERT INTO DISPDIA_SEMANA (segunda, terca, quarta, quinta, sexta, sabado, domingo, idFreelancer) VALUES
('SIM', 'SIM', 'NAO', 'NAO', 'SIM', 'NAO', 'NAO', 1),
('NAO', 'SIM', 'SIM', 'NAO', 'NAO', 'SIM', 'NAO', 2),
('NAO', 'NAO', 'SIM', 'SIM', 'NAO', 'NAO', 'SIM', 3),
('SIM', 'NAO', 'NAO', 'SIM', 'SIM', 'NAO', 'NAO', 4),
('SIM', 'SIM', 'SIM', 'NAO', 'NAO', 'SIM', 'NAO', 5),
('NAO', 'NAO', 'SIM', 'SIM', 'SIM', 'NAO', 'NAO', 6),
('SIM', 'NAO', 'SIM', 'NAO', 'SIM', 'NAO', 'SIM', 7),
('SIM', 'SIM', 'NAO', 'SIM', 'NAO', 'SIM', 'NAO', 8),
('NAO', 'SIM', 'SIM', 'NAO', 'SIM', 'NAO', 'SIM', 9),
('SIM', 'NAO', 'NAO', 'SIM', 'SIM', 'SIM', 'NAO', 10);

INSERT INTO disponibiliza (idData, idFuncionario, idFreelancer) VALUES -- tirar idFuncionario
    (1, 101, 1),
    (2, 102, 2),
    (3, 103, 3),
    (4, 104, 4),
    (5, 105, 5),
    (6, 106, 6),
    (7, 107, 7),
    (8, 108, 8),
    (9, 109, 9),
    (10, 110, 10);

INSERT INTO DISPLOCAL (cidadeSatelite, idFreeLancer) VALUES
    ('Brasília', 1),
    ('Taguatinga', 2),
    ('Ceilândia', 3),
    ('Samambaia', 4),
    ('Guará', 5),
    ('Águas Claras', 6),
    ('Sobradinho', 7),
    ('Planaltina', 8),
    ('Gama', 9),
    ('Recanto das Emas', 10);

INSERT INTO ITEM_DECORACAO (tipoDecoracao, nomeDecoracao, valorDecoracao) VALUES
    ('Boneco', 'Boneco de Noivo', 100),
    ('Boneco', 'Boneco de Noiva', 100),
    ('Lençol', 'Lençol de Seda', 250),
    ('Lençol', 'Lençol de Algodão', 150),
    ('Flor', 'Arranjo de Rosas', 200),
    ('Flor', 'Bouquet de Tulipas', 180),
    ('Estátua', 'Estátua de Casal', 400),
    ('Estátua', 'Estátua de Cupido', 350),
    ('Moldura', 'Moldura de Fotos', 120),
    ('Moldura', 'Moldura de Espelho', 220);

INSERT INTO decora (idDecoracao, idSalao, qtdDecoracao) VALUES
    (1, 1, 10),  
    (2, 2, 15),  
    (3, 1, 8), 
    (4, 3, 12),  
    (5, 2, 20), 
    (6, 3, 5),  
    (7, 1, 7),  
    (8, 2, 18),  
    (9, 3, 11),  
    (10, 1, 14);
    
INSERT INTO possui (idDispLocal, idFreelancer) VALUES
    (1, 1),  
    (2, 2), 
    (3, 3),  
    (4, 4),  
    (5, 5),  
    (6, 6),  
    (7, 7),  
    (8, 8),  
    (9, 9),  
    (10, 10);  
    
INSERT INTO abastece (cnpjFornecedor, idBuffet, qtdProduto) VALUES
    (12345678000199, 1, 100),
    (98765432000199, 2, 150),
    (45678912000199, 3, 200),
    (32165498000199, 1, 120),
    (65498731000199, 2, 180),
    (78912345000199, 3, 220),
    (85296374000199, 1, 130),
    (96385274000199, 2, 160),
    (74125896000199, 3, 240),
    (36925814000199, 1, 140);

INSERT INTO ENDERECO (cidade, bairro, rua, numero, cep, idEvento, idCliente, cnpjFornecedor) VALUES
('Brasília', 'Asa Norte', 'Rua das Flores', 101, 70000001, 1, NULL, NULL),
('Brasília', 'Asa Sul', 'Rua das Palmeiras', 202, 70000002, 2, NULL, NULL),
('Brasília', 'Lago Sul', 'Avenida Central', 303, 70000003, 3, NULL, NULL),
('Brasília', 'Lago Norte', 'Rua dos Pássaros', 404, 70000004, 4, NULL, NULL),
('Brasília', 'Sudoeste', 'Rua das Árvores', 505, 70000005, 5, NULL, NULL),
('Brasília', 'Noroeste', 'Avenida Principal', 606, 70000006, 6, NULL, NULL),
('Brasília', 'Octogonal', 'Rua das Acácias', 707, 70000007, 7, NULL, NULL),
('Brasília', 'Cruzeiro', 'Rua das Oliveiras', 808, 70000008, 8, NULL, NULL),
('Brasília', 'Guará', 'Avenida Secundária', 909, 70000009, 9, NULL, NULL),
('Brasília', 'Taguatinga', 'Rua dos Pinheiros', 110, 70000010, 10, NULL, NULL),
('Brasília', 'Ceilândia', 'Rua das Hortênsias', 111, 70000011, NULL, 1, NULL),
('Brasília', 'Samambaia', 'Avenida dos Jardins', 112, 70000012, NULL, 2, NULL),
('Brasília', 'Águas Claras', 'Rua das Violetas', 113, 70000013, NULL, 3, NULL),
('Brasília', 'Riacho Fundo', 'Rua das Rosas', 114, 70000014, NULL, 4, NULL),
('Brasília', 'Núcleo Bandeirante', 'Rua das Magnólias', 115, 70000015, NULL, 5, NULL),
('Brasília', 'Park Way', 'Avenida das Palmeiras', 116, 70000016, NULL, 6, NULL),
('Brasília', 'Candangolândia', 'Rua dos Ipês', 117, 70000017, NULL, 7, NULL),
('Brasília', 'SIA', 'Rua das Tulipas', 118, 70000018, NULL, 8, NULL),
('Brasília', 'Vicente Pires', 'Avenida das Orquídeas', 119, 70000019, NULL, 9, NULL),
('Brasília', 'Sobradinho', 'Rua dos Girassóis', 120, 70000020, NULL, 10, NULL),
('Brasília', 'Asa Norte', 'Rua dos Lírios', 131, 70000031, NULL, NULL, 12345678000199),
('Brasília', 'Asa Sul', 'Avenida das Gardênias', 132, 70000032, NULL, NULL, 98765432000199),
('Brasília', 'Lago Sul', 'Rua dos Jasmins', 133, 70000033, NULL, NULL, 45678912000199),
('Brasília', 'Lago Norte', 'Avenida dos Cravos', 134, 70000034, NULL, NULL, 32165498000199),
('Brasília', 'Sudoeste', 'Rua das Dalias', 135, 70000035, NULL, NULL, 65498731000199),
('Brasília', 'Noroeste', 'Avenida das Camélias', 136, 70000036, NULL, NULL, 78912345000199),
('Brasília', 'Octogonal', 'Rua das Amendoeiras', 137, 70000037, NULL, NULL, 85296374000199),
('Brasília', 'Cruzeiro', 'Avenida das Jacarandás', 138, 70000038, NULL, NULL, 96385274000199),
('Brasília', 'Guará', 'Rua das Mimosas', 139, 70000039, NULL, NULL, 74125896000199),
('Brasília', 'Taguatinga', 'Avenida das Petúnias', 140, 70000040, NULL, NULL, 36925814000199);









