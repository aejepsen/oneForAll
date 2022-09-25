select 
  artista.artista_nome as 'artista', 
  album.album_nome as 'album'
from SpotifyClone.artista
inner join SpotifyClone.album
on artista.id = album.artista_id and artista.artista_nome = 'Walter Phoenix';