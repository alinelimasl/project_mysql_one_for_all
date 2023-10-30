SELECT
    pes.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(his.cancao_id) AS musicas_ouvidas,
    ROUND((SUM(can.duracao_segundos)) / 60,2) AS total_minutos
FROM pessoa_usuaria AS pes

INNER JOIN historico_reproducao AS his ON pes.pessoa_usuaria_id = his.pessoa_usuaria_id

INNER JOIN cancoes AS can ON his.cancao_id = can.cancao_id

GROUP BY pessoa_usuaria

ORDER BY pessoa_usuaria;