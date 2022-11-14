SELECT numero, nome, ativo FROM banco ORDER BY numero ASC;
UPDATE banco SET ativo = false WHERE numero = 0;

-- transação com rollback. para entender a atividade, rodar cada linha entre 5 e 8.
-- rollback volta para o ultimo commit ou savepoint
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
ROLLBACK;

-- commit
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
COMMIT;