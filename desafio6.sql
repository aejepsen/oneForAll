SELECT 
  round(min(plano.plano_valor),2) AS 'faturamento_minimo', 
  round(max(plano.plano_valor),2) AS 'faturamento_maximo', 
  round(avg(plano.plano_valor),2) AS 'faturamento_medio', 
  round(sum(plano.plano_valor),2) AS 'faturamento_total'
FROM SpotifyClone.plano
INNER JOIN SpotifyClone.usuario
ON usuario.plano_id = plano.id