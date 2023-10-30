SELECT
    ca.cancao_nome AS cancao,
    COUNT(1) AS reproducoes
FROM cancoes AS ca
INNER JOIN historico_reproducao AS his ON ca.cancao_id = his.cancao_id
GROUP BY ca.cancao_nome
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
