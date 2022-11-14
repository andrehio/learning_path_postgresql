SELECT numero, nome FROM banco
ORDER BY numero;

SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor FROM cliente_transacoes;

SELECT count(1) FROM banco; -- conta o numero de bancos. São 151 bancos
SELECT count(1) FROM agencia; -- conta o numero de agencias. São 296 agencias

-- Retorna 296 linhas
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- Quantos bancos tem agencia?
SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

-- LEFT JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

-- RIGHT JOIN
SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

-- FULL JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

-- CROSS JOIN
SELECT banco.nome, agencia.nome
FROM banco
CROSS JOIN agencia;

SELECT banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero;