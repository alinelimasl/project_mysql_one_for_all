SELECT
    ar.artista_nome AS artista,
    al.album_nome AS album,
    COUNT(se.artista_id) AS pessoas_seguidoras
FROM artista AS ar
INNER JOIN album al ON ar.artista_id = al.artista_id
LEFT JOIN seguindo_artistas se ON ar.artista_id = se.artista_id
GROUP BY ar.artista_nome, al.album_nome
ORDER BY pessoas_seguidoras DESC, ar.artista_nome ASC, al.album_nome ASC;
