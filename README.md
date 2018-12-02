# TRABALHO 01:  QR-Bus
Trabalho desenvolvido durante a disciplina de BD1

# Sumário
- [1.COMPONENTES](#1-componentes)<br>
- [2.INTRODUÇÃO E MOTIVAÇAO](#2introdução-e-motivaçao)<br>
- [3.MINI-MUNDO](#3mini-mundo)<br>
- [4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)](#4rascunhos-básicos-da-interface-mockups) <br>
  - [4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?](#41-quais-perguntas-podem-ser-respondidas-com-o-sistema-proposto) <br>
  - [4.2 TABELA DE DADOS DO SISTEMA:](#42-tabela-de-dados-do-sistema) <br>
- [5.MODELO CONCEITUAL](#5modelo-conceitual)<br>
  - [5.1 Validação do Modelo Conceitual](#51-validação-do-modelo-conceitual)<br>
  - [5.2 DECISÕES DE PROJETO](#52-decisões-de-projeto)<br>
  - [5.3 DESCRIÇÃO DOS DADOS](#53-descrição-dos-dados)<br>
- [6.MODELO LÓGICO](#6modelo-lógico)<br>
- [7.MODELO FÍSICO](#7modelo-físico)<br>
- [8.INSERT APLICADO NAS TABELAS DO BANCO DE DADOS](#8insert-aplicado-nas-tabelas-do-banco-de-dados)<br>
  - [8.1 DETALHAMENTO DAS INFORMAÇÕES](#81-detalhamento-das-informações)<br>
  - [8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS](#82-inclusão-do-script-para-criação-de-tabelas-e-inserção-dos-dados)<br>
  - [8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS](#83-inclusão-do-script-para-exclusão-de-tabelas-existentes-criação-de-tabela-novas-e-inserção-dos-dados)<br>
- [9.TABELAS E PRINCIPAIS CONSULTAS](#9tabelas-e-principais-consultas)<br>
  - [9.1 CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS](#91consultas-das-tabelas-com-todos-os-dados-inseridos-todas-)<br>
  - [9.2 CONSULTAS DAS TABELAS COM FILTROS WHERE](#92consultas-das-tabelas-com-filtros-where-mínimo-4)<br>
  - [9.3 CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS ](#93consultas-que-usam-operadores-lógicos-aritméticos-e-tabelas-ou-campos-renomeados-mínimo-11)<br>
  - [9.4 CONSULTAS QUE USAM OPERADORES LIKE E DATAS](#94consultas-que-usam-operadores-like-e-datas-mínimo-12-)<br>
  - [9.5 ATUALIZAÇÃO E EXCLUSÃO DE DADOS](#95atualização-e-exclusão-de-dados-mínimo-6)<br>
  - [9.6 CONSULTAS COM JUNÇÃO E ORDENAÇÃO](#96consultas-com-junção-e-ordenação-mínimo-6)<br>
  - [9.7 CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO](#97consultas-com-group-by-e-funções-de-agrupamento-mínimo-6)<br>
  - [9.8 CONSULTAS COM LEFT E RIGHT JOIN ](#98consultas-com-left-e-right-join-mínimo-4)<br>
  - [9.9 CONSULTAS COM SELF JOIN E VIEW](#99consultas-com-self-join-e-view-mínimo-6)<br>
  - [9.10 SUBCONSULTAS](#910subconsultas-mínimo-3)<br>
- [10.ATUALIZAÇÃO DA DOCUMENTAÇÃO DOS SLIDES PARA APRESENTAÇAO FINAL](#10atualização-da-documentação-dos-slides-para-apresentaçao-final-mínimo-6-e-máximo-10)<br>
- [11.BACKUP COMPLETO DO BANCO DE DADOS POSTGRES](#11-backup-completo-do-banco-de-dados-postgres)<br>
- [12.TUTORIAL COMPLETO DE PASSOS PARA RESTAURACAO DO BANCO E EXECUCAO DE PROCEDIMENTOS ENVOLVIDOS NO TRABALHO PARA OBTENÇÃO DOS RESULTADOS](#12tutorial-completo-de-passos-para-restauracao-do-banco-e-execucao-de-procedimentos-envolvidos-no-trabalho-para-obtenção-dos-resultados)<br>
- [13.DIFICULDADES ENCONTRADAS PELO GRUPO](#13---dificuldades-encontradas-pelo-grupo)<br>
- [14.FORMATACAO NO GIT](#14--formatacao-no-git-httpshelpgithubcomarticlesbasic-writing-and-formatting-syntax)<br>
- [OBSERVAÇÕES IMPORTANTES](#observações-importantes)<br>


### 1. COMPONENTES<br>
Integrantes do grupo:<br><br>
Ewerson Vieira Nascimento: ewersonv@gmail.com<br>
Giuliano de Paulo Demoner: giuliano.demoner@gmail.com<br>
Lorran Gabriel Araújo: lorrangabriel20@gmail.com<br>
Marcos Antônio Carneiro de Paula: cardepaula@gmail.com<br>


### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
A bilhetagem eletrônica já é uma realidade nos transportes públicos do nosso estado a algum tempo, diversas pessoas fazem uso do seu cartão para se movimentar durante o dia-a-dia, seja de uso particular ou vinculado ao trabalho. Podemos dizer que a solução existente dá conta do recado e atende bem ao seu propósito, mas somente isso. Ainda temos que enfrentar diversos problemas com o uso do cartão como meio de pagamento, como a recarga em que temos que enfrentar uma fila enorme, taxas por perda ou quebra do cartão, complicado monitoramento de saldo e falta de segurança devido as fraudes.<br>

A partir dessa visão começamos a buscar por alternativas que poderiam atuar como meio de pagamento das passagens, sendo acessível, seguro e fácil de utilizar. A resposta estava bem na nossa frente, nossos smartphones.<br>

Através de tecnologias presentes nesses dispositivos seria possível efetuar o pagamento da mesma forma que já conhecemos, apenas o aproximando do leitor, ou até mesmo com um qrcode gerado e lido por câmeras já presentes nos coletivos, mas que tem como finalidade a identificação de fraudes por comparação facial. Além das funções de pagamento de um cartão comum, esse novo método traria os benefícios da internet, facilitando a recarga de nossas passagens através de cartões de credito ou boletos bancários. Como essas funções teriam que ser controlados por meio de um software, ainda poderíamos ter um controle de nossos gastos, com históricos de transações, linhas utilizadas e muito mais.<br>
 

### 3.MINI-MUNDO<br>

O sistema proposto conterá as informacões aqui detalhadas. Dos usuários serão armazenados o nome completo, data de nascimento, cpf, endereço, e-mail e senha, sendo esse dois ultimos para efetuar login no sistema. O saldo será informado de acordo com o valor referente ao saldo do usuário no próprio sistema da GVBus, sendo atualizado em tempo real a cada nova operação de recarga ou pagamento realizada. Só poderá existir um único cadastro para cada CPF. Dos meios de pagamento, serão armazenados dados de cartões de credito salvos, contendo o número do cartão, nome do titular e data de validade. Os dados armazenados pertinentes ao cartão de credito deverão seguir as regras do PCI Security Standards Council visando a confiabilidade do sistema. Um usuário pode ter mais de um cartão de crédito. O histórico de uso do aplicativo também deve ter seus dados armazenados, que são as linhas usadas, junto com a data, horário e valor debitado da conta. Os dados dos horários de onibus serão obitidos por API, que devem possuir número da linha, descrição e os horários semanais e diários de origem e destino. O itinerário também será obtido por API, com linha, sentido da linha, ponto de origem, pontos de passagem e ponto de destino da linha. O saldo do usuário deve ser sincronizado com a empresa responsável pelo seu uso (companhia de transporte).<br>

### 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
[Mockup feito com Balsamiq](/arquivos/Mockup.pdf)
#### 4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
   <b>A Empresa QR-Bus precisa inicialmente dos seguintes relatórios:</b>
* Relatório que informe ao usuário seu histórico de viagens, com dias e horários em que usou o sistema, assim como as linhas utilizadas.
* Relatório que informe as linhas mais utilizadas e as menos utilizadas (por todos os usuários) dependendo do horário.
* Lista direcionada ao usuário informando as melhores opções de linhas para sair de sua origem à seu destino.
* Relatório que informe à gerência bairros ou pontos de ônibus onde há maior concentração de passageiros que efetuam o embarque e o desembarque dos coletivos.
* Relatório de tempo médio de viagem de cada linha do ponto de partida ao ponto de chegada (definidos pelo usuário).
* Relatório direcionado ao usuário para controle de seu saldo, com quantidade de viagens feitas por dia/semana/mês, valor de cada viagem e gasto total no período definido.
 
#### 4.2 TABELA DE DADOS DO SISTEMA:
[Tabela de dados QR-Bus](https://github.com/qr-bus/trab01/tree/master/arquivos/Tabelao_qr-bus.xlsx?raw=true "Tabela - Empresa QR-Bus")
    
>## Marco de Entrega 01 em: (06/09/2018)<br>

### 5.MODELO CONCEITUAL<br>
![img](images/QR-Bus_-_modelo_conceitual.png) 

     
        
    
#### 5.1 Validação do Modelo Conceitual
   <b>[Grupo01]:</b> Psicultura Inteligente (André Altivo, Gabriela Piffer, Lucca Machado e Marcelo Mendes)
   <br><b>[Grupo02]:</b> Carga Pesada (Leonardo Sena, Matheus Aguiar, Wallace de Paula e Willian Vaneli)

#### 5.2 DECISÕES DE PROJETO
   <b>Tipo_Horario:</b> Essa tabela foi criada com o intuito de identificar qual o tipo de horario será seguido por aquela linha, dias úteis, feriados, atípicos entre feriados ou fins de semana.<br>
   
   <b>Cartão:</b> A tabela cartão possui relação (0,n) com usuário, pois decidimos que o usuário pode ou não ter um cartão de crédito para usar o app.<br>
   
>## Marco de Entrega 02 em: (17/09/2018)<br>
#### 5.3 DESCRIÇÃO DOS DADOS 
   <b>USUARIO:</b> Tabela que armazena informações relacionadas ao usuário do sistema.<br>
   - id_usuario: id do usuário, gerado automaticamente.<br>
   - cpf: cpf do usuário.<br>
   - nome: nome completo do usuário.<br>
   - nascimento: data de nascimento do usuário.<br>
   - email: email do usuário.<br>
   - senha: senha do usuário.<br>
   - saldo: saldo do usuário para pagamento de passagens.<br>
   
   <b>CARTAO:</b> Tabela que contém dados do cartão de passagem do usuário.<br>
   - numero: número do cartão do usuário.<br>
   - titular: nome do titular do cartão.<br>
   - validade: data de validade presente no cartão.<br>
  
   <b>PASSAGEM:</b> Tabela que armazena os pagamentos de passagens em datas e horarios específicos.<br>
   - id_passagem: id da passagem, gerado automaticamente.<br>
   - numero_linha: linha utilizada pelo usuário.<br>
   - data: data em que o usuário pagou a passagem.<br>
   - horario: horário em que a passagem foi paga.<br>
   - valor: valor da passagem paga.<br>
   
   <b>LINHA:</b> Contém informações sobre a linha do ônibus.<br>
   - numero_linha: número da linha.<br>
   - desc_linha: descrição (nome) da linha.<br>
   
   <b>HORÁRIO:</b> Contém dados sobre horarios das linhas.<br>
   - id_horario: id da linha, gerado automaticamente.<br>
   - hora_saida: horário em que o ônibus sai do terminal.<br>
   - desc_terminal: nome do terminal que o ônibus sairá.<br>
   - data_inicio: data em que este horário começou a ser utilizado.<br>
   
   <b>TIPO_HORARIO:</b> Tabela que armazena os tipos de horário.<br>
   - id_tipo: id do tipo de horário, gerado automaticamente.<br>
   - desc_horario: descrição do tipo (dias úteis, feriados, atípicos entre feriados ou fins de semana).<br>
   
   <b>ITINERARIO:</b> Armazena informações sobre o sentido da linha (ida ou volta).<br>
   - id_itinerario: id do itinerário atrelado a cada rua que a linha percorrerá, gerado automaticamente.<br>
   - sentido: informa o sentido que a linha percorrerá (ida ou volta).<br>
   - sequencia: cada rua pela qual o ônibus passará.<br>
   
   <b>ITINERARIO_PONTO</b> Faz o intermédio entre a entidade Intenario e a Ponto.<br>
   - id_intin_ponto: id do itinerario_ponto.<br>
   - pos_sequencia: posiçao na sequencia de pontos que o itinerário possui.<br>
   
   <b>PONTO:</b> Armazena as coordenas do ponto.<br>
   - id_ponto: id do ponto, gerado automaticamente.<br>
   - latitude: latitude para posição geográfica do ponto.<br>
   - longitude: longitude para posição geográfica do ponto.<br>
   
   <b>LOGRADOURO:</b> Armazena informações sobre o logradouro (CEP, tipo e nome).<br>
   - id_logradouro: id do logradouro, gerado automaticamente.<br>
   - cep: número CEP.<br>
   - desc_tipo: descrição do tipo de logradouro (rua, avenida, travessa...).<br>
   - desc_logradouro: nome do logradouro.<br>
   
   <b>BAIRRO:</b> Armazena informações sobre o bairro (nome e ID).<br>
   - id_bairro: id do bairro, gerado automaticamente.<br>
   - desc_bairro: nome do bairro.<br>
   
   <b>CIDADE:</b> Armazena informações sobre a cidade (nome e ID).<br>
   - id_cidade: id da cidade, gerado automaticamente.<br>
   - desc_cidade: nome da cidade.<br>

### 6	MODELO LÓGICO<br>
   ![img](images/QR-Bus_-_modelo_logico.png) 

### 7	MODELO FÍSICO<br>
   [Modelo Fisico](arquivos/QR-Bus_-_modelo_fisico.sql)         
        
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES 
   [Inserção dos dados](sql/insert.sql)

#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS
   [Create + Inserts](sql/create_e_insert.sql)
   
#### 8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS
   [Drop + Create + Inserts](sql/drop_create_insert.sql)
>## Marco de Entrega 03 em: (27/09/18) <br>

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>

	SELECT * FROM BAIRRO;
![img](images/9.1/SELECT_*_FROM_BAIRRO.png)

	SELECT * FROM CARTAO;
![img](images/9.1/SELECT_*_FROM_CARTAO.png)

	SELECT * FROM CIDADE;
![img](images/9.1/SELECT_*_FROM_CIDADE.png)

	SELECT * FROM HORARIO;
![img](images/9.1/SELECT_*_FROM_HORARIO.png)

	SELECT * FROM ITINERARIO;
![img](images/9.1/SELECT_*_FROM_ITINERARIO.png)

	SELECT * FROM ITINERARIO_PONTO;
![img](images/9.1/SELECT_*_FROM_ITINERARIO_PONTO.png)

	SELECT * FROM LINHA;
![img](images/9.1/SELECT_*_FROM_LINHA.png)

	SELECT * FROM LOGRADOURO;
![img](images/9.1/SELECT_*_FROM_LOGRADOURO.png)

	SELECT * FROM PAGAMENTO;
![img](images/9.1/SELECT_*_FROM_PAGAMENTO.png)

	SELECT * FROM PASSAGEM;
![img](images/9.1/SELECT_*_FROM_PASSAGEM.png)

	SELECT * FROM PONTO;
![img](images/9.1/SELECT_*_FROM_PONTO.png)

	SELECT * FROM TIPO_HORARIO;
![img](images/9.1/SELECT_*_FROM_TIPO_HORARIO.png)

	SELECT * FROM USUARIO;
![img](images/9.1/SELECT_*_FROM_USUARIO.png)


#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>

	SELECT * FROM logradouro WHERE desc_tipo = 'Avenida';
   ![img](images/9.2/9.2.1.png)
   
	SELECT * FROM itinerario WHERE destino = 'T.JACARAIPE';
   ![img](images/9.2/9.2.2.JPG)
   
   	SELECT * FROM horario WHERE hora_saida > '07:00:00' AND hora_saida < '07:50:00';
   ![img](images/9.2/9.2.3.JPG)
   
   	SELECT * FROM logradouro WHERE desc_tipo = 'Rua';
   ![img](images/9.2/9.2.4.JPG)

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
   <b>a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not </b><br>
    
	SELECT * FROM logradouro 
	WHERE desc_logradouro = 'Rio Branco' 
	OR id_bairro = '2';
![img](images/9.3/9.3.1.png)

	SELECT hora_saida, 
	id_itinerario 
	FROM HORARIO 
	WHERE (hora_saida > '09:09:00' AND id_itinerario = 1);
![img](images/9.3/9.3.2.png)

	SELECT hora_saida, 
	id_itinerario 
	FROM HORARIO WHERE ((hora_saida > '09:09:00')
	AND (id_itinerario = 1 OR  id_itinerario = 3));
![img](images/9.3/9.3.3.png)

	SELECT (desc_tipo|| '. '||desc_logradouro) 
	FROM LOGRADOURO 
	WHERE ((id_bairro = 4) 
	OR (id_bairro = 7));

![img](images/9.3/9.3.4.png)

	SELECT hora_saida, id_itinerario 
	FROM HORARIO 
	WHERE ((hora_saida > '09:09:00') 
	AND (NOT id_itinerario = 3 
	AND NOT id_itinerario = 4));
![img](images/9.3/9.3.5.png) <br>
   
   
   
   <b>b) Criar no mínimo 3 consultas com operadores aritméticos </b><br>
    
	SELECT numero_cartao,
	valor_pagamento,
	(valor_pagamento - 3.40) AS sobra
	FROM PAGAMENTO 
	WHERE (id_pagamento > 5 );
![img](images/9.3/9.3.6.png) <br>

	SELECT cartao.titular ,
	valor_pagamento,
	(valor_pagamento + 90.00) AS sobra 
	FROM PAGAMENTO
	INNER JOIN CARTAO
	ON (cartao.numero = '1111222233339999' 
	OR cartao.numero = '1111222233338888')
	GROUP BY titular,valor_pagamento;
![img](images/9.3/9.3.7.png) <br>

	SELECT cartao.titular ,
	valor_pagamento,
	CAST((valor_pagamento / 3.40) AS DECIMAL(3,0)) AS numero_passagens
	FROM PAGAMENTO 
	INNER JOIN CARTAO 
	ON (cartao.numero = '1111222233333333' 
	OR cartao.numero = '1111222233338888' 
	OR cartao.numero = '1111222233335555') 
	GROUP BY titular,valor_pagamento;
![img](images/9.3/9.3.8.png) <br>
   
   <b>c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas </b><br>
   
   <b> 1 </b><br>
   
	ALTER TABLE CIDADE RENAME TO MUNICIPIO;
	SELECT * FROM MUNICIPIO;
![img](images/9.3/rename_cidade.PNG)<br>

   <b> 2 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM linha;
![img](images/9.1/SELECT_*_FROM_LINHA.png)<br>
   <b> DEPOIS </b><br>
   
	ALTER TABLE LINHA RENAME COLUMN desc_linha TO descricao_linha;
![img](images/9.3/9.3.c.2.2.png)<br>

   <b> 3 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM MUNICIPIO;
![img](images/9.1/SELECT_*_FROM_CIDADE.png)<br>
   <b> DEPOIS </b><br>
   
	ALTER TABLE MUNICIPIO RENAME COLUMN desc_cidade TO nome_municipio;
	ALTER TABLE MUNICIPIO RENAME COLUMN id_cidade TO id_municipio;
![img](images/9.3/9.3.c.3.1.png)<br>
      
#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
   <b>a) Criar outras 5 consultas que envolvam like ou ilike </b><br>
    
	SELECT numero_linha 
	FROM LINHA 
	WHERE descricao_linha LIKE 'T.LARANJEIRAS%' 
	OR descricao_linha LIKE '%T.ITAPARICA VIA T.CARAPINA%';
![img](images/9.4/9.4.a.1.png)<br>

	SELECT titular,validade 
	FROM CARTAO
	WHERE((numero = '1111222233332222' ) 
	OR (validade LIKE '%2022'));
![img](images/9.4/9.4.a.2.png)<br>

	SELECT titular,validade 
	FROM CARTAO
	WHERE((numero = '1111222233338888' ) 
	OR (titular LIKE '%Fernandes') 
	OR (titular LIKE 'A%'));
![img](images/9.4/9.4.a.3.png)<br>

	SELECT desc_bairro 
	FROM BAIRRO 
	WHERE ((id_cidade = 2) 
	AND ( desc_bairro ILIKE 'jardim%'));
![img](images/9.4/9.4.a.4.png)<br>

	SELECT nome, nascimento 
	FROM USUARIO 
	WHERE nome ILIKE 'J%' 
	OR nome ILIKE 'A%' 
	ORDER BY nascimento DESC;
![img](images/9.4/9.4.a.5.JPG) <br>
    
   <b>b) Criar uma consulta para cada tipo de função data apresentada. </b><br>

	SELECT id_itinerario, 
	age(current_date, horario.data_inicio) AS "Tempo sem modificar o horario"
	FROM HORARIO
	GROUP BY id_itinerario, age(current_date, horario.data_inicio);
![img](images/9.4/9.4.b.1.png) <br>

	SELECT id_itinerario,
	current_time(0) AS "hora atual",
	hora_saida AS "próximos horarios"
	FROM HORARIO
	WHERE id_itinerario = 4
	AND hora_saida > current_time(0);
![img](images/9.4/9.4.b.2.png) <br>

	SELECT nome,
	nascimento,
	date_part('year', age(now(), nascimento)) AS idade
	FROM USUARIO;
![img](images/9.4/9.4.b.3.png) <br>

	SELECT usuario.nome,
	extract('month' FROM pagamento.data_pagamento) AS "Meses de compra passagem"
	FROM PAGAMENTO
	INNER JOIN CARTAO
	ON (cartao.numero = pagamento.numero_cartao)
	INNER JOIN USUARIO
	ON (usuario.numero_cartao = cartao.numero);
![img](images/9.4/9.4.b.4.png) <br>


#### 9.5	ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
   
   <b> 1 </b><br>
   <b> Antes </b><br>

	SELECT * FROM PASSAGEM;
![img](images/9.5/1.1.JPG)<br>
   <b> DEPOIS </b><br>

	UPDATE passagem SET valor = 1.70 
	WHERE hora = '07:30:00';
![img](images/9.5/1.2.JPG)<br>

   <b> 2 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM CARTAO;
![img](images/9.5/2.1.JPG)<br>
   <b> DEPOIS </b><br>
   
	UPDATE CARTAO SET titular = 'Joao da Silva Junior' 
	WHERE titular = 'Joao da Silva';
![img](images/9.5/2.2.JPG)<br>

<b> 3 </b><br>
<b> Antes </b><br>

	SELECT * FROM PAGAMENTO;
![img](images/9.5/3.1.png)<br>
   <b> DEPOIS </b><br>
   
	UPDATE PAGAMENTO SET valor_pagamento = 150.00 
	WHERE data_pagamento = '2018-02-08' 
	OR data_pagamento = '2018-06-08';
![img](images/9.5/3.2.png)<br>

   <b> 4 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM passagem;
![img](images/9.5/4.1.png)<br>
   <b> DEPOIS </b><br>

	DELETE FROM PASSAGEM 
	WHERE data = '2018-10-09';
![img](images/9.5/4.2.png)<br>

   <b> 5 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM PAGAMENTO;
![img](images/9.5/5.1.png)<br>
   <b> DEPOIS </b><br>
   
	DELETE FROM PAGAMENTO 
	WHERE id_pagamento = 7;
![img](images/9.5/5.2.png)<br>

   <b> 6 </b><br>
   <b> Antes </b><br>
   
	SELECT * FROM ITINERARIO;
![img](images/9.5/6.1.JPG)<br>
   <b> DEPOIS </b><br>
   
	DELETE FROM ITINERARIO 
	WHERE numero_linha = 611;
![img](images/9.5/6.2.JPG)<br>

>## Marco de Entrega 04 em: (18/10/2017)<br>

#### 9.6	CONSULTAS COM JUNÇÃO E ORDENAÇÃO (Mínimo 6)<br>
   <b>a) Uma junção que envolva todas as tabelas possuindo no mínimo 3 registros no resultado </b><br>

   <b>JOIN COM TODAS AS TABELAS</b><br>

	SELECT usuario.nome,
	cartao.numero AS "Cartao de credito",
	pagamento.data_pagamento AS "Data recarga", 
	passagem.data AS "Data da passagem",
	passagem.hora AS "Horario da passagem",
	linha.descricao_linha AS "Linha",
	horario.hora_saida,
	tipo_horario.desc_horario AS "Tipo de horario",
	itinerario.destino AS "Destino do onibus",
	itinerario_ponto.pos_sequencia,
	ponto.id_ponto,
	logradouro.desc_tipo AS "Itinerario - Tipo logradouro",
	logradouro.desc_logradouro AS "Itinerario - Nome logradouro",
	bairro.desc_bairro AS "Itinerario - Bairro", 
	municipio.nome_municipio AS "Itinerario - Cidade"
	FROM USUARIO
	INNER JOIN CARTAO
	ON (usuario.numero_cartao = cartao.numero)
	INNER JOIN PAGAMENTO 
	ON (cartao.numero = pagamento.numero_cartao)
	INNER JOIN PASSAGEM
	ON (passagem.id_usuario = usuario.id_usuario)
	INNER JOIN LINHA
	ON (passagem.numero_linha = linha.numero_linha)
	INNER JOIN ITINERARIO
	ON (itinerario.numero_linha = linha.numero_linha)
	INNER JOIN ITINERARIO_PONTO
	ON (itinerario.id_itinerario = itinerario_ponto.id_itinerario)
	INNER JOIN HORARIO
	ON (itinerario.id_itinerario = horario.id_itinerario)
	INNER JOIN TIPO_HORARIO
	ON (horario.id_tipo = tipo_horario.id_tipo)
	INNER JOIN PONTO
	ON (ponto.id_ponto = itinerario_ponto.id_ponto)
	INNER JOIN LOGRADOURO
	ON (ponto.id_logradouro = logradouro.id_logradouro)
	INNER JOIN BAIRRO
	ON (logradouro.id_bairro = bairro.id_bairro)
	INNER JOIN MUNICIPIO
	ON (bairro.id_cidade = municipio.id_municipio)
	WHERE passagem.hora = '12:30:00'
	AND horario.hora_saida = '12:25:00'
	AND ponto.id_ponto = 1;
![img](images/9.6/9.6.a.1.png)<br>

   <b>b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho </b><br>
	

	SELECT itinerario.numero_linha as linha,
	itinerario_ponto.pos_sequencia,
	ponto.id_ponto,
	logradouro.desc_tipo,
	logradouro.desc_logradouro
	FROM ITINERARIO
	INNER JOIN ITINERARIO_PONTO
	ON (itinerario.id_itinerario = itinerario_ponto.id_itinerario)
	INNER JOIN PONTO
	ON (itinerario_ponto.id_ponto = ponto.id_ponto)
	INNER JOIN LOGRADOURO
	ON (ponto.id_logradouro = logradouro.id_logradouro)
	ORDER BY itinerario.numero_linha, itinerario_ponto.pos_sequencia;
![img](images/9.6/9.6.b.1.png)<br>

	SELECT linha.numero_linha as linha,
	horario.hora_saida,
	tipo_horario.desc_horario as "tipo horario"
	FROM HORARIO
	INNER JOIN TIPO_HORARIO
	ON(horario.id_tipo = tipo_horario.id_tipo)
	INNER JOIN ITINERARIO
	ON(itinerario.id_itinerario = horario.id_itinerario)
	INNER JOIN LINHA
	ON (itinerario.numero_linha = linha.numero_linha);
![img](images/9.6/9.6.b.2.png)<br>

	SELECT passagem.data,
	passagem.hora,
	linha.numero_linha as "linha"
	FROM PASSAGEM
	INNER JOIN LINHA
	ON(passagem.numero_linha = linha.numero_linha)
	WHERE passagem.id_usuario = 3
	ORDER BY passagem.data, passagem.hora;
![img](images/9.6/9.6.b.3.png)<br>

   

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
   
	SELECT COUNT(cep),
	desc_tipo 
	FROM logradouro 
	GROUP BY desc_tipo;
![img](images/9.7/9.7.1.png)<br>

	SELECT COUNT(id_horario) as qtd_horarios, 
	desc_terminal 
	FROM horario 
	GROUP BY desc_terminal 
	ORDER BY qtd_horarios desc;
![img](images/9.7/9.7.2.png)<br>

	SELECT COUNT(id_passagem) as passagem_vendida, 
	data 
	FROM passagem 
	GROUP BY data;
![img](images/9.7/9.7.3.png)<br>

	SELECT COUNT(id_itinerario) as "Itinerario com mesmo destino", 
	destino 
	FROM itinerario 
	GROUP BY destino;
![img](images/9.7/4.png)<br>

	SELECT COUNT(id_bairro) as qtd_bairros, 
	id_cidade 
	FROM bairro 
	GROUP BY id_cidade;
![img](images/9.7/5.JPG)<br>

	SELECT COUNT(id_pagamento) AS qtd_pagamento, 
	valor_pagamento AS valor_pago 
	FROM pagamento 
	GROUP BY valor_pago;
![img](images/9.7/6.png)<br>
   
#### 9.8	CONSULTAS COM LEFT E RIGHT JOIN (Mínimo 4)<br>
	SELECT COUNT(bairro.id_bairro), 
	municipio.nome_municipio, 
	municipio.id_municipio
	FROM BAIRRO
	LEFT JOIN MUNICIPIO
	ON bairro.id_cidade = municipio.id_municipio
	GROUP BY municipio.id_municipio
	ORDER BY municipio.id_municipio;
![img](images/9.8/9.8.1.png)<br>

	SELECT COUNT(logradouro.cep), 
	bairro.desc_bairro
	FROM LOGRADOURO
	LEFT JOIN BAIRRO
	ON logradouro.id_bairro = bairro.id_bairro
	GROUP BY bairro.desc_bairro
	ORDER BY bairro.desc_bairro;
![img](images/9.8/9.8.2.png)<br>

	SELECT COUNT(passagem.id_passagem) AS passagens_vendidas, 
	linha.descricao_linha AS linha
	FROM PASSAGEM
	LEFT JOIN LINHA
	ON passagem.numero_linha = linha.numero_linha
	GROUP BY linha.descricao_linha
	ORDER BY passagens_vendidas desc;
![img](images/9.8/9.8.3.png)<br>

	SELECT cartao.numero AS cartao, 
	usuario.email AS enviar_email_para
	FROM CARTAO
	LEFT JOIN USUARIO
	ON cartao.numero = usuario.numero_cartao
	GROUP BY cartao.numero, usuario.email;
![img](images/9.8/4.JPG)<br>
   
#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
   <b>a) Uma junção que envolva Self Join</b><br>
        
	SELECT A.numero_linha, 
	B.numero_linha, 
	A.destino
	FROM itinerario A, itinerario B
	WHERE A.numero_linha <> B.numero_linha
	AND A.destino = B.destino
	ORDER BY A.numero_linha
	LIMIT 10;
![img](images/9.9/mesmo_destino.PNG)

  <b>b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho </b><br>
   
	CREATE VIEW valor_total_recebido AS(
	SELECT SUM(valor_pagamento) AS valor_total_recebido 
	FROM pagamento);

	SELECT * FROM valor_total_recebido;
![img](images/9.9/valor_total_recebido.PNG)

	CREATE VIEW total_ruas_bairros_cidades_pontos AS(
	SELECT COUNT(logradouro.id_logradouro) AS total_ruas,
	COUNT(bairro.id_bairro) AS total_bairros,
	COUNT(municipio.id_municipio) AS total_cidades,
	COUNT(ponto.id_ponto) AS total_pontos
	FROM LOGRADOURO
	RIGHT JOIN BAIRRO
	ON logradouro.id_bairro = bairro.id_bairro
	RIGHT JOIN MUNICIPIO
	ON bairro.id_cidade = municipio.id_municipio
	INNER JOIN PONTO
	ON ponto.id_logradouro = logradouro.id_logradouro);

	SELECT * FROM total_ruas_bairros_cidades_pontos;
![img](images/9.9/total_ruas_bairros_cidades_pontos.PNG)<br>

	CREATE VIEW usuarios_mes_valor AS(
	SELECT usuario.nome,
	CONCAT(SUBSTRING(CAST(passagem.data AS VARCHAR), 1, 4), '/', 
		SUBSTRING(CAST(passagem.data AS VARCHAR), 6, 2)) AS "Mes",
	SUM(passagem.valor) AS "Valor mensal"
	FROM usuario
	INNER JOIN passagem
	ON usuario.id_usuario = passagem.id_usuario
	GROUP BY usuario.nome, "Mes"
	ORDER BY usuario.nome);

	SELECT * FROM usuarios_mes_valor;
![img](images/9.9/usuarios_mes_valor.png)<br>

	CREATE VIEW numero_viagens_mes_usuario AS(
	SELECT usuario.nome,
	CONCAT(SUBSTRING(CAST(passagem.data AS VARCHAR), 1, 4), '/', 
		SUBSTRING(CAST(passagem.data AS VARCHAR), 6, 2)) AS "Mes",
	COUNT(passagem.id_passagem) AS "Numero de viagens"
	FROM usuario
	INNER JOIN passagem
	ON usuario.id_usuario = passagem.id_usuario
	GROUP BY usuario.nome, "Mes"
	ORDER BY usuario.nome);

	SELECT * FROM numero_viagens_mes_usuario;

![img](images/9.9/numero_viagens_mes_usuario.png)<br>

	CREATE VIEW qtd_passagens_vendidas_dia AS(
	SELECT COUNT(a.id_passagem) AS "numero de passagens" , a.data
	FROM passagem A, passagem B
	WHERE A.id_passagem <> B.id_passagem
	AND A.data = B.data
	GROUP BY a.data);

	SELECT * FROM qtd_passagens_vendidas_dia;
![img](images/9.9/6.png)<br>
   
#### 9.10	SUBCONSULTAS (Mínimo 3)<br>

	SELECT nome, cpf, CONCAT(desc_tipo,' ', desc_logradouro) AS "mora em", saldo
	FROM usuario
	INNER JOIN logradouro
	ON usuario.id_logradouro = logradouro.id_logradouro
	WHERE usuario.id_usuario NOT IN (SELECT id_usuario FROM passagem)
	ORDER BY nome;
![img](images/9.10/9.10_1.png)<br>

	SELECT linha.numero_linha, descricao_linha, hora_saida, desc_terminal, desc_horario
	FROM horario
	INNER JOIN itinerario
	ON horario.id_itinerario = itinerario.id_itinerario
	INNER JOIN linha
	ON itinerario.numero_linha = linha.numero_linha
	INNER JOIN tipo_horario
	ON horario.id_tipo = tipo_horario.id_tipo
	WHERE horario.id_tipo IN (SELECT id_tipo FROM tipo_horario WHERE id_tipo = 1)
	ORDER BY numero_linha;
![img](images/9.10/9.10_2.png)<br>

	SELECT hora_saida, desc_terminal, desc_horario
	FROM horario
	INNER JOIN tipo_horario
	ON horario.id_tipo = tipo_horario.id_tipo
	WHERE horario.id_tipo IN (SELECT id_tipo FROM tipo_horario WHERE id_tipo <> 3)
	ORDER BY hora_saida;
![img](images/9.10/9.10_3.png)<br>

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO DOS SLIDES PARA APRESENTAÇAO FINAL (Mínimo 6 e Máximo 10)<br>

### 11 Backup completo do banco de dados postgres 
    a) deve ser realizado no formato "backup" 
        (Em Dump Options #1 Habilitar opções Don't Save Owner e Privilege)
    b) antes de postar o arquivo no git o mesmo deve ser testado/restaurado por outro grupo de alunos/dupla
    c) informar aqui o grupo de alunos/dupla que realizou o teste.

### 12	TUTORIAL COMPLETO DE PASSOS PARA RESTAURACAO DO BANCO E EXECUCAO DE PROCEDIMENTOS ENVOLVIDOS NO TRABALHO PARA OBTENÇÃO DOS RESULTADOS<br>
        a) Outros grupos deverão ser capazes de restaurar o banco 
        b) executar todas as consultas presentes no trabalho
        c) executar códigos que tenham sido construídos para o trabalho 
        d) realizar qualquer procedimento executado pelo grupo que desenvolveu o trabalho
        
### 13   DIFICULDADES ENCONTRADAS PELO GRUPO<br>
   As maiores dificuldades que encontramos foram relacionadas à montagem do modelo conceitual e, eventualmente, o modelo lógico. Ficamos em dúvida em vários momentos sobre a necessidade de algumas tabelas e certos relacionamentos e realizamos mudanças nos dois modelos até a última semana antes da entrega deste trabalho. Além disso, outra tarefa que demandou tempo e rendeu diversas dúvidas foi a elaboração de relatórios, pois no início não sabíamos o que seria gerado apenas por aquilo que desenvolvemos e o que deveria ser entregue em conjunto com uma API ou serviço externo, de terceiros, integrado ao nosso projeto.
>## Marco de Entrega Final em: (08/11/2018)<br>
        
### 14  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/



    

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


