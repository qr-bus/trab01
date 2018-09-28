
CREATE TABLE USUARIO (
    Saldo money,
    email varchar(100),
    senha char(64),
    nascimento date,
    CPF char(11),
    nome varchar(150),
    id_usuario int PRIMARY KEY,
    CEP char(8),
    FK_LOGRADOURO_id_logradouro int
);

CREATE TABLE LOGRADOURO (
    id_logradouro int PRIMARY KEY,
    CEP char(8),
    desc_logradouro varchar(150),
    desc_tipo varchar(20),
    FK_BAIRRO_id_bairro int
);

CREATE TABLE BAIRRO (
    id_bairro int PRIMARY KEY,
    desc_bairro varchar(150),
    FK_CIDADE_id_cidade int
);

CREATE TABLE CIDADE (
    id_cidade int PRIMARY KEY,
    desc_cidade varchar(150)
);

CREATE TABLE HISTORICO (
    data date,
    linha varchar(4),
    horario time,
    valor money,
    id_historico int PRIMARY KEY,
    FK_USUARIO_id_usuario int
);

CREATE TABLE LINHA (
    desc_linha varchar(50),
    numero_linha int PRIMARY KEY
);

CREATE TABLE HORARIO (
    terminal_seq int,
    id_horario int PRIMARY KEY,
    data_inicio date,
    hora_saida time,
    tipo_orientacao char(11),
    desc_terminal varchar(150),
    FK_LINHA_numero_linha int,
    FK_TIPO_HORARIO_id_tipo varchar(20)
);

CREATE TABLE TIPO_HORARIO (
    id_tipo varchar(20) PRIMARY KEY,
    desc_horario time
);

CREATE TABLE CARTAO DE CREDITO (
    titular varchar(100),
    numero int PRIMARY KEY,
    validade date
);

CREATE TABLE ITINERARIO (
    sentido char(11),
    sequencia int,
    tipo char(11),
    id_itinerario int PRIMARY KEY,
    FK_LINHA_numero_linha int
);

CREATE TABLE Contem (
    FK_LINHA_numero_linha int,
    FK_HISTORICO_id_historico int
);

CREATE TABLE Possui (
    FK_USUARIO_id_usuario int,
    FK_CARTAO DE CREDITO_numero int
);

CREATE TABLE Contem (
    FK_LOGRADOURO_id_logradouro int,
    FK_ITINERARIO_id_itinerario int
);
 
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_1
    FOREIGN KEY (FK_LOGRADOURO_id_logradouro)
    REFERENCES LOGRADOURO (id_logradouro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE LOGRADOURO ADD CONSTRAINT FK_LOGRADOURO_1
    FOREIGN KEY (FK_BAIRRO_id_bairro)
    REFERENCES BAIRRO (id_bairro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE BAIRRO ADD CONSTRAINT FK_BAIRRO_1
    FOREIGN KEY (FK_CIDADE_id_cidade)
    REFERENCES CIDADE (id_cidade)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE HISTORICO ADD CONSTRAINT FK_HISTORICO_1
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_1
    FOREIGN KEY (FK_LINHA_numero_linha)
    REFERENCES LINHA (numero_linha)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE HORARIO ADD CONSTRAINT FK_HORARIO_2
    FOREIGN KEY (FK_TIPO_HORARIO_id_tipo)
    REFERENCES TIPO_HORARIO (id_tipo)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE ITINERARIO ADD CONSTRAINT FK_ITINERARIO_1
    FOREIGN KEY (FK_LINHA_numero_linha)
    REFERENCES LINHA (numero_linha)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_0
    FOREIGN KEY (FK_LINHA_numero_linha)
    REFERENCES LINHA (numero_linha)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (FK_HISTORICO_id_historico)
    REFERENCES HISTORICO (id_historico)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_0
    FOREIGN KEY (FK_USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (FK_CARTAO DE CREDITO_numero)
    REFERENCES CARTAO DE CREDITO (numero)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_0
    FOREIGN KEY (FK_LOGRADOURO_id_logradouro)
    REFERENCES LOGRADOURO (id_logradouro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (FK_ITINERARIO_id_itinerario)
    REFERENCES ITINERARIO (id_itinerario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;