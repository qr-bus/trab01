/* Modelo Físico */

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
