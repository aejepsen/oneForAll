SELECT
  (SELECT COUNT(musica_nome) FROM SpotifyClone.musica) AS cancoes,
  (SELECT COUNT(artista_nome) FROM SpotifyClone.artista) AS artistas,
  (SELECT COUNT(album_nome) FROM SpotifyClone.album) AS albuns;