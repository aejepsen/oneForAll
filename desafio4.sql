#1. A primeira coluna deve possuir o alias "**usuario**" e exibir o nome da pessoa usuária.

#2. A segunda coluna deve ter o alias "**condicao_usuario**" e exibir se a pessoa usuária está ativa ou inativa.

SELECT SpotifyClone.usuario.usuario_nome AS 'usuario', 
IF( ANY_VALUE(year(reproducao.reproducao_data)) = 2021, 
'Usuário ativo', 
'Usuário inativo') AS 'condicao_usuario'
FROM SpotifyClone.usuario
LEFT JOIN  SpotifyClone.reproducao 
ON usuario.id = reproducao.usuario_id AND year(reproducao.reproducao_data) = 2021
GROUP BY usuario.usuario_nome
ORDER BY usuario.usuario_nome;
