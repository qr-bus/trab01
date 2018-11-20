/* criacao de estruturas */
/* Modelo F�sico */

CREATE TABLE USUARIO (
    id_usuario smallserial PRIMARY KEY,
    numero_cartao char(16);
    id_logradouro smallserial,
    saldo money,
    email varchar(100),
    senha char(64),
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
    desc_linha varchar(100),
    sentido char(1)
);

CREATE TABLE HORARIO (
    id_horario smallserial PRIMARY KEY,
    numero_linha smallserial,
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
    validade date
);

CREATE TABLE ITINERARIO (
    id_itinerario smallserial PRIMARY KEY,
    numero_linha smallserial
);

CREATE TABLE PAGAMENTO (
    id_pagamento serial PRIMARY KEY,
    numero_cartao char(16),
    valor_pagamento decimal,
    data_pagamento date
);

CREATE TABLE PASSAGEM (
    id_passagem smallserial PRIMARY KEY,
    id_usuario smallserial,
    numero_linha smallserial,
    id_pagamento serial,
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


/* adicionar chaves estrangeiras */ 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_ 2
    FOREIGN KEY (numero_cartao)
    REFERENCES cartao(numero);
    

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
    FOREIGN KEY (numero_linha)
    REFERENCES LINHA (numero_linha);
 
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
 
ALTER TABLE PASSAGEM ADD CONSTRAINT FK_PASSAGEM_2
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario);
 
ALTER TABLE PASSAGEM ADD CONSTRAINT FK_PASSAGEM_3
    FOREIGN KEY (numero_linha)
    REFERENCES LINHA (numero_linha);
 
ALTER TABLE PASSAGEM ADD CONSTRAINT FK_PASSAGEM_4
    FOREIGN KEY (id_pagamento)
    REFERENCES PAGAMENTO (id_pagamento);
 
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

---- Insercao de dados ----

/* usuario */
INSERT INTO USUARIO (id_usuario, cpf, nome, nascimento, email, senha, id_logradouro, saldo, id_cartao)
    VALUES(1,'11122233344','Joao da Silva','1992-12-20','joaodasilva@yahoo.com.br','a1b2c3d4','1', 12.80,1),
    (2,'11199988822','Jadson Teco','1996-10-10','jadteco@gmail.com','teco78910','2', 13.04,2),
    (3,'22233344455','Antonio Santos','1988-10-20','antoniosantos@hotmail.com','123456','3', 17.17,3),
    (4,'12332145690','Amaro Neto','1982-07-01','amaroneto@gmail.com','abc123456','7', 18.81,4),
    (5,'12345612399','Natalia Vieira','1997-11-17','nataliavieira@gmail.com','aaa123bbb','10', 14.07,5),
    (6,'11111122288','Izabela Felix','1995-04-23','izabelafelix@gmail.com','abcd9182','4', 07.14,6),
    (7,'22211144477','Gabriel Fernandes','1994-05-11','gabrielfernandes@hotmail.com','lalala721','9', 21.05,7),
    (8,'78945612300','Diego Bolsoni','1993-01-04','diegobolsoni@yahoo.com.br','diego123456','8', 13.73,8),
    (9,'44412344466','Ingrid Brum','1998-10-21','ingridbrum@gmail.com','brum010203','5', 14.50,9),
    (10,'98788455611','Carolina Uliana','1997-06-18','caroluliana@hotmail.com','carol78690','6', 3.40,10);


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


/* linha */
INSERT INTO LINHA (numero_linha, desc_linha, sentido)
    VALUES(815,'IFES / T. LARANJEIRAS',1),
    (507,'T. LARANJEIRAS / T. IBES VIA 3� PONTE/RETA DA PENHA',2),
    (650,'T.VILA VELHA/T.IBES VIA PRAIA DE ITAPO�',1),
    (611,'T.ITAPARICA/PRAIA DA COSTA VIA ITAPO�/CREFES',1),
    (662,'T.VILA VELHA/PRAIA DA COSTA VIA CREFES - CIRCULAR',1),
    (508,'T.LARANJEIRAS/T.ITAPARICA VIA T.VILA VELHA/3� PONTE/CAMBURI',2),
    (551,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3� PONTE',1),
    (501,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3� PONTE/T.VILA VELHA',1),
    (560,'T.LARANJEIRAS/T.ITAPARICA VIA CAMBURI/3� PONTE',2),
    (520,'T.CARAPINA/T.VILA VELHA VIA RETA DA PENHA/3� PONTE',1);



INSERT INTO LINHA (numero_linha, desc_linha, sentido)
    VALUES(516,'T. IBES/ T. JACARAIPE',1);

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
    (10,'Fund�o');

/* bairro */
INSERT INTO BAIRRO (id_bairro, desc_bairro, id_cidade)
    VALUES(1,'Itapu�',1),
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
    (2,'29465824','Avenida','S�o Paulo',2),
    (3,'29753159','Avenida','Hugo Musso',2),
    (4,'29123456','Rua','Amoreira',1),
    (5,'29456123','Avenida','Nossa Senhora Da Penha',4),
    (6,'29234567','Avenida','Rio Branco',4),
    (7,'29200485','Rua','Tr�s',7),
    (8,'29001407','Rua','Ayrton Senna',7),
    (9,'29582471','Rua','Humberto Pereira',6),
    (10,'29269962','Travessa','Belina',10);


/* tipo_horario */
INSERT INTO TIPO_HORARIO (id_tipo, desc_horario)
    VALUES(1,'DIAS �TEIS'),
    (2,'S�BADOS'),
    (3,'DOMINGOS E FERIADOS'),
    (4,'AT�PICOS ENTRE FERIADOS');

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
    VALUES(55,'05:00:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (32,'05:20:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (33,'05:35:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (34,'05:45:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (35,'06:04:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (36,'06:13:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (37,'06:22:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (38,'06:31:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (39,'06:40:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (40,'06:49:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (41,'06:58:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (42,'07:07:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (43,'07:17:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (44,'07:27:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (45,'07:37:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (46,'07:48:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (47,'08:00:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (48,'08:17:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (49,'08:34:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (50,'08:52:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (51,'09:10:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (52,'09:30:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (53,'09:50:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS'),
    (54,'10:10:00',1,'2017-10-15',507,'TERMINAL LARANJEIRAS');
    
    
INSERT INTO HORARIO (id_horario, hora_saida, id_tipo , data_inicio, numero_linha, desc_terminal)
    VALUES
    (56,'05:20:00',1,'2017-01-13',516,'T. IBES'),
    (57,'05:35:00',1,'2017-01-13',516,'T. IBES'),
    (58,'05:45:00',1,'2017-01-13',516,'T. IBES'),
    (59,'06:04:00',1,'2017-01-13',516,'T. IBES'),
    (60,'06:13:00',1,'2017-01-13',516,'T. IBES'),
    (61,'06:22:00',1,'2017-01-13',516,'T. IBES'),
    (62,'06:31:00',1,'2017-01-13',516,'T. IBES'),
    (63,'06:40:00',1,'2017-01-13',516,'T. IBES'),
    (64,'06:49:00',1,'2017-01-13',516,'T. IBES'),
    (65,'06:58:00',1,'2017-01-13',516,'T. IBES'),
    (66,'07:07:00',1,'2017-01-13',516,'T. IBES'),
    (67,'07:17:00',1,'2017-01-13',516,'T. IBES'),
    (68,'07:27:00',1,'2017-01-13',516,'T. IBES'),
    (69,'07:37:00',1,'2017-01-13',516,'T. IBES'),
    (70,'07:48:00',1,'2017-01-13',516,'T. IBES'),
    (71,'08:00:00',1,'2017-01-13',516,'T. IBES'),
    (72,'08:17:00',1,'2017-01-13',516,'T. IBES'),
    (73,'08:34:00',1,'2017-01-13',516,'T. IBES'),
    (74,'08:52:00',1,'2017-01-13',516,'T. IBES'),
    (75,'09:10:00',1,'2017-01-13',516,'T. IBES'),
    (76,'09:30:00',1,'2017-01-13',516,'T. IBES'),
    (77,'09:50:00',1,'2017-01-13',516,'T. IBES'),
    (78,'10:10:00',1,'2017-01-13',516,'T. IBES');



/* itinerario */
INSERT INTO ITINERARIO (id_itinerario,numero_linha)
    VALUES (1, 507),
    (2, 520),
    (3, 560),
    (4, 508),
    (5, 551),
    (6, 650),
    (7, 815),
    (8, 650),
    (9, 611),
    (10, 815);
    
/* passagem 815 507 650 611 508 551 501 560 520*/
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
    

INSERT INTO PAGAMENTO (id_pagamento,numero_cartao, valor_pagamento, data_pagamento)
    VALUES(1,'1111222233332222',100.00,'2018-01-08' ),
    (2,'1111222233330000',100.00,'2018-02-08' ),
    (3,'1111222233334444',100.00,'2018-03-08' ),
    (4,'1111222233337777',100.00,'2018-04-08' ),
    (5,'1111222233339999',100.00,'2018-05-08' ),
    (6,'1111222233331111',100.00,'2018-06-08' ),
    (7,'1111222233336666',100.00,'2018-07-08' ),
    (8,'1111222233333333',100.00,'2018-08-08' ),
    (9,'1111222233335555',100.00,'2018-09-08' ),
    (10,'1111222233338888',100.00,'2018-10-08' );


    /*
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
    */

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
   

 /*
    
SELECT * FROM pagamento;

SELECT USUARIO.*, PAGAMENTO.numero_cartao
FROM  USUARIO LEFT OUTER JOIN
      PAGAMENTO ON Clientes.Id = Tabela1.IdCliente LEFT OUTER JOIN
      Tabela2 ON Clientes.Id = Tabela2.IdCliente LEFT OUTER JOIN
      Tabela3 ON Clientes.Id = Tabela3.IdCliente

Select *
from USUARIO
inner join
cartao on
(USUARIO.id_usuario = cartao.id_usuario);


SELECT desc_bairro FROM bairro WHERE ((id_cidade = 2) AND ( desc_bairro LIKE 'Jardim%'));SELECT * FROM linha;  
ALTER TABLE LINHA RENAME COLUMN desc_linha TO descricao_linha;
SELECT nome,email FROM usuario WHERE(id_usuario = 6);
UPDATE usuario
  SET email = 'ingridbrum@gmail.com'
  WHERE id_usuario = 9;
select * from usuario;
ALTER TABLE USUARIO add numero_cartao char(16);

  
UPDATE projeto set nome = 'Aguas limpas' where numero=25;
SELECT titular,validade FROM cartao WHERE((numero = '1111222233338888' ) OR (titular LIKE '%Fernandes') OR (titular LIKE 'A%'));    
UPDATE linha
  SET desc_linha = REPLACE (desc_linha, 'T. LARANJEIRAS / T. IBES VIA 3� PONTE/RETA DA PENHA','T.LARANJEIRAS / T. IBES VIA 3� PONTE/RETA DA PENHA')
  WHERE numero_linha = 507;
  
alter table linha replace(desc_linha,'T. LARANJEIRAS / T. IBES VIA 3� PONTE/RETA DA PENHA','T.LARANJEIRAS / T. IBES VIA 3� PONTE/RETA DA PENHA');
    
SELECT numero_linha FROM linha WHERE desc_linha LIKE 'T.LARANJEIRAS%' OR desc_linha LIKE '%T.ITAPARICA VIA T.CARAPINA%';    
SELECT desc_cidade FROM cidade where(id_cidade = 6);  
UPDATE cidade
  SET desc_cidade = 'Guarapari'
  WHERE id_cidade = 6;



SELECT (desc_tipo|| '. '||desc_logradouro) FROM logradouro WHERE ((id_bairro = 4) OR (id_bairro = 7))
SELECT hora_saida, numero_linha FROM horario WHERE ((hora_saida > '09:09:00') AND (NOT numero_linha = 815));
SELECT hora_saida, numero_linha FROM horario WHERE ((hora_saida > '09:09:00') AND (numero_linha = 507 OR  numero_linha = 516));

SELECT hora_saida, numero_linha FROM horario WHERE (hora_saida > '09:09:00' or  numero_linha = 507);
alter table pagamento add numero_cartao varchar(16);    
SELECT cartao.titular ,valor_pagamento,CAST((valor_pagamento / 3.40) AS DECIMAL(2,0)) AS numero_passagens
FROM PAGAMENTO INNER JOIN cartao ON (cartao.numero = '1111222233333333' OR cartao.numero = '1111222233338888' OR cartao.numero = '1111222233335555')
GROUP BY titular,valor_pagamento;

   
SELECT (valor_pagamento + 0.00) AS sobra
FROM PAGAMENTO INNER JOIN cartao ON (cartao.numero = '1111222233339999' OR cartao.numero = '1111222233338888')

    
SELECT numero_cartao,valor_pagamento,(valor_pagamento - 3.40) AS sobra
FROM PAGAMENTO WHERE (id_pagamento > 5 );

SELECT numero_cartao,valor_pagamento,(valor_pagamento / 3.40) AS numero_passagens
FROM PAGAMENTO WHERE (id_pagamento > 5 );
UPDATE PAGAMENTO
  SET valor_pagamento = REPLACE ( valor_pagamento , 200.00 , 100.00 )
  WHERE id_pagamento = 9;
  
UPDATE PAGAMENTO
  SET numero_cartao = REPLACE ( numero_cartao , '1111222233332222' , '1111222233336666' )
  WHERE id_pagamento = 7;
  
UPDATE PAGAMENTO
  SET numero_cartao = REPLACE ( numero_cartao , '1111222233332222' , '1111222233333333' )
  WHERE id_pagamento = 8;
  
  
UPDATE PAGAMENTO
  SET numero_cartao = REPLACE ( numero_cartao , '1111222233332222' , '1111222233330000' )
  WHERE id_pagamento = 2;
  
UPDATE PAGAMENTO
  SET numero_cartao = REPLACE ( numero_cartao , '1111222233332222' , '1111222233338888' )
  WHERE id_pagamento = 10;  

select * from pagamento inner join cartao on (pagamento.numero_cartao = cartao.numero);
                                              

select * from pagamento inner join usuario on 
 (select titular from cartao inner join pagamento on (pagamento.numero_cartao = cartao.numero)) = cartao.numero;

*/
