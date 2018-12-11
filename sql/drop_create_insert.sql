/* drop */
DROP TABLE IF EXISTS CIDADE CASCADE;
DROP TABLE IF EXISTS BAIRRO CASCADE;
DROP TABLE IF EXISTS LOGRADOURO CASCADE;
DROP TABLE IF EXISTS PONTO CASCADE;
DROP TABLE IF EXISTS TIPO_HORARIO  CASCADE;
DROP TABLE IF EXISTS LINHA CASCADE;
DROP TABLE IF EXISTS HORARIO CASCADE;
DROP TABLE IF EXISTS ITINERARIO CASCADE;
DROP TABLE IF EXISTS ITINERARIO_PONTO CASCADE;
DROP TABLE IF EXISTS USUARIO CASCADE;
DROP TABLE IF EXISTS CARTAO CASCADE;
DROP TABLE IF EXISTS PASSAGEM CASCADE;
DROP TABLE IF EXISTS PAGAMENTO CASCADE;

/* criacao de estruturas */
CREATE TABLE USUARIO (
    id_usuario smallserial PRIMARY KEY,
    numero_cartao char(16),
    id_logradouro smallserial,
    saldo money,
    email varchar(100),
    senha varchar(64),
    nascimento date,
    cpf char(11),
    nome varchar(150)
);

CREATE TABLE LOGRADOURO (
    id_logradouro smallserial PRIMARY KEY,
    id_bairro smallserial,
    cep char(8),
    desc_logradouro varchar(150),
    desc_tipo varchar(20)
);

CREATE TABLE BAIRRO (
    id_bairro smallserial PRIMARY KEY,
    id_cidade smallserial,
    desc_bairro varchar(150)
);

CREATE TABLE CIDADE (
    id_cidade smallserial PRIMARY KEY,
    desc_cidade varchar(150)
);

CREATE TABLE LINHA (
    numero_linha smallserial PRIMARY KEY,
    desc_linha varchar(100)
);

CREATE TABLE HORARIO (
    id_horario smallserial PRIMARY KEY,
    id_itinerario smallserial,
    id_tipo smallserial,
    data_inicio date,
    hora_saida time,
    desc_terminal varchar(150)
);

CREATE TABLE TIPO_HORARIO (
    id_tipo smallserial PRIMARY KEY,
    desc_horario varchar(30)
);

CREATE TABLE CARTAO (
    numero char(16) PRIMARY KEY,
    id_usuario smallserial,
    titular varchar(150),
    validade char(7)
);

CREATE TABLE ITINERARIO (
    id_itinerario smallserial PRIMARY KEY,
    numero_linha smallserial,
    destino varchar(50),
    sentido char(1)
);

CREATE TABLE PAGAMENTO (
    id_pagamento serial PRIMARY KEY,
    numero_cartao char(16),
    id_usuario smallserial,
    valor_pagamento decimal,
    data_pagamento date
);

CREATE TABLE PASSAGEM (
    id_passagem smallserial PRIMARY KEY,
    id_usuario smallserial,
    numero_linha smallserial,
    data date,
    hora time,
    valor money
);

CREATE TABLE PONTO (
    id_ponto smallserial PRIMARY KEY,
    id_logradouro smallserial,
    longitude decimal,
    latitude decimal
);

CREATE TABLE ITINERARIO_PONTO (
    id_intin_ponto smallserial PRIMARY KEY,
    id_itinerario smallserial,
    id_ponto smallserial,
    pos_sequencia integer
);
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_2
    FOREIGN KEY (numero_cartao)
    REFERENCES CARTAO (numero);
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_3
    FOREIGN KEY (id_logradouro)
    REFERENCES LOGRADOURO (id_logradouro);
 
ALTER TABLE LOGRADOURO ADD CONSTRAINT FK_LOGRADOURO_2
    FOREIGN KEY (id_bairro)
    REFERENCES BAIRRO (id_bairro);
 
ALTER TABLE BAIRRO ADD CONSTRAINT FK_BAIRRO_2
    FOREIGN KEY (id_cidade)
    REFERENCES CIDADE (id_cidade);
 
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_2
    FOREIGN KEY (id_itinerario)
    REFERENCES ITINERARIO (id_itinerario);
 
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_3
    FOREIGN KEY (id_tipo)
    REFERENCES TIPO_HORARIO (id_tipo);
 
ALTER TABLE CARTAO ADD CONSTRAINT FK_CARTAO_2
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario);
 
ALTER TABLE ITINERARIO ADD CONSTRAINT FK_ITINERARIO_2
    FOREIGN KEY (numero_linha)
    REFERENCES LINHA (numero_linha);
 
ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_2
    FOREIGN KEY (numero_cartao)
    REFERENCES CARTAO (numero);
 
ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_3
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario);
 
ALTER TABLE PASSAGEM ADD CONSTRAINT FK_PASSAGEM_2
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario);
 
ALTER TABLE PASSAGEM ADD CONSTRAINT FK_PASSAGEM_3
    FOREIGN KEY (numero_linha)
    REFERENCES LINHA (numero_linha);
 
ALTER TABLE PONTO ADD CONSTRAINT FK_PONTO_1
    FOREIGN KEY (id_logradouro)
    REFERENCES LOGRADOURO (id_logradouro);
 
ALTER TABLE ITINERARIO_PONTO ADD CONSTRAINT FK_ITINERARIO_PONTO_1
    FOREIGN KEY (id_itinerario)
    REFERENCES ITINERARIO (id_itinerario);
 
ALTER TABLE ITINERARIO_PONTO ADD CONSTRAINT FK_ITINERARIO_PONTO_2
    FOREIGN KEY (id_ponto)
    REFERENCES PONTO (id_ponto);



---- Insercao de dados ----

/* cidade */
INSERT INTO CIDADE (id_cidade, desc_cidade)
    VALUES(1,'Vila Velha'),
    (2,'Vitoria'),
    (3,'Serra'),
    (4,'Cariacica'),
    (5,'Linhares'),
    (6,'Guarapari'),
    (7,'Aracruz'),
    (8,'Itapemirim'),
    (9,'Colatina'),
    (10,'Fundão');

/* bairro */
INSERT INTO BAIRRO (id_bairro, desc_bairro, id_cidade)
    VALUES(1,'Itapuã',1),
    (2,'Praia da Costa',1),
    (3,'Jardim da Penha',2),
    (4,'Praia do Canto',2),
    (5,'Jardim Camburi',2),
    (6,'Itaparica',1),
    (7,'Laranjeiras',3),
    (8,'Planalto Serrano',3),
    (9,'Itaquari',4),
    (10,'Campo Grande',4),
    (11,'Manguinhos',3),
    (12,'Morada de Laranjeiras',3),
    (13,'Laranjeiras II',3),
    (14,'Colina de Laranjeiras',3),
    (15,'Parque Res. Laranjeiras',3);


/* logradouro */
INSERT INTO LOGRADOURO (id_logradouro, cep, desc_tipo, desc_logradouro, id_bairro)
    VALUES(1,'29146440','Rua','Curitiba',1),
    (2,'29465824','Avenida','São Paulo',2),
    (3,'29753159','Avenida','Hugo Musso',2),
    (4,'29123456','Rua','Amoreira',1),
    (5,'29456123','Avenida','Nossa Senhora Da Penha',4),
    (6,'29234567','Avenida','Rio Branco',4),
    (7,'29200485','Rua','Três',7),
    (8,'29001407','Rua','Ayrton Senna',7),
    (9,'29582471','Rua','Humberto Pereira',6),
    (10,'29269962','Travessa','Belina',10),
    (11,'29173087','Rua','Ifes',11),
    (12,'29166933','Avenida','Paulo Pereira Gomes',12),
    (13,'29165915','Rua','Trevo de Laranjeiras II',13),
    (14,'29165777','Rua','A2',12),
    (15,'29169000','Avenida','Civit',7),
    (16,'29172123','Rodovia','Norte/Sul',14),
    (17,'29165680','Avenida','Eudes Scherrer de Souza',15);

/* ponto */
INSERT INTO PONTO (id_ponto,id_logradouro,longitude, latitude)
    VALUES(1, 5, -20.28880,-40.30392),
    (2, 5, -20.28918,-40.30349),
    (3, 5, -20.29302,-40.30220),
    (4, 5, -20.29361,-40.30167),
    (5, 5, -20.29537,-40.30115),
    (6, 5, -20.29698,-40.30051),
    (7, 5, -20.29821,-40.30000),
    (8, 5, -20.29897,-40.29951),
    (9, 5, -20.30258,-40.29828),
    (10, 5, -20.30220,-40.29821);

/* tipo_horario */
INSERT INTO TIPO_HORARIO (id_tipo, desc_horario)
    VALUES(1,'DIAS ÚTEIS'),
    (2,'SÁBADOS'),
    (3,'DOMINGOS E FERIADOS'),
    (4,'ATÍPICOS ENTRE FERIADOS');

/* linha */
INSERT INTO LINHA (numero_linha, desc_linha)
    VALUES(815,'IFES / T.LARANJEIRAS'),
    (507,'T.LARANJEIRAS / T.IBES VIA 3ª PONTE/RETA DA PENHA'),
    (650,'T.VILA VELHA/T.IBES VIA PRAIA DE ITAPOÃ'),
    (611,'T.ITAPARICA/PRAIA DA COSTA VIA ITAPOÃ/CREFES'),
    (662,'T.VILA VELHA/PRAIA DA COSTA VIA CREFES - CIRCULAR'),
    (508,'T.LARANJEIRAS/T.ITAPARICA VIA T.VILA VELHA/3ª PONTE/CAMBURI'),
    (551,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE'),
    (501,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE/T.VILA VELHA'),
    (560,'T.LARANJEIRAS/T.ITAPARICA VIA CAMBURI/3ª PONTE'),
    (520,'T.CARAPINA/T.VILA VELHA VIA RETA DA PENHA/3ª PONTE');

/* itinerario */
INSERT INTO ITINERARIO (id_itinerario, numero_linha, destino, sentido)
    VALUES (1, 507, 'T.LARANJEIRAS',1),
    (2, 507, 'T.IBES',2),
    (3, 815, 'IFES',1),
    (4, 815, 'T.LARANJEIRAS',2),
    (5, 611, 'T.ITAPARICA',1),
    (6, 611, 'PRAIA DA COSTA',2),
    (7, 662, 'T.VILA VELHA',1),
    (8, 662, 'PRAIA DA COSTA',2),
    (9, 501, 'T.JACARAIPE',1),
    (10, 501, 'T.ITAPARICA',2),
    (11, 508, 'T.LARANJEIRAS',1),
    (12, 508, 'T.ITAPARICA',2),
    (13, 551, 'T.JACARAIPE',1),
    (14, 551, 'T.ITAPARICA',2),
    (15, 560, 'T.LARANJEIRAS',1),
    (16, 560, 'T.ITAPARICA',2),
    (17, 520, 'T.CARAPINA',1),
    (18, 520, 'T.VILA VELHA',2);

/* horario */
/* 815 */
INSERT INTO HORARIO (id_horario, hora_saida, id_tipo , data_inicio, id_itinerario, desc_terminal)
    VALUES(1,'05:30:00',1,'2017-05-28',3,'IFES'),
    (2,'05:54:00',1,'2017-05-28',3,'IFES'),
    (3,'06:05:00',1,'2017-05-28',3,'IFES'),
    (4,'06:43:00',1,'2017-05-28',3,'IFES'),
    (5,'06:55:00',1,'2017-05-28',3,'IFES'),
    (6,'07:17:00',1,'2017-05-28',3,'IFES'),
    (7,'07:32:00',1,'2017-05-28',3,'IFES'),
    (8,'07:51:00',1,'2017-05-28',3,'IFES'),
    (9,'08:05:00',1,'2017-05-28',3,'IFES'),
    (10,'08:30:00',1,'2017-05-28',3,'IFES'),
    (11,'08:50:00',1,'2017-05-28',3,'IFES'),
    (12,'11:55:00',1,'2017-05-28',3,'IFES'),
    (13,'12:30:00',1,'2017-05-28',3,'IFES'),
    (14,'13:10:00',1,'2017-05-28',3,'IFES'),
    (15,'15:24:00',1,'2017-05-28',3,'IFES'),
    (16,'15:42:00',1,'2017-05-28',3,'IFES'),
    (17,'15:59:00',1,'2017-05-28',3,'IFES'),
    (18,'16:17:00',1,'2017-05-28',3,'IFES'),
    (19,'16:34:00',1,'2017-05-28',3,'IFES'),
    (20,'16:51:00',1,'2017-05-28',3,'IFES'),
    (21,'17:00:00',1,'2017-05-28',3,'IFES'),
    (22,'17:08:00',1,'2017-05-28',3,'IFES'),
    (23,'17:25:00',1,'2017-05-28',3,'IFES'),
    (24,'17:42:00',1,'2017-05-28',3,'IFES'),
    (25,'17:59:00',1,'2017-05-28',3,'IFES'),
    (26,'18:16:00',1,'2017-05-28',3,'IFES'),
    (27,'18:33:00',1,'2017-05-28',3,'IFES'),
    (28,'18:55:00',1,'2017-05-28',3,'IFES'),
    (29,'19:10:00',1,'2017-05-28',3,'IFES'),
    (30,'21:50:00',1,'2017-05-28',3,'IFES'),
    (31,'22:10:00',1,'2017-05-28',3,'IFES'),
    (32,'06:28:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (33,'06:40:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (34,'07:00:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (35,'07:17:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (36,'07:34:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (37,'07:48:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (38,'08:10:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (39,'08:30:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (40,'11:30:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (41,'12:10:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (42,'12:50:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (43,'15:07:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (44,'15:24:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (45,'15:42:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (46,'15:49:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (47,'16:17:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (48,'16:34:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (49,'16:51:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (50,'17:08:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (51,'17:25:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (52,'17:42:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (53,'17:59:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (54,'18:16:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (55,'18:33:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (56,'18:51:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS'),
    (57,'21:10:00',1,'2017-05-28',4,'TERMINAL LARANJEIRAS');
    
    

/* 507 */
INSERT INTO HORARIO (id_horario, hora_saida, id_tipo , data_inicio, id_itinerario, desc_terminal)
    VALUES(101,'05:00:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (102,'05:20:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (103,'05:35:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (104,'05:45:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (105,'06:04:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (106,'06:13:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (107,'06:22:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (108,'06:31:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (109,'06:40:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (110,'06:49:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (111,'06:58:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (112,'07:07:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (113,'07:17:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (114,'07:27:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (115,'07:37:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (116,'07:48:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (117,'08:00:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (118,'08:17:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (119,'08:34:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (120,'08:52:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (121,'09:10:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (122,'09:30:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (123,'09:50:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (124,'10:10:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (127,'10:30:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (128,'10:50:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (129,'11:10:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (130,'11:25:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (131,'11:40:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (132,'11:55:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (133,'12:10:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (134,'12:25:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (135,'12:40:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (136,'12:55:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (137,'13:10:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (138,'13:25:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (139,'13:45:00',1,'2017-10-15',1,'TERMINAL LARANJEIRAS'),
    (140,'11:50:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (141,'12:05:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (142,'12:20:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (143,'12:35:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (144,'12:50:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (145,'13:05:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (146,'13:25:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (147,'13:45:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (148,'14:05:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (149,'14:25:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (150,'14:45:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (151,'15:00:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (152,'15:13:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (153,'15:26:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (154,'15:39:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (155,'15:52:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (156,'16:05:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (157,'16:17:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (158,'16:29:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (159,'16:41:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (160,'16:29:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (161,'16:41:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (162,'16:53:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (163,'17:05:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (164,'17:17:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (165,'17:29:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (166,'17:42:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (167,'17:55:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (168,'18:15:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (169,'18:35:00',1,'2017-10-15',2,'TERMINAL IBES'),
    (170,'18:55:00',1,'2017-10-15',2,'TERMINAL IBES');

/* itinerario_ponto */
INSERT INTO ITINERARIO_PONTO (id_intin_ponto, id_itinerario, id_ponto, pos_sequencia)
    VALUES (1, 1, 1, 15),
    (2, 1, 3, 16),
    (3, 1, 5, 17),
    (4, 1, 7, 18),
    (5, 1, 9, 19),
    (6, 9, 2, 9),
    (7, 9, 4, 10),
    (8, 9, 6, 11),
    (9, 9, 8, 12),
    (10, 9, 10, 13);

/* usuario */
INSERT INTO USUARIO (id_usuario, cpf, nome, nascimento, email, senha, id_logradouro, saldo)
    VALUES(1,'11122233344','Joao da Silva','1992-12-20','joaodasilva@yahoo.com.br','a1b2c3d4','1', 12.80),
    (2,'11199988822','Jadson Teco','1996-10-10','jadteco@gmail.com','teco78910','2', 13.04),
    (3,'22233344455','Antonio Santos','1988-10-20','antoniosantos@hotmail.com','123456','3', 17.17),
    (4,'12332145690','Amaro Neto','1982-07-01','amaroneto@gmail.com','abc123456','7', 18.81),
    (5,'12345612399','Natalia Vieira','1997-11-17','nataliavieira@gmail.com','aaa123bbb','10', 14.07),
    (6,'11111122288','Izabela Felix','1995-04-23','izabelafelix@gmail.com','abcd9182','4', 07.14),
    (7,'22211144477','Gabriel Fernandes','1994-05-11','gabrielfernandes@hotmail.com','lalala721','9', 21.05),
    (8,'78945612300','Diego Bolsoni','1993-01-04','diegobolsoni@yahoo.com.br','diego123456','8', 13.73),
    (9,'44412344466','Ingrid Brum','1998-10-21','ingridbrum@gmail.com','brum010203','5', 14.50),
    (10,'98788455611','Carolina Uliana','1997-06-18','caroluliana@hotmail.com','carol78690','6', 3.40);

/* cartao */
INSERT INTO CARTAO (numero, titular, validade, id_usuario)
    VALUES('1111222233330000','Joao da Silva','06/2020', 1),
    ('1111222233331111','Jadson Teco','07/2019', 2),
    ('1111222233332222','Antonio Santos','07/2021', 3),
    ('1111222233333333','Amaro Neto','03/2024', 4),
    ('1111222233334444','Natalia Vieira','06/2021', 5),
    ('1111222233335555','Izabela Felix','04/2023', 6),
    ('1111222233336666','Gabriel Fernandes','05/2022', 7),
    ('1111222233337777','Diego Bolsoni','03/2020', 8),
    ('1111222233338888','Ingrid Brum','08/2024', 9),
    ('1111222233339999','Carolina Uliana','08/2022', 10);

/*update usuario com número do cartão*/
UPDATE USUARIO SET numero_cartao='1111222233330000' WHERE id_usuario=1;
UPDATE USUARIO SET numero_cartao='1111222233331111' WHERE id_usuario=2;
UPDATE USUARIO SET numero_cartao='1111222233332222' WHERE id_usuario=3;
UPDATE USUARIO SET numero_cartao='1111222233333333' WHERE id_usuario=4;
UPDATE USUARIO SET numero_cartao='1111222233334444' WHERE id_usuario=5;
UPDATE USUARIO SET numero_cartao='1111222233335555' WHERE id_usuario=6;
UPDATE USUARIO SET numero_cartao='1111222233336666' WHERE id_usuario=7;
UPDATE USUARIO SET numero_cartao='1111222233337777' WHERE id_usuario=8;
UPDATE USUARIO SET numero_cartao='1111222233338888' WHERE id_usuario=9;
UPDATE USUARIO SET numero_cartao='1111222233339999' WHERE id_usuario=10;

/* pagamento */
INSERT INTO PAGAMENTO (id_pagamento,numero_cartao, id_usuario, valor_pagamento, data_pagamento)
    VALUES(1,'1111222233332222',3,100.00,'2018-01-08' ),
    (2,'1111222233332222',3,100.00,'2018-02-08' ),
    (3,'1111222233332222',3,100.00,'2018-03-08' ),
    (4,'1111222233332222',3,100.00,'2018-04-08' ),
    (5,'1111222233332222',3,100.00,'2018-05-08' ),
    (6,'1111222233332222',3,100.00,'2018-06-08' ),
    (7,'1111222233332222',3,100.00,'2018-07-08' ),
    (8,'1111222233332222',3,100.00,'2018-08-08' ),
    (9,'1111222233332222',3,100.00,'2018-09-08' ),
    (10,'1111222233332222',3,100.00,'2018-10-08' );

/* passagem */
INSERT INTO PASSAGEM (id_passagem, id_usuario, numero_linha, data, hora, valor)
    VALUES(1,3,815,'2018-10-08','07:30:00', 3.40),
    (2,3,815,'2018-10-08','12:00:00', 3.40),
    (3,3,815,'2018-10-09','07:30:00', 3.40),
    (4,3,815,'2018-10-09','12:00:00', 3.40),
    (5,3,815,'2018-10-10','07:30:00', 3.40),
    (6,3,815,'2018-10-10','12:00:00', 3.40),
    (7,3,815,'2018-10-11','07:30:00', 3.40),
    (8,3,815,'2018-10-11','12:00:00', 3.40),
    (9,3,815,'2018-10-12','07:30:00', 3.40),
    (10,3,815,'2018-10-12','12:00:00', 3.40),
    (11,3,507,'2018-10-15','12:30:00', 3.40),
    (12,3,507,'2018-10-15','18:00:00', 3.40),
    (13,3,507,'2018-10-16','12:30:00', 3.40),
    (14,3,507,'2018-10-16','18:00:00', 3.40),
    (15,3,507,'2018-10-17','12:30:00', 3.40),
    (16,3,507,'2018-10-17','18:00:00', 3.40),
    (17,3,507,'2018-10-18','12:30:00', 3.40),
    (18,3,507,'2018-10-18','18:00:00', 3.40),
    (19,3,507,'2018-10-19','12:30:00', 3.40),
    (20,3,507,'2018-10-19','18:00:00', 3.40);

