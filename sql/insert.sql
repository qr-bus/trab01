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
    (10,'Campo Grande',4);


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
    (10,'29269962','Travessa','Belina',10);

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
INSERT INTO LINHA (numero_linha, desc_linha, sentido)
    VALUES(815,'IFES / T. LARANJEIRAS',1),
    (507,'T. LARANJEIRAS / T. IBES VIA 3ª PONTE/RETA DA PENHA',2),
    (650,'T.VILA VELHA/T.IBES VIA PRAIA DE ITAPOÃ',1),
    (611,'T.ITAPARICA/PRAIA DA COSTA VIA ITAPOÃ/CREFES',1),
    (662,'T.VILA VELHA/PRAIA DA COSTA VIA CREFES - CIRCULAR',2),
    (508,'T.LARANJEIRAS/T.ITAPARICA VIA T.VILA VELHA/3ª PONTE/CAMBURI',2),
    (551,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE',1),
    (501,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE/T.VILA VELHA',1),
    (560,'T.LARANJEIRAS/T.ITAPARICA VIA CAMBURI/3ª PONTE',2),
    (520,'T.CARAPINA/T.VILA VELHA VIA RETA DA PENHA/3ª PONTE',1);

/* horario */
/* 815 */
INSERT INTO HORARIO (id_horario, hora_saida, id_tipo , data_inicio, numero_linha, desc_terminal)
    VALUES(1,'05:30:00',1,'2017-05-28',815,'IFES'),
    (2,'05:54:00',1,'2017-05-28',815,'IFES'),
    (3,'06:05:00',1,'2017-05-28',815,'IFES'),
    (4,'06:43:00',1,'2017-05-28',815,'IFES'),
    (5,'06:55:00',1,'2017-05-28',815,'IFES'),
    (6,'07:17:00',1,'2017-05-28',815,'IFES'),
    (7,'07:32:00',1,'2017-05-28',815,'IFES'),
    (8,'07:51:00',1,'2017-05-28',815,'IFES'),
    (9,'08:05:00',1,'2017-05-28',815,'IFES'),
    (10,'08:30:00',1,'2017-05-28',815,'IFES'),
    (11,'08:50:00',1,'2017-05-28',815,'IFES'),
    (12,'11:55:00',1,'2017-05-28',815,'IFES'),
    (13,'12:30:00',1,'2017-05-28',815,'IFES'),
    (14,'13:10:00',1,'2017-05-28',815,'IFES'),
    (15,'15:24:00',1,'2017-05-28',815,'IFES'),
    (16,'15:42:00',1,'2017-05-28',815,'IFES'),
    (17,'15:59:00',1,'2017-05-28',815,'IFES'),
    (18,'16:17:00',1,'2017-05-28',815,'IFES'),
    (19,'16:34:00',1,'2017-05-28',815,'IFES'),
    (20,'16:51:00',1,'2017-05-28',815,'IFES'),
    (21,'17:00:00',1,'2017-05-28',815,'IFES'),
    (22,'17:08:00',1,'2017-05-28',815,'IFES'),
    (23,'17:25:00',1,'2017-05-28',815,'IFES'),
    (24,'17:42:00',1,'2017-05-28',815,'IFES'),
    (25,'17:59:00',1,'2017-05-28',815,'IFES'),
    (26,'18:16:00',1,'2017-05-28',815,'IFES'),
    (27,'18:33:00',1,'2017-05-28',815,'IFES'),
    (28,'18:55:00',1,'2017-05-28',815,'IFES'),
    (29,'19:10:00',1,'2017-05-28',815,'IFES'),
    (30,'21:50:00',1,'2017-05-28',815,'IFES'),
    (31,'22:10:00',1,'2017-05-28',815,'IFES');
/* 507 */
INSERT INTO HORARIO (id_horario, hora_saida, id_tipo , data_inicio, numero_linha, desc_terminal)
    VALUES(41,'05:00:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (42,'05:20:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (43,'05:35:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (44,'05:45:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (45,'06:04:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (46,'06:13:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (47,'06:22:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (48,'06:31:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (49,'06:40:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (50,'06:49:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (51,'06:58:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (52,'07:07:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (53,'07:17:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (54,'07:27:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (55,'07:37:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (56,'07:48:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (57,'08:00:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (58,'08:17:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (59,'08:34:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (60,'08:52:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (61,'09:10:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (62,'09:30:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (63,'09:50:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (64,'10:10:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS');

/* itinerario */
INSERT INTO ITINERARIO (id_itinerario, numero_linha)
    VALUES (1, 507),
    (2, 507),
    (3, 815),
    (4, 815),
    (5, 611),
    (6, 611),
    (7, 662),
    (8, 662),
    (9, 501),
    (10, 501),
    (11, 508),
    (12, 508),
    (13, 551),
    (14, 551),
    (15, 560),
    (16, 560),
    (17, 520),
    (18, 520);

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
INSERT INTO PAGAMENTO (id_pagamento,numero_cartao, valor_pagamento, data_pagamento)
    VALUES(1,'1111222233332222',100.00,'2018-01-08' ),
    (2,'1111222233332222',100.00,'2018-02-08' ),
    (3,'1111222233332222',100.00,'2018-03-08' ),
    (4,'1111222233332222',100.00,'2018-04-08' ),
    (5,'1111222233332222',100.00,'2018-05-08' ),
    (6,'1111222233332222',100.00,'2018-06-08' ),
    (7,'1111222233332222',100.00,'2018-07-08' ),
    (8,'1111222233332222',100.00,'2018-08-08' ),
    (9,'1111222233332222',100.00,'2018-09-08' ),
    (10,'1111222233332222',100.00,'2018-10-08' );

/* passagem */
INSERT INTO PASSAGEM (id_passagem, id_usuario, numero_linha, id_pagamento, data, hora, valor)
    VALUES(1,3,815,10,'2018-10-08','07:30:00', 3.40),
    (2,3,815,10,'2018-10-08','12:00:00', 3.40),
    (3,3,815,10,'2018-10-09','07:30:00', 3.40),
    (4,3,815,10,'2018-10-09','12:00:00', 3.40),
    (5,3,815,10,'2018-10-10','07:30:00', 3.40),
    (6,3,815,10,'2018-10-10','12:00:00', 3.40),
    (7,3,815,10,'2018-10-11','07:30:00', 3.40),
    (8,3,815,10,'2018-10-11','12:00:00', 3.40),
    (9,3,815,10,'2018-10-12','07:30:00', 3.40),
    (10,3,815,10,'2018-10-12','12:00:00', 3.40);
