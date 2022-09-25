#Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de #seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma `QUERY` com as #seguintes colunas:

#1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "**artista**".

#2. A segunda coluna deve exibir o nome do álbum, com o alias "**album**".

#3 A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista #possui e deve possuir o alias "**seguidores**".

#Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas #seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa #artista em ordem alfabética e caso há artistas com o mesmo nome, ordene os resultados pelo nome #do álbum alfabeticamente.

select ANY_VALUE(artista.artista_nome) as 'artista', 
album.album_nome as 'album', 
count(seguidor.usuario_id) as 'seguidores'
from SpotifyClone.artista
inner join SpotifyClone.album
on artista.id = album.artista_id
inner join SpotifyClone.seguidor
on album.artista_id = seguidor.artista_id
group by album.album_nome
order by count(seguidor.usuario_id) desc, 
ANY_VALUE(artista.artista_nome), album.album_nome;