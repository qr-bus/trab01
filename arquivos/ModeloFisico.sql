

CREATE TABLE USUARIO (
    Saldo money,
    email varchar(100),
    senha varchar(64),
    nascimento date,
    CPF char(11),
    nome varchar(150),
    id_usuario serial PRIMARY KEY,
    CEP char(8),
    FK_LOGRADOURO_id_logradouro char(8)
);

CREATE TABLE LOGRADOURO (
    id_logradouro char(8) PRIMARY KEY,
    CEP varchar(8),
    desc_logradouro varchar(150),
    desc_tipo varchar(20),
    FK_BAIRRO_id_bairro serial
);

CREATE TABLE BAIRRO (
    id_bairro serial PRIMARY KEY,
    desc_bairro varchar(150),
    FK_CIDADE_id_cidade serial
);

CREATE TABLE CIDADE (
    id_cidade serial PRIMARY KEY,
    desc_cidade varchar(150)
);

CREATE TABLE HISTORICO (
    data date,
    linha varchar(4),
    horario time,
    valor money,
    id_historico serial PRIMARY KEY,
    FK_USUÁRIO_id_usuario serial
);

CREATE TABLE LINHA (
    desc_linha varchar(50),
    numero_linha smallserial PRIMARY KEY
);

CREATE TABLE HORARIO (
    terminal_seq int,
    id_horario serial PRIMARY KEY,
    data_inicio date,
    hora_saida time,
    tipo_orientacao char(1),
    desc_terminal varchar(150),
    FK_LINHA_numero_linha smallserial,
    FK_TIPO_HORARIO_id_tipo smallserial
);

CREATE TABLE TIPO_HORARIO (
    id_tipo smallserial PRIMARY KEY,
    desc_horario varchar(30)
);

CREATE TABLE CARTAO_DE_CREDITO (
    titular varchar(150),
    numero char(16) PRIMARY KEY,
    validade char(5)
);

CREATE TABLE ITINERARIO (
    sentido char(1),
    sequencia smallint,
    tipo char(1),
    id_itinerario serial PRIMARY KEY,
    FK_LINHA_numero_linha smallserial
);

CREATE TABLE HISTORICO_LINHA (
    FK_LINHA_numero_linha smallserial,
    FK_HISTORICO_id_historico serial
);

CREATE TABLE USUARIO_CARTAO (
    FK_USUÁRIO_id_usuario serial,
    FK_CARTAO DE CREDITO_numero char(16)
);

CREATE TABLE ITINERARIO_LOGRADOURO (
    FK_LOGRADOURO_id_logradouro char(8),
    FK_ITINERÁRIO_id_itinerario serial
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
    FOREIGN KEY (FK_USUÁRIO_id_usuario)
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
 
ALTER TABLE HISTORICO_LINHA ADD CONSTRAINT FK_HISTORICO_LINHA_0
    FOREIGN KEY (FK_LINHA_numero_linha)
    REFERENCES LINHA (numero_linha)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE HISTORICO_LINHA ADD CONSTRAINT FK_HISTORICO_LINHA_1
    FOREIGN KEY (FK_HISTORICO_id_historico)
    REFERENCES HISTORICO (id_historico)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE USUARIO_CARTAO ADD CONSTRAINT FK_USUARIO_CARTAO_0
    FOREIGN KEY (FK_USUÁRIO_id_usuario)
    REFERENCES USUARIO (id_usuario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE USUARIO_CARTAO ADD CONSTRAINT FK_USUARIO_CARTAO_1
    FOREIGN KEY (FK_CARTAO DE CREDITO_numero)
    REFERENCES CARTAO_DE_CREDITO (numero)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE ITINERARIO_LOGRADOURO ADD CONSTRAINT FK_ITINERARIO_LOGRADOURO_0
    FOREIGN KEY (FK_LOGRADOURO_id_logradouro)
    REFERENCES LOGRADOURO (id_logradouro)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE ITINERARIO_LOGRADOURO ADD CONSTRAINT FK_ITINERARIO_LOGRADOURO_1
    FOREIGN KEY (FK_ITINERÁRIO_id_itinerario)
    REFERENCES ITINERARIO (id_itinerario)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
