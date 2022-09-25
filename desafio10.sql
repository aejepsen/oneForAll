select 
  musica.musica_nome as 'nome', 
  count(reproducao.musica_id) as 'reproducoes'
from SpotifyClone.musica
inner join SpotifyClone.reproducao
on musica.id = reproducao.musica_id
inner join SpotifyClone.usuario
on reproducao.usuario_id = usuario.id where usuario.plano_id in(1,2)
group by musica_nome
order by musica.musica_nome;