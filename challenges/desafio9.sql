SELECT 
    COUNT(*) AS musicas_no_historico 
FROM historico_reproducao 
WHERE pessoa_usuaria_id = '1'