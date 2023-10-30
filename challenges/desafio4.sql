SELECT
  pes.nome_pessoa_usuaria AS pessoa_usuaria,
  CASE
    WHEN MAX(his.data_reproducao) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM pessoa_usuaria AS pes
LEFT JOIN historico_reproducao AS his ON pes.pessoa_usuaria_id = his.pessoa_usuaria_id
GROUP BY pes.nome_pessoa_usuaria
ORDER BY pes.nome_pessoa_usuaria;

