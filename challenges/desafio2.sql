SELECT 
    COUNT(DISTINCT c.cancao_id) AS cancoes,
    COUNT(DISTINCT a.artista_id) AS artistas,
    COUNT(DISTINCT al.album_id) AS albuns
FROM
cancoes AS c
INNER JOIN artista a ON c.artista_id = a.artista_id
INNER JOIN album al ON c.album_id = al.album_id;
