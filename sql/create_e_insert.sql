/* criacao de estruturas */
create table if not exists usuario (
	usuario_id serial,
	usuario_cpf char(11),
	usuario_nome varchar(150),
	usuario_nascimento date,
	usuario_email varchar(100),
	usuario_senha varchar(64),
	usuario_cep char(8),
	usuario_saldo money,
	PRIMARY KEY (usuario_id)
);

create table if not exists cartao(
	cartao_numero char(16),
	cartao_titular varchar(150),
	cartao_validade char(7),
	usuario_id serial,
	PRIMARY KEY(cartao_numero)
);

create table if not exists historico(
	historico_id serial,
	historico_linha varchar(4),
	historico_data date,
	historico_horario time,
	historico_valor money,
	usuario_id serial,
	PRIMARY KEY(historico_id)
);

create table if not exists horario(
	horario_id serial,
	horario_saida time,
	horario_tipo_orientacao char(1),
	horario_data_inicio date,
	horario_terminal_seq int,
	horario_numero_linha smallserial,
	horario_desc_terminal varchar(150),
	PRIMARY KEY(horario_id)
);

create table if not exists tipo_horario(
	tipoh_id smallserial,
	tipoh_desc_horario varchar(30),
	PRIMARY KEY(tipo_horario_id));

create table if not exists linha(
	linha_numero smallserial,
	linha_desc varchar(150),
	PRIMARY KEY (numero_linha)
);

create table if not exists bairro(
	bairro_id serial,
	bairro_desc varchar(150),
	cidade_id serial,
	PRIMARY KEY(bairro_id)
);

create table if not exists logradouro (
	log_id serial,
	log_cep char(8),
	log_desc_tipo varchar(20),
	log_desc_logradouro varchar(150),
	bairro_id serial,
	PRIMARY KEY(log_id)
);


create table if not exists cidade(
	cidade_id serial,
	cidade_desc varchar(150),
	PRIMARY KEY(id_cidade)
);

create table if not exists historico_linha (
    FK_LINHA_numero_linha smallserial,
    FK_HISTORICO_id_historico serial
);

create table if not exists usuario_cartao (
    FK_USUÁRIO_id_usuario serial,
    FK_CARTAO_DE_CREDITO_numero char(16)
);

create table if not exists itinerario_logradouro (
    FK_LOGRADOURO_id_logradouro char(8),
    FK_ITINERÁRIO_id_itinerario serial
);



/* adicionar chaves estrangeiras */
alter table cartao add constraint FK_CARTAO_ID FOREIGN KEY(usuario_id) references usuario(usuario_id) MATCH FULL on delete cascade on update cascade;
alter table historico add constraint FK_HISTORICO_ID FOREIGN KEY(usuario_id) references usuario(usuario_id) MATCH FULL on delete cascade on update cascade;
alter table horario add constraint FK_HORARIO_TIPOH FOREIGN KEY(horario_tipo_orientacao) references tipo_horario(tipoh_id);
alter table horario add constraint FK_HORARIO_LINHA FOREIGN KEY(horario_numero_linha) references linha(linha_numero) MATCH FULL on delete cascade on update cascade;
alter table usuario add constraint FK_USUARIO_LOGRADOURO FOREIGN KEY(usuario_cep) references logradouro(log_cep);
alter table logradouro add constraint FK_LOG_BAIRRO FOREIGN KEY(bairro_id) references bairro(bairro_id);
alter table bairro add constraint FK_BAIRRO_CIDADE FOREIGN KEY(cidade_id) references cidade(cidade_id);
alter table historico_linha add constraint FK_HISTORICO_LINHA_0 FOREIGN KEY (FK_LINHA_numero_linha) references LINHA (numero_linha) on delete restrict on update restrict;
alter table historico_linha add constraint FK_HISTORICO_LINHA_1 FOREIGN KEY (FK_HISTORICO_id_historico) references historico (id_historico) on delete set null on update cascade;
alter table usuario_cartao add constraint fk_usuario_cartao_0 FOREIGN KEY (FK_USUÁRIO_id_usuario) references usuario (id_usuario) ON DELETE RESTRICT ON UPDATE RESTRICT;
alter table usuario_cartao add constraint FK_USUARIO_CARTAO_1 FOREIGN KEY (FK_CARTAO DE CREDITO_numero)   references cartao (numero) on delete set null on update cascade;
alter table itinerario_logradouro add constraint FK_ITINERARIO_LOGRADOURO_0 FOREIGN KEY (FK_LOGRADOURO_id_logradouro) references logradouro (id_logradouro) on delete restrict on update restrict;
alter table itinerario_logradouro add constraint FK_ITINERARIO_LOGRADOURO_1 FOREIGN KEY (FK_ITINERÁRIO_id_itinerario) references itinerario (id_itinerario) on delete restrict on update restrict;

---- Insercao de dados ----

/* usuario */
insert into usuario values(default,'11122233344','Joao da Silva','1992-12-20','joaodasilva@yahoo.com.br','a1b2c3d4','29111111', 12.80);
insert into usuario values(default,'11199988822','Jadson Teco','1996-10-10','jadteco@gmail.com','teco78910','29111222', 13.04);
insert into usuario values(default,'22233344455','Antonio Santos','1988-10-20','antoniosantos@hotmail.com','123456','29111333', 17.17);
insert into usuario values(default,'12332145690','Amaro Neto','1982-07-01','amaroneto@gmail.com','abc123456','29111444', 18.81);
insert into usuario values(default,'12345612399','Natalia Vieira','1997-11-17','nataliavieira@gmail.com','aaa123bbb','29111555', 14.07);
insert into usuario values(default,'11111122288','Izabela Felix','1995-04-23','izabelafelix@gmail.com','abcd9182','29111666', 07.14);
insert into usuario values(default,'22211144477','Gabriel Fernandes','1994-05-11','gabrielfernandes@hotmail.com','lalala721','29111777', 21.05);
insert into usuario values(default,'78945612300','Diego Bolsoni','1993-01-04','diegobolsoni@yahoo.com.br','diego123456','29111888', 13.73);
insert into usuario values(default,'44412344466','Ingrid Brum','1998-10-21','ingridbrum@gmail.com','brum010203','29111999', 14.50);
insert into usuario values(default,'98788455611','Carolina Uliana','1997-06-18','caroluliana@hotmail.com','carol78690','29222111', 3.40);

/* cartao */
insert into cartao values('1111222233330000','Joao da Silva','06/2020', 1);
insert into cartao values('1111222233331111','Jadson Teco','07/2019', 2);
insert into cartao values('1111222233332222','Antonio Santos','07/2021', 3);
insert into cartao values('1111222233333333','Amaro Neto','03/2024', 4);
insert into cartao values('1111222233334444','Natalia Vieira','06/2021', 5);
insert into cartao values('1111222233335555','Izabela Felix','04/2023', 6);
insert into cartao values('1111222233336666','Gabriel Fernandes','05/2022', 7);
insert into cartao values('1111222233337777','Diego Bolsoni','03/2020', 8);
insert into cartao values('1111222233338888','Ingrid Brum','08/2024', 9);
insert into cartao values('1111222233339999','Carolina Uliana','08/2022', 10);

/* historico */
insert into historico values(default,'815','2017-07-01','07:30:32',3.40, 1);
insert into historico values(default,'815','2017-07-01','15:28:47',3.40, 2);
insert into historico values(default,'507','2017-06-05','07:45:00',1.70, 3);
insert into historico values(default,'507','2017-06-05','13:48:23',1.70, 4);
insert into historico values(default,'507','2017-06-08','07:50:11',1.70, 5);
insert into historico values(default,'507','2017-06-08','13:55:17',1.70, 6);
insert into historico values(default,'560','2017-05-31','20:29:13',1.70, 7);
insert into historico values(default,'501','2017-05-31','22:43:10',1.70, 8);
insert into historico values(default,'615','2017-01-31','10:23:41',3.40, 9);
insert into historico values(default,'615','2017-01-31','22:48:52',3.40, 10);

/* linha */
insert into linha values(815,'IFES / T. LARANJEIRAS');
insert into linha values(507,'T. LARANJEIRAS / T. IBES VIA 3ª PONTE/RETA DA PENHA');
insert into linha values(650,'T.VILA VELHA/T.IBES VIA PRAIA DE ITAPOÃ');
insert into linha values(611,'T.ITAPARICA/PRAIA DA COSTA VIA ITAPOÃ/CREFES');
insert into linha values(662,'T.VILA VELHA/PRAIA DA COSTA VIA CREFES - CIRCULAR');
insert into linha values(508,'T.LARANJEIRAS/T.ITAPARICA VIA T.VILA VELHA/3ª PONTE/CAMBURI');
insert into linha values(551,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE');
insert into linha values(501,'T.JACARAIPE/T.ITAPARICA VIA T.CARAPINA/3ª PONTE/T.VILA VELHA');
insert into linha values(560,'T.LARANJEIRAS/T.ITAPARICA VIA CAMBURI/3ª PONTE');
insert into linha values(520,'T.CARAPINA/T.VILA VELHA VIA RETA DA PENHA/3ª PONTE');

/* cidade */
insert into cidade values(default,'Vila Velha','ES');
insert into cidade values(default,'Vitoria','ES');
insert into cidade values(default,'Serra','ES');
insert into cidade values(default,'Cariacica','ES');
insert into cidade values(default,'Linhares','ES');
insert into cidade values(default,'Guarapari','ES');
insert into cidade values(default,'Aracruz','ES');
insert into cidade values(default,'Itapemirim','ES');
insert into cidade values(default,'Colatina','ES');
insert into cidade values(default,'Fundão','ES');

/* bairro */
insert into bairro values(default,'Itapuã',1);
insert into bairro values(default,'Praia da Costa',1);
insert into bairro values(default,'Jardim da Penha',2);
insert into bairro values(default,'Praia do Canto',2);
insert into bairro values(default,'Jardim Camburi',2);
insert into bairro values(default,'Itaparica',1);
insert into bairro values(default,'Laranjeiras',3);
insert into bairro values(default,'Planalto Serrano',3);
insert into bairro values(default,'Itaquari',4);
insert into bairro values(default,'Santa Catarina',4);

/* logradouro */
insert into logradouro values(default,'29146440','Rua','Curitiba',1);
insert into logradouro values(default,'29465824','Avenida','São Paulo',2);
insert into logradouro values(default,'29753159','Avenida','Hugo Musso',2);
insert into logradouro values(default,'29123456','Rua','Amoreira',1);
insert into logradouro values(default,'29456123','Avenida','Nossa Senhora Da Penha',4);
insert into logradouro values(default,'29234567','Avenida','Rio Branco',4);
insert into logradouro values(default,'29200485','Rua','Três',7);
insert into logradouro values(default,'29001407','Rua','Ayrton Senna',7);
insert into logradouro values(default,'29582471','Rua','Humberto Pereira',6);
insert into logradouro values(default,'29269962','Travessa','Belina',10);

/* tipo_horario */
insert into tipo_horario values(default,'DIAS ÚTEIS');
insert into tipo_horario values(default,'SÁBADOS');
insert into tipo_horario values(default,'DOMINGOS E FERIADOS');
insert into tipo_horario values(default,'ATÍPICOS ENTRE FERIADOS');

/* horario */
/* 815 */
insert into horario values(default,'05:30:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'05:54:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'06:05:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'06:43:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'06:55:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'07:17:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'07:32:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'07:51:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'08:05:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'08:30:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'08:50:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'11:55:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'12:30:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'13:10:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'15:24:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'15:42:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'15:59:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'16:17:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'16:34:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'16:51:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'17:00:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'17:08:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'17:25:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'17:42:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'17:59:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'18:16:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'18:33:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'18:55:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'19:10:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'21:50:00',1,'2017-05-28',1,815,'IFES');
insert into horario values(default,'22:10:00',1,'2017-05-28',1,815,'IFES');
/* 507 */
insert into horario values(default,'05:00:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'05:20:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'05:35:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'05:45:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:04:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:13:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:22:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:31:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:40:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:49:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'06:58:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'07:07:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'07:17:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'07:27:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'07:37:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'07:48:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'08:00:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'08:17:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'08:34:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'08:52:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'09:10:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'09:30:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'09:50:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
insert into horario values(default,'10:10:00',1,'2017-10-15',1,507,'TERMINAL LARANJEIRAS');
