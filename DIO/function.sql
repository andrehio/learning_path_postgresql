CREATE OR REPLACE FUNCTION func_somar(INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
-- RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT $1 + $2;
$$;

SELECT func_somar(1,null);


-- COALESCE: Avalia os argumentos na ordem e retorna o valor atual 
-- da primeira expressão que não é avaliada como NULL inicialmente.
SELECT COALESCE(NULL, NULL, 'third_value', 'fourth_value');

--------------------------------------
-- Usar idempotencia com COALESCE
CREATE OR REPLACE FUNCTION func_somar2(INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
-- RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT COALESCE($1, 0) + COALESCE($2, 0);
$$;

SELECT func_somar2(1,null);

--------------------------------------


