--Pedro Oliveira, Nº35480
--Raúl Oliveira, Nº36240
--------------------------------------------------------------
--															--
--				Role Tratamento de Questionários.			--
--															--
--------------------------------------------------------------

CREATE ROLE TratamentoDeQuestionarios;

--Tabela Informação Geral

GRANT SELECT ON Tulha."Informação Geral" TO TratamentoDeQuestionarios;

--Tabela Tiroteios Escolares

GRANT SELECT ON Tulha."Tiroteios Escolares" TO TratamentoDeQuestionarios;

--Tabela Tipo de Escola

GRANT SELECT ON Tulha."Tipo de Escola" TO TratamentoDeQuestionarios;

--------------------------------------------------------------
--															--
--				Role Recolha e Inserção de Dados.			--
--															--
--------------------------------------------------------------

CREATE ROLE RecolhaInsercaoDados;

--Tabela Informação Geral

GRANT SELECT ON Tulha."Informação Geral" TO RecolhaInsercaoDados;

GRANT INSERT ON Tulha."Informação Geral" TO RecolhaInsercaoDados;

GRANT UPDATE ON Tulha."Informação Geral" TO RecolhaInsercaoDados;

--Tabela Escola

GRANT SELECT ON Tulha."Escola" TO RecolhaInsercaoDados;

GRANT INSERT ON Tulha."Escola" TO RecolhaInsercaoDados;

GRANT UPDATE ON Tulha."Escola" TO RecolhaInsercaoDados;

--Tabela Inquirido

GRANT SELECT ON Tulha."Inquirido" TO RecolhaInsercaoDados;

GRANT INSERT ON Tulha."Inquirido" TO RecolhaInsercaoDados;

GRANT UPDATE ON Tulha."Inquirido" TO RecolhaInsercaoDados;

-- Tabela Tiroteios Escolares

GRANT SELECT ON Tulha."Tiroteios Escolares" TO RecolhaInsercaoDados;

GRANT INSERT ON Tulha."Tiroteios Escolares" TO RecolhaInsercaoDados;

GRANT UPDATE ON Tulha."Tiroteios Escolares" TO RecolhaInsercaoDados;

--Tabela Tipo de Escola

GRANT SELECT ON Tulha."Tipo de Escola" TO RecolhaInsercaoDados;

GRANT INSERT ON Tulha."Tipo de Escola" TO RecolhaInsercaoDados;

GRANT UPDATE ON Tulha."Tipo de Escola" TO RecolhaInsercaoDados;

--------------------------------------------------------------
--															--
--					Role Informação Escolas.				--
--															--
--------------------------------------------------------------

CREATE ROLE InfoEscolas;

--Tabela Informação Geral

CREATE VIEW InfoEscolasGeral AS
	SELECT 	"Informação Code",
			"WESID",
			"Bool Code"
	FROM Tulha."Informação Geral";

GRANT SELECT ON InfoEscolasGeral TO InfoEscolas;

--Tabela Escola

GRANT SELECT ON Tulha."Escola" TO InfoEscolas;

--Tabela Inquirido

GRANT SELECT ON Tulha."Inquirido" TO InfoEscolas;