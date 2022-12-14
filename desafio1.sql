DROP DATABASE IF EXISTS SpotifyClone;

create database SpotifyClone;

create table SpotifyClone.plano(
id int primary key auto_increment,
plano_nome varchar(20) not null,
plano_valor decimal(3,2) not null
) engine = InnoDB;

create table SpotifyClone.usuario(
id int primary key auto_increment,
usuario_nome varchar(50) not null,
idade int not null,
assinatura_data date not null,
plano_id int not null,
foreign key (plano_id) references plano(id)
) engine = InnoDB;

create table SpotifyClone.artista(
id int primary key auto_increment,
artista_nome varchar(50) not null
) engine = InnoDB;

create table SpotifyClone.album(
id int primary key auto_increment,
album_nome varchar(50) not null,
lancamento_ano year not null,
artista_id int ,
foreign key (artista_id) references artista(id)
) engine = InnoDB;

create table SpotifyClone.musica(
id int primary key auto_increment,
musica_nome varchar(50) not null,
duracao int not null,
album_id int,
foreign key (album_id) references album(id)
) engine = InnoDB; 

create table SpotifyClone.reproducao(
musica_id int not null,
usuario_id int not null,
constraint primary key(musica_id, usuario_id),
foreign key (usuario_id) references musica(id),
foreign key (usuario_id) references usuario(id),
reproducao_data datetime not null
) engine = InnoDB;

create table SpotifyClone.seguidor(
usuario_id int not null,
artista_id int not null,
constraint primary key(usuario_id, artista_id),
foreign key (usuario_id) references usuario(id),
foreign key(artista_id) references artista(id)
) engine = InnoDB;

insert into SpotifyClone.plano(plano_nome,plano_valor)
values
	('gratuito',0.00),
	('pessoal',6.99),
	('universitario',5.99),
	('familiar',7.99);

insert into SpotifyClone.usuario(usuario_nome, idade, assinatura_data, plano_id)
values
	('Thati',23,'2019-10-20', 1),
	('Cintia',35,'2017-12-30', 4),
	('Bill',20,'2019-06-05', 3),
	('Roger', 45,'2020-05-13', 2),
	('Norman',58,'2017-02-17', 2),
	('Patrick',33,'2017-01-06', 4),
	('Vivian',26,'2018-01-05', 3),
	('Carol',19,'2018-02-14', 3),
	('Angelina',42,	'2018-04-29', 4),
	('Paul',46,'2017-01-17', 4);

insert into SpotifyClone.artista(artista_nome)
values
	('Walter Phoenix'),
	('Freedie Shannon'),
	('Lance Day'),
	('Peter Strong'),
	('Tyler Isle'),
	('Fog');

insert into SpotifyClone.album(album_nome, lancamento_ano, artista_id)
values
	('Envious','1990', 1),
	('Exuberant','1993', 1),
	('Hallowed Steam','1995', 4),
	('Incandescent'	,'1998', 3),
	('Temporary Culture','2001', 2),
	('Library of liberty','2003', 2),
	('Chained Down'	,'2007', 5),
	('Cabinet of fools','2012', 5),
	('No guarantees','2015', 5),
	('Apparatus','2015', 6);

insert into SpotifyClone.musica(musica_nome, duracao, album_id)
values
	('Soul For Us',	200,1),
	('Reflections Of Magic',163,1),
	('Dance With Her Own',116,1),
	('Troubles Of My Inner Fire',203,2),
	('Time Fireworks',152,2),
	('Magic Circus',105,3),
	('Honey, So Do I',207,3),
	('Sweetie, Lets Go Wild',139,3),
	('She Knows',244,3),
	('Fantasy For Me',100,4),
	('Celebration Of More',146,4),
	('Rock His Everything',223,4),
	('Home Forever',231,4),
	('Diamond Power',241,4),
	("Let's Be Silly",132,4),
	('Thang of Thunder',240,5),
	('Words Of Her Life',185,5),
	('Without My Streets',176,5),
	('Need Of The Evening',190,6),
	('History Of My Roses',222,6),
	('Without My Love',111,6),
	('Walking And Game',123,6),
	('Young And Father',197,6),
	('Finding My Traditions',179,7),
	('Walking And Man',229,7),
	('Hard And Time',135,7),
	("Honey, I'm A Lone Wolf",150,7),
	('She Thinks I Wont Stay Tonight',166,8),
	('He Heard Youre Bad For Me',154,8),
	('He Hopes We Cant Stay',210,8),
	('I Know I Know',117,8),
	('Hes Walking Away',159,9),
	('Hes Trouble',138,9),
	('I Heard I Want To Be Alone',120,9),
	('I Ride Alone',151,9),
	('Honey',79,10),
	('You Cheated On Me',95,10),
	('Wouldnt It Be Nice',213,10),
	('Baby',136,10),
	('You Make Me Feel So...',83,10);

insert into SpotifyClone.reproducao(usuario_id, musica_id, reproducao_data)
values
    (1, 36, "2020-02-28 10:45:55"),
    (1, 25, "2020-05-02 05:30:35"),
    (1, 23, "2020-03-06 11:22:33"),
    (1, 14, "2020-08-05 08:05:17"),
    (1, 15, "2020-09-14 16:32:22"),
    (2, 34, "2020-01-02 07:40:33"),
    (2, 24, "2020-05-16 06:16:22"),
    (2, 21, "2020-10-09 12:27:48"),
    (2, 39, "2020-09-21 13:14:46"),
    (3, 6, "2020-11-13 16:55:13"),
    (3, 3, "2020-12-05 18:38:30"),
    (3, 26, "2020-07-30 10:00:00"),
    (4, 2, "2021-08-15 17:10:10"),
    (4, 35, "2021-07-10 15:20:30"),
    (4, 27, "2021-01-09 01:44:33"),
    (5, 7, "2020-07-03 19:33:28"),
    (5, 12, "2017-02-24 21:14:22"),
    (5, 14, "2020-08-06 15:23:43"),
    (5, 1, "2020-11-10 13:52:27"),
    (6, 38, "2019-02-07 20:33:48"),
    (6, 29, "2017-01-24 00:31:17"),
    (6, 30, "2017-10-12 12:35:20"),
    (6, 22, "2018-05-29 14:56:41"),
    (7, 5, "2018-05-09 22:30:49"),
    (7, 4, "2020-07-27 12:52:58"),
    (7, 11, "2018-01-16 18:40:43"),
    (8, 39, "2018-03-21 16:56:40"),
    (8, 40, "2020-10-18 13:38:05"),
    (8, 32, "2019-05-25 08:14:03"),
    (8, 33, "2021-08-15 21:37:09"),
    (9, 16, "2021-05-24 17:23:45"),
    (9, 17, "2018-12-07 22:48:52"),
    (9, 8, "2021-03-14 06:14:26"),
    (9, 9, "2020-04-01 03:36:00"),
    (10, 20, "2017-02-06 08:21:34"),
    (10, 21, "2017-12-04 05:33:43"),
    (10, 12, "2017-07-27 05:24:49"),
    (10, 13, "2017-12-25 01:03:57");
        
insert into SpotifyClone.seguidor(usuario_id, artista_id)
values
	(1,	1),
	(1,	2),
	(1,	3),
	(2,	1),
	(2,	3),
	(3,	4),
	(3,	1),
	(4,	2),
	(5,	5),
	(5,	6),
	(6,	6),
	(6,	3),
	(6,	1),
	(7,	4),
	(7,	5),
	(8,	1),
	(8,	5),
	(9,	6),
	(9,	2),
	(9,	3),
	(10, 4),
	(10, 6);
