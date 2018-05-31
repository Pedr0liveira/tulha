CREATE TABLESPACE TulhaDB DATAFILE
'c:\oraclexe\dados_tulhadb.dbf' SIZE 50M,
'c:\oraclexe\dados_tulhadb.proj' SIZE 64M
autoextend on;

CREATE USER "Tulha"
	IDENTIFIED BY "tulha_ABD"
	DEFAULT TABLESPACE TulhaDB
	QUOTA 50M ON TulhaDB
	TEMPORARY TABLESPACE TEMP
	PASSWORD EXPIRE;

CREATE TABLE "Números Negativos"(
	"Negativos Code" VARCHAR2(10) NOT NULL,
	"Negativos Denom" VARCHAR2(50) NOT NULL UNIQUE,
	CONSTRAINT pk_negativos PRIMARY KEY ("Negativos Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Frequência Acontecimentos"(
	"Frequência Code" VARCHAR2(10) NOT NULL,
	"Frequência Denom" VARCHAR2(50) NOT NULL UNIQUE,
	CONSTRAINT pk_freq_acontecimentos PRIMARY KEY ("Frequência Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Disp Atos Disciplinares"(
	"Disp Atos Disciplinares Code" VARCHAR2(10) NOT NULL,
	"Disp Atos Disciplinares Denom" VARCHAR2(50) NOT NULL UNIQUE,
	CONSTRAINT pk_disp_atos_disciplinares PRIMARY KEY ("Disp Atos Disciplinares Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Escola"(
	"WESID" VARCHAR2(10) NOT NULL,
	"Nome Escola" VARCHAR2(50),
	CONSTRAINT pk_escola PRIMARY KEY ("WESID")
	)
    TABLESPACE TulhaDB;
	
COMMENT ON COLUMN "Escola"."WESID" IS 'Identificação única da escola';

CREATE TABLE "Informação Geral"(
	"Informação Code" VARCHAR2(10) NOT NULL,
	"Informação Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_info_geral PRIMARY KEY ("Informação Code", "WESID"),
	CONSTRAINT fk_info_geral FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Planos Emergência"(
	"Plano Code" VARCHAR2(10) NOT NULL,
	"Plano Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_planos PRIMARY KEY ("Plano Code", "WESID"),
	CONSTRAINT fk_planos FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Inquirido"(
	"Respondente Code" VARCHAR2(10) NOT NULL,
	"Respondente Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_inquirido PRIMARY KEY ("Respondente Code", "WESID"),
	CONSTRAINT fk_inquirido FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
COMMENT ON COLUMN "Inquirido"."Respondente Code" IS 'Identificação de quem responde às perguntas';
	
CREATE TABLE "Tipo Prog Formal Red Viol"(
	"Tipo Prog Formal Red Code" VARCHAR2(10) NOT NULL,
	"Tipo Prog Formal Red Denom" VARCHAR2(50),
	CONSTRAINT pk_tipo_prog_red_viol PRIMARY KEY ("Tipo Prog Formal Red Code")
	)
	TABLESPACE TulhaDB;

CREATE TABLE "Prog Formal de Red Violência"(
	"Prog Formal de Red Code" VARCHAR2(10) NOT NULL,
	"Prog Formal de Red Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Tipo Prog Formal Red Code" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_prog_red_violencia PRIMARY KEY ("Prog Formal de Red Code", "WESID"),
	CONSTRAINT fk_prog_red_violencia_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID"),
    CONSTRAINT fk_prog_red_violencia FOREIGN KEY ("Tipo Prog Formal Red Code") REFERENCES "Tipo Prog Formal Red Viol" ("Tipo Prog Formal Red Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Outros Prog de Red de Viol"(
	"Outros Prog de Red Code" VARCHAR2(10) NOT NULL,
	"Outros Prog de Red Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_outros_prog_red PRIMARY KEY ("Outros Prog de Red Code", "WESID"),
	CONSTRAINT fk_outros_programas_reducao FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Modificações Red Violência"(
	"Modificações Code" VARCHAR2(10) NOT NULL,
	"Modificações Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_modificacoes_red PRIMARY KEY ("Modificações Code", "WESID"),
	CONSTRAINT fk_modificacoes_red FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Ajudar Pais"(
	"Ajudar Pais Code" VARCHAR2(10) NOT NULL,
	"Ajudar Pais Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_ajudar_pais PRIMARY KEY ("Ajudar Pais Code", "WESID"),
	CONSTRAINT fk_ajudar_pais FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Segurança Paga"(
	"Segurança Paga Code" VARCHAR2(10) NOT NULL,
	"Segurança Paga Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	CONSTRAINT pk_seguranca_paga PRIMARY KEY ("Segurança Paga Code", "WESID"),
	CONSTRAINT fk_seguranca_paga FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Outra Segurança"(
	"Outra Segurança Code" VARCHAR2(10) NOT NULL,
	"Outra Segurança Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_outra_seguranca PRIMARY KEY ("Outra Segurança Code", "WESID"),
	CONSTRAINT fk_outra_seguranca FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Média Horas de Segurança"(
	"Num Médio Horas de Segurança" NUMBER NOT NULL,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_media_horas_seg PRIMARY KEY ("WESID"),
	CONSTRAINT fk_media_horas_seg FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;

CREATE TABLE "Treino de Sinais de Violência"(
	"Bool Code" VARCHAR2(5) NOT NULL CHECK ("Bool Code" = 'Yes' OR "Bool Code" = 'No'),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_treino_sinais_violencia PRIMARY KEY ("WESID"),
	CONSTRAINT fk_treino_sinais_violencia FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Num Professores Treinados"(
	"Negativos Code" VARCHAR2(10),
	"Num de Professores Treinados" NUMBER NOT NULL,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_num_profs_treinados PRIMARY KEY ("WESID"),
	CONSTRAINT fk_num_profs_treinados FOREIGN KEY ("Negativos Code") REFERENCES "Números Negativos" ("Negativos Code"),
	CONSTRAINT fk_num_profs_treinados_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Num Médio Horas Treino"(
	"Negativos Code" VARCHAR2(10),
	"WESID" VARCHAR2(10) NOT NULL,
	"Num Médio Horas Treino" NUMBER NOT NULL,
	CONSTRAINT pk_num_medio_horas_treino PRIMARY KEY ("WESID"),
	CONSTRAINT fk_num_medio_horas_treino FOREIGN KEY ("Negativos Code") REFERENCES "Números Negativos" ("Negativos Code"),
	CONSTRAINT fk_num_medio_treino_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Esforços Limitados"(
	"Esforços Code" VARCHAR2(10) NOT NULL,
	"Esforços Denom" VARCHAR2(50) NOT NULL,
	CONSTRAINT pk_esforcos_limitados PRIMARY KEY ("Esforços Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Treino Limitado"(
	"Treino Limitado Code" VARCHAR2(10) NOT NULL,
	"Treino Limitado Denom" VARCHAR2(50),
	"Esforços Code" VARCHAR2(10),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_treino_limitado PRIMARY KEY ("Treino Limitado Code", "WESID"),
	CONSTRAINT fk_treino_limitado FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID"),
	CONSTRAINT fk_treino_limitado_esforço FOREIGN KEY ("Esforços Code") REFERENCES "Esforços Limitados" ("Esforços Code")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Mortes Esc Causas Violentas"(
	"Tipo de Morte Code" VARCHAR2(10) NOT NULL,
	"Tipo de Morte Denom" VARCHAR2(50),
	"Tipo de Morte Número" NUMBER,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_mortes_esc_causas_violentas PRIMARY KEY ("Tipo de Morte Code", "WESID"),
	CONSTRAINT fk_mortes_esc_causas_violentas FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Tiroteios Escolares"(
	"Tipo de Tiroteio Code" VARCHAR2(10) NOT NULL,
	"Tipo de Tiroteio Denom" VARCHAR2(50),
	"Tipo de Tiroteio Número" NUMBER,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_tiroteios_escolares PRIMARY KEY ("Tipo de Tiroteio Code", "WESID"),
	CONSTRAINT fk_tiroteios_escolares FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Outros Incidentes"(
	"Outros Incidentes Code" VARCHAR2(10) NOT NULL,
	"Outros Incidentes Denom" VARCHAR2(50),
	"Outros Incidentes Número" NUMBER,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_outros_incidentes PRIMARY KEY ("Outros Incidentes Code", "WESID"),
	CONSTRAINT fk_outros_incidentes FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Num Vezes Escola Interrompida"(
	"Num Vezes Escola Int Code" VARCHAR2(10) NOT NULL,
	"Num Vezes Escola Int Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_num_vezes_escola_int PRIMARY KEY ("Num Vezes Escola Int Code", "WESID"),
	CONSTRAINT fk_num_vezes_escola_int FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Freq de Problemas"(
	"Freq de Problemas Code" VARCHAR2(10) NOT NULL,
	"Freq de Problemas Denom" VARCHAR2(50),
	"Frequência Code" VARCHAR2(10),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_freq_problemas PRIMARY KEY ("Freq de Problemas Code", "WESID"),
	CONSTRAINT fk_freq_problemas FOREIGN KEY ("Frequência Code") REFERENCES "Frequência Acontecimentos" ("Frequência Code"),
	CONSTRAINT fk_freq_problemas_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Atos Disciplinares"(
	"Atos Disciplinares Code" VARCHAR2(10) NOT NULL,
	"Atos Disciplinares Denom" VARCHAR2(50),
	"Disp Atos Disciplinares Code" VARCHAR2(10),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_atos_disciplinares PRIMARY KEY ("Atos Disciplinares Code", "WESID"),
	CONSTRAINT fk_atos_disciplinares FOREIGN KEY ("Disp Atos Disciplinares Code") REFERENCES "Disp Atos Disciplinares" ("Disp Atos Disciplinares Code"),
	CONSTRAINT fk_atos_disciplinares_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Expulsão ou Suspensão"(
	"Tipo Expulsão Suspen Code" VARCHAR2(10) NOT NULL,
	"Tipo Expulsão Suspen Denom" VARCHAR2(50),
	"Num Expulsão Suspensão" NUMBER,
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_expulsao_suspensao PRIMARY KEY ("Tipo Expulsão Suspen Code", "WESID"),
	CONSTRAINT fk_expulsao_suspensao FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Informação Percentagem"(
	"Informação Percentagem Code" VARCHAR2(10) NOT NULL,
	"Informação Percentagem Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_informacao_percentagem PRIMARY KEY ("Informação Percentagem Code", "WESID"),
	CONSTRAINT fk_informacao_percentagem FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Crimes Estudantes Vivem"(
	"Crimes Estudantes Vivem Code" VARCHAR2(10) NOT NULL,
	"Crimes Estudantes Vivem Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_crimes_estudantes_vivem PRIMARY KEY ("Crimes Estudantes Vivem Code", "WESID"),
	CONSTRAINT fk_crimes_estudantes_vivem FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;
	
CREATE TABLE "Tipo de Escola"(
	"Tipo Escola Code" VARCHAR2(10) NOT NULL,
	"Tipo Escola Denom" VARCHAR2(50),
	"WESID" VARCHAR2(10) NOT NULL,
	CONSTRAINT pk_tipo_escola PRIMARY KEY ("Tipo Escola Code", "WESID"),
	CONSTRAINT fk_tipo_escola FOREIGN KEY ("WESID") REFERENCES "Escola" ("WESID")
	)
	TABLESPACE TulhaDB;

	
	