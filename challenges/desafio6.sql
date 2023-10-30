SELECT
  ROUND(MIN(valor_plano), 2) AS faturamento_minimo,
  ROUND(MAX(valor_plano), 2) AS faturamento_maximo,
  ROUND(AVG(valor_plano), 2) AS faturamento_medio,
  ROUND(SUM(valor_plano), 2) AS faturamento_total
FROM pessoa_usuaria pes
INNER JOIN plano pla ON pes.plano_id = pla.plano_id;

