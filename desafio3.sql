# 1. A primeira coluna deve possuir o alias "**usuario**" e exibir o nome da pessoa usuária.
# 2. A segunda coluna deve possuir o alias "**qtde_musicas_ouvidas**" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.
# 3. A terceira coluna deve possuir o alias "**total_minutos**" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.
# Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.

SELECT 
    usuario.usuario_nome AS "usuario",
    COUNT(reproducao.musica_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(musica.duracao/60),2) AS total_minutos
FROM SpotifyClone.usuario
    INNER JOIN SpotifyClone.reproducao 
    ON usuario.id = reproducao.usuario_id
	  INNER JOIN SpotifyClone.musica
	  ON musica.id = reproducao.musica_id
GROUP BY usuario_nome
ORDER BY usuario_nome ASC;