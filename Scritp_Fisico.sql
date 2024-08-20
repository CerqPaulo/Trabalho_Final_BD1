--
-- -------- < TF2 - Eventos FÍSICO > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 07/06/2024
-- Autor(es) ..............: Wolfgang Friedrich Stein,Raquel Ferreira Andrade, João Lucas Miranda de Sousa, 
--                           Paulo Henrique Virgilio Cerqueira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2_2A_JoaoSousa
--
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas
-- Ultimas Alteracoes
-- Ultimas Alteracoes
-- 15/06/2024 Foram criadas as tabelas: DADOBANCOFORNECEDOR, PRODUTO_FORNECEDOR, fornece, possui, trabalha, tem, abastece, ENDERECO
-- 15/06/2024 Foram modificados os atributos necessários das entidades para manter um projeto coeso
-- 16/06/2024 Modificadas algumas constraints que estavam de forma errada
-- 22/06/2024 Foram adicionadas novas tabelas: DISPDIA_SEMANA, ITEM_DECORACAO, decora
-- 23/06/2024 Tiramos a especialização de contrato, ficando somente uma entidade
-- 23/06/2024 adicionamos um atributo tipoContrato em CONTRATO
-- -------------------------------------------------------------------------------------

create database if not exists TF2_2A_JoaoSousa ;

use TF2_2A_JoaoSousa;

-- 1
CREATE TABLE CLIENTE( 
	idCliente INT NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(20) NOT NULL,
    emailCliente VARCHAR(64),
    
    constraint CLIENTE_PK primary key (idCliente),
    constraint CLIENTE_UK unique key (emailCliente)
)engine=InnoDB auto_increment = 1;
-- 2
create table telefoneCliente( 

	telefoneCliente BIGINT(11) NOT NULL,
    idCliente INT NOT NULL,
    
    constraint telefoneCliente_PK primary key (telefoneCliente),
    constraint CLIENTE_FK foreign key (idCliente) 
		references CLIENTE (idCliente)
)engine=innodb;
-- 3
create table CLIENTE_FISICO (
	cpfCliente bigint(11) not null,
    dtNascimento date not null,
    idCliente int not null,
    
    constraint CLIENTE_FISICO_PK primary key (cpfCliente),
    constraint CLIENTE_F_FK foreign key (idCliente) references CLIENTE (idCliente)
)engine = innodb;
-- 4
create table CLIENTE_JURIDICO (
	cnpjCliente bigint(14) not null,
    razaoSocial varchar(16) not null,
    idCliente int not null,
    
    constraint CLIENTE_JURIDICO_PK primary key (cnpjCliente),
    constraint CLIENTE_J_FK foreign key (idCliente) references CLIENTE (idCliente)
)engine = innodb;
-- 5
CREATE TABLE ITEM_CARDAPIO ( 
    idItem INT NOT NULL AUTO_INCREMENT,
    nomeItem VARCHAR(20) NOT NULL,
    tipoItem VARCHAR(20) NOT NULL,
    precoItem DECIMAL(6 , 2) NOT NULL,
    itemAlcoolico BOOLEAN NOT NULL,
    unidadeMedidaItem VARCHAR(20) NOT NULL,
    CONSTRAINT ITEM_CARDAPIO_PK PRIMARY KEY (idItem),
    CONSTRAINT ITEM_CARDAPIO_UK UNIQUE KEY (nomeItem)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 6
CREATE TABLE BUFFET ( 
    idBuffet INT NOT NULL AUTO_INCREMENT,
	qtdItem INT(4) NOT NULL,
    idItem INT NOT NULL,
    CONSTRAINT BUFFET_PK PRIMARY KEY (idBuffet),
    CONSTRAINT CARDAPIO_FK FOREIGN KEY(idItem)
		REFERENCES ITEM_CARDAPIO(idItem)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 7
CREATE TABLE tem( 
	idItem INT NOT NULL,
    idBuffet INT NOT NULL,
    CONSTRAINT ITEMCARDAPIO_FK FOREIGN KEY(idItem)
		REFERENCES ITEM_CARDAPIO(idItem),
	CONSTRAINT BUFFET_FK FOREIGN KEY(idBuffet)
		REFERENCES BUFFET(idBuffet)
);
-- 8
CREATE TABLE SALAO ( 
    idSalao INT NOT NULL AUTO_INCREMENT,
    qtdCadeira INT(4) NOT NULL,
    qtdMesa INT(3) NOT NULL,
    CONSTRAINT SALAO_PK PRIMARY KEY (idSalao)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 9
CREATE TABLE EVENTO (
    idEvento INT NOT NULL AUTO_INCREMENT,
    tipoEvento VARCHAR(20) NOT NULL,
    dataHoraEvento DATETIME NOT NULL,
    idBuffet INT,
    idSalao INT,
    CONSTRAINT EVENTO_PK PRIMARY KEY (idEvento),
	CONSTRAINT BUFFET_FK_2 FOREIGN KEY(idBuffet)
		REFERENCES BUFFET(idBuffet),
	CONSTRAINT SALAO_FK_2 FOREIGN KEY(idSalao)
		REFERENCES SALAO(idSalao)
)  ENGINE=INNODB;
-- 10
CREATE TABLE CONTRATO ( 
    idContrato INT NOT NULL AUTO_INCREMENT,
    indicacao VARCHAR(20),
    qtdPessoa INT(4) NOT NULL,
	valorPagamento DECIMAL(6,2) NOT NULL,
    dtPagamento DATE NOT NULL,
    formaPagamento VARCHAR(20) NOT NULL,
    tipoContrato VARCHAR(25) NOT NULL,
    idCliente INT NOT NULL,
    idEvento INT NOT NULL,
    CONSTRAINT CONTRATO_PK PRIMARY KEY (idContrato),
    CONSTRAINT CLIENTE_CONTRATO_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE(idCliente),
	CONSTRAINT EVENTO_FK_3 FOREIGN KEY(idEvento) 
		REFERENCES EVENTO(idEvento)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 11
CREATE TABLE FORNECEDOR ( 
    cnpjFornecedor BIGINT(14) NOT NULL,
    nomeFantasia VARCHAR(50) NOT NULL,

    CONSTRAINT FORNECEDOR_PK PRIMARY KEY (cnpjFornecedor)
)  ENGINE=INNODB;
-- 12
create table telefoneFornecedor (
	telefoneFornecedor varchar(16),
    cnpjFornecedor bigint(14) not null,
    
    constraint telefoneFornecedor_PK primary key (telefoneFornecedor),
    constraint FORNECEDOR_FK foreign key (cnpjFornecedor) references FORNECEDOR (cnpjFornecedor)
)engine = innodb;
-- 13
create table PRODUTO_FORNECEDOR (
	idProduto int not null auto_increment,
    nomeProduto varchar(20) not null,
    tipoProduto varchar(20) not null,
    valorProduto int(4) not null,
    cnpjFornecedor BIGINT(14) NOT NULL,
	ehAlcoolico BOOLEAN NOT NULL,
    
    CONSTRAINT PRODUTO_FORNECEDOR_PK PRIMARY KEY (idProduto),
    CONSTRAINT FORNECEDOR_FK_1 FOREIGN KEY(cnpjFornecedor)
		REFERENCES FORNECEDOR(cnpjFornecedor)
) engine = InnoDB auto_increment = 1;
-- 14
create table fornece (
	cnpjFornecedor bigint(14) not null,
    idProduto int not null,
    
    CONSTRAINT FORNECEDOR_FK_2 FOREIGN KEY(cnpjFornecedor)
		REFERENCES FORNECEDOR(cnpjFornecedor),
    CONSTRAINT PRODUTO_FORNECEDOR_F_FK  FOREIGN KEY (idProduto) 
		REFERENCES PRODUTO_FORNECEDOR(idProduto)
)engine = InnoDB;
-- 15
CREATE TABLE NOTA (
    idNota INT NOT NULL AUTO_INCREMENT,
    valorNota DECIMAL(6 , 2 ) NOT NULL,
    cnpjFornecedor BIGINT(14) NOT NULL,
    CONSTRAINT NOTA_PK PRIMARY KEY (idNota),
    CONSTRAINT FORNECEDOR_N_FK FOREIGN KEY (cnpjFornecedor)
        REFERENCES FORNECEDOR (cnpjFornecedor)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 16
CREATE TABLE FUNCIONARIO ( 
    idFuncionario INT NOT NULL AUTO_INCREMENT,
    cpfFuncionario BIGINT(11) NOT NULL,
    nomeFuncionario VARCHAR(50) NOT NULL,
    funcao VARCHAR(20) NOT NULL,
    dtNascimentoFuncionario DATE NOT NULL,
    CONSTRAINT CPF_FUNCIONARIO_UK UNIQUE (cpfFuncionario),
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (idFuncionario)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 17
CREATE TABLE trabalha ( 
    idFuncionario INT NOT NULL,
    idEvento INT NOT NULL,
    CONSTRAINT FUNCIONARIO_T_FK FOREIGN KEY (idFuncionario)
        REFERENCES FUNCIONARIO (idFuncionario),
    CONSTRAINT EVENTO_T_FK FOREIGN KEY (idEvento)
        REFERENCES EVENTO (idEvento)
)  ENGINE=INNODB;
-- 18
CREATE TABLE telefoneFuncionario ( 
    telefoneFuncionario VARCHAR(16),
    idFuncionario INT NOT NULL,
    CONSTRAINT telefoneFuncionario_PK PRIMARY KEY (telefoneFuncionario),
    CONSTRAINT FUNCIONARIO_FK FOREIGN KEY (idFuncionario)
        REFERENCES FUNCIONARIO (idFuncionario)
)  ENGINE=INNODB;
-- 19
CREATE TABLE FICHADO (
    ctps BIGINT(11) NOT NULL,
    rg INT(7) NOT NULL,
    certidaoNascimento VARCHAR(40) NOT NULL,
    tituloEleitor BIGINT(12) NOT NULL,
    cartaoVacina BIGINT(15) NOT NULL,
    escolaridade VARCHAR(20) NOT NULL,
    salario INT(10) NOT NULL,
    idFuncionario INT NOT NULL,
    CONSTRAINT FICHADO_PK PRIMARY KEY (ctps),
    CONSTRAINT FICHADO_UK UNIQUE KEY (rg),
    CONSTRAINT FUNCIONARIO_FICHADO_FK FOREIGN KEY (idFuncionario)
        REFERENCES FUNCIONARIO (idFuncionario)
)  ENGINE=INNODB;
-- 20
CREATE TABLE DADOBANCARIO (  
    idDadoBanco INT NOT NULL AUTO_INCREMENT,
    conta BIGINT(10) NOT NULL,
    agencia BIGINT(12) NOT NULL,
    codigoBanco INT(3) NOT NULL,
    tipoConta VARCHAR(20) NOT NULL,
    ctps BIGINT(11),
    cnpjFornecedor BIGINT(14),
    CONSTRAINT DADOBANCARIO_PK PRIMARY KEY (idDadoBanco),
    CONSTRAINT CTPS_FK_1 FOREIGN KEY (ctps)
        REFERENCES FICHADO (ctps),
    CONSTRAINT CNPJFORNECEDOR_FK_1 FOREIGN KEY (cnpjFornecedor)
        REFERENCES FORNECEDOR (cnpjFornecedor)
);
-- 21
CREATE TABLE FREELANCER ( 
    idFreelancer INT NOT NULL AUTO_INCREMENT,
    valorDiaria INT(10) NOT NULL,
    ranking INT(1) NOT NULL,
    idFuncionario INT NOT NULL,
    cpfIndicacao BIGINT(11),
    CONSTRAINT FREELANCER_PK PRIMARY KEY (idFreelancer),
    CONSTRAINT FUNCIONARIO_FREELANCER_FK FOREIGN KEY (idFuncionario)
        REFERENCES FUNCIONARIO (idFuncionario)
)  ENGINE=INNODB AUTO_INCREMENT=1;
-- 22
CREATE TABLE DISPDIA_SEMANA(  
	idData INT NOT NULL AUTO_INCREMENT,
    segunda ENUM('SIM', 'NAO') NOT NULL,
    terca ENUM('SIM', 'NAO') NOT NULL,
    quarta ENUM('SIM', 'NAO') NOT NULL,
    quinta ENUM('SIM', 'NAO') NOT NULL,
    sexta ENUM('SIM', 'NAO') NOT NULL,
    sabado ENUM('SIM', 'NAO') NOT NULL,
    domingo ENUM('SIM', 'NAO') NOT NULL,
    idFreelancer INT NOT NULL,
    CONSTRAINT DISPDIA_SEMANA_PK PRIMARY KEY (idData),
    CONSTRAINT FREE_LANCER_FK FOREIGN KEY(idFreelancer)
		REFERENCES FREELANCER(idFreelancer)
);
-- 23
CREATE TABLE disponibiliza(

	idData INT NOT NULL,
    idFuncionario  INT NOT NULL,
    idFreelancer INT NOT NULL,
    CONSTRAINT DISPDIA_SEMANA_PK FOREIGN KEY(idData)
		REFERENCES DISPDIA_SEMANA(idData),
	CONSTRAINT FREELANCER_FK FOREIGN KEY(idFreelancer)
		REFERENCES FREELANCER(idFreelancer)
);
-- 24
CREATE TABLE DISPLOCAL ( 
    idDispLocal INT NOT NULL AUTO_INCREMENT,
    cidadeSatelite VARCHAR(30) NOT NULL,
    idFreeLancer INT NOT NULL,
    CONSTRAINT DISPLOCAL_PK PRIMARY KEY (idDispLocal),
    CONSTRAINT FREELANCER_3 FOREIGN KEY(idFreelancer)
		REFERENCES FREELANCER(idFreeLancer)
)  ENGINE=INNODB AUTO_INCREMENT=1;

-- 25
CREATE TABLE ITEM_DECORACAO( 
	idDecoracao INT NOT NULL AUTO_INCREMENT,
    tipoDecoracao VARCHAR(30) NOT NULL,
    nomeDecoracao VARCHAR(30) NOT NULL,
    valorDecoracao INT(4) NOT NULL,
    CONSTRAINT ITEM_DECORACAO_PK PRIMARY KEY(idDecoracao)
);
-- 26
CREATE TABLE decora( 
	idDecoracao INT NOT NULL,
    idSalao INT NOT NULL,
    qtdDecoracao INT(3) NOT NULL,
    CONSTRAINT DECORACAO_FK FOREIGN KEY(idDecoracao)
		REFERENCES ITEM_DECORACAO(idDecoracao),
	CONSTRAINT SALAO_FK FOREIGN KEY(idSalao)
		REFERENCES SALAO(idSalao)
);
-- 27
create table possui ( 
	idDispLocal int not null,
    idFreelancer int not null,
    
    constraint DISPLOCAL_FK foreign key (idDispLocal) references DISPLOCAL(idDispLocal),
    constraint FREELANCER_p_FK foreign key (idFreelancer) references FREELANCER(idFreelancer)
)engine = InnoDB;
-- 28
create table abastece (
	cnpjFornecedor bigint(14) not null,
    idBuffet int not null,
    qtdProduto bigint(20) not null,
    
    constraint FORNECEDOR_A_FK foreign key (cnpjFornecedor) references FORNECEDOR(cnpjFornecedor),
    constraint BUFFET_A_FK foreign key (idBuffet) references BUFFET(idBuffet)
)engine = InnoDB;

create	table ENDERECO (
	idEndereco int not null auto_increment,
    cidade varchar(20) not null,
    bairro varchar(30) not null,
    rua varchar(30) not null,
    numero int(5) not null,
    cep int(8) not null,
    idEvento int,
    idCliente int,
    cnpjFornecedor BIGINT(14),
    
    constraint ENDERECO_PK primary key (idEndereco),
    constraint EVENTO_E_FK foreign key (idEvento) references EVENTO(idEvento),
    constraint CLIENTE_E_FK foreign key (idCliente) references CLIENTE (idCliente),
    CONSTRAINT CNPJ_FORNECEDOR_FK_2 FOREIGN KEY(cnpjFornecedor)
		REFERENCES FORNECEDOR(cnpjFornecedor)
) engine = InnoDB auto_increment = 1;

