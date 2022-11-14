-- Views
SELECT numero, nome, ativo
FROM banco;

-- criando 1ª view
CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);
SELECT numero, nome, ativo FROM vw_bancos;

-- criando 2ª view
CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);
SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

-- inserindo banco na 2ª view
INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco Boa Ideia', TRUE);

-- demonstração que o banco inserido na view, também foi inserido na table.
-- tudo que é realizado na view (update, delete, insert) reflete na table.
SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2 WHERE banco_numero = 51;
SELECT numero, nome, ativo FROM banco WHERE numero = 51;

-- view temporary. Só funciona na mesma seção
CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS(
	SELECT nome FROM agencia
);
SELECT nome FROM vw_agencia;

-- local check option
-- neste caso dará erro ao inserir um linha com ativo = false
CREATE OR REPLACE VIEW vw_bancos_ativos AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;
INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (52, 'Banco Boa Ideia', FALSE);

-- só é possível inserir banco que comece com a letra b
CREATE OR REPLACE VIEW vw_bancos_com_b AS(
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'b%'
) WITH LOCAL CHECK OPTION;
SELECT numero, nome, ativo FROM vw_bancos_com_b;
INSERT INTO vw_bancos_com_b (numero, nome, ativo) VALUES (53, 'Alfa banco', FALSE);


-- CASCADED
CREATE OR REPLACE VIEW vw_bancos_ativos AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
);
-- só é possível inserir banco que comece com a letra b e ativo = true (herda da tabela vw_bancos_ativos)
CREATE OR REPLACE VIEW vw_bancos_com_b AS(
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'b%'
) WITH CASCADED CHECK OPTION;
SELECT numero, nome, ativo FROM vw_bancos_com_b;
INSERT INTO vw_bancos_com_b (numero, nome, ativo) VALUES (54, 'Alfa banco', FALSE);