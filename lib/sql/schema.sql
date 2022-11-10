create or replace table karta
(
id tinyint primary key,
timh tinyint NOT NULL,
arithmos enum ('ena', 'duo', 'tria', 'tessera', 'pente', 'eksi', 'efta', 'oxto', 'ennea', 'deka', 'rigas', 'ntama', 'papas', 'joker') NOT NULL,
symboloarithmou char(2) NOT NULL,
xrwma enum ('kokkino', 'mauro', 'joker') NOT NULL,
seira enum ('koupa', 'karo', 'spathi', 'mpastouni', 'joker') NOT NULL,
eikona char(20) NOT NULL,
constraint id_range check (`id` >= 0 and `id` <= 54),
constraint timh_range check (`timh` > 0 and `timh` <= 14)
);


--ace_of_hearts-> https://legendmod.ml/adise/ace_of_spades.png
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (1, 1, 'ena', 'A', 'kokkino', 'koupa', 'ace_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (2, 2, 'duo', '2', 'kokkino', 'koupa', '2_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (3, 3, 'tria', '3', 'kokkino', 'koupa', '3_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (4, 4, 'tessera', '4', 'kokkino', 'koupa', '4_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (5, 5, 'pente', '5', 'kokkino', 'koupa', '5_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (6, 6, 'eksi', '6', 'kokkino', 'koupa', '6_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (7, 7, 'efta', '7', 'kokkino', 'koupa', '7_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (8, 8, 'oxto', '8', 'kokkino', 'koupa', '8_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (9, 9, 'ennea', '9', 'kokkino', 'koupa', '9_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (10, 10, 'deka', '10', 'kokkino', 'koupa', '10_of_hearts');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (11, 11, 'rigas', 'J', 'kokkino', 'koupa', 'jack_of_hearts2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (12, 12, 'ntama', 'Q', 'kokkino', 'koupa', 'queen_of_hearts2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (13, 13, 'papas', 'K', 'kokkino', 'koupa', 'king_of_hearts2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (14, 1, 'ena', 'A', 'kokkino', 'karo', 'ace_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (15, 2, 'duo', '2', 'kokkino', 'karo', '2_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (16, 3, 'tria', '3', 'kokkino', 'karo', '3_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (17, 4, 'tessera', '4', 'kokkino', 'karo', '4_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (18, 5, 'pente', '5', 'kokkino', 'karo', '5_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (19, 6, 'eksi', '6', 'kokkino', 'karo', '6_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (20, 7, 'efta', '7', 'kokkino', 'karo', '7_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (21, 8, 'oxto', '8', 'kokkino', 'karo', '8_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (22, 9, 'ennea', '9', 'kokkino', 'karo', '9_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (23, 10, 'deka', '10', 'kokkino', 'karo', '10_of_diamonds');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (24, 11, 'rigas', 'J', 'kokkino', 'karo', 'jack_of_diamonds2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (25, 12, 'ntama', 'Q', 'kokkino', 'karo', 'queen_of_diamonds2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (26, 13, 'papas', 'K', 'kokkino', 'karo', 'king_of_diamonds2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (27, 1, 'ena', 'A', 'mauro', 'spathi', 'ace_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (28, 2, 'duo', '2', 'mauro', 'spathi', '2_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (29, 3, 'tria', '3', 'mauro', 'spathi', '3_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (30, 4, 'tessera', '4', 'mauro', 'spathi', '4_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (31, 5, 'pente', '5', 'mauro', 'spathi', '5_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (32, 6, 'eksi', '6', 'mauro', 'spathi', '6_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (33, 7, 'efta', '7', 'mauro', 'spathi', '7_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (34, 8, 'oxto', '8', 'mauro', 'spathi', '8_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (35, 9, 'ennea', '9', 'mauro', 'spathi', '9_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (36, 10, 'deka', '10', 'mauro', 'spathi', '10_of_clubs');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (37, 11, 'rigas', 'J', 'mauro', 'spathi', 'jack_of_clubs2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (38, 12, 'ntama', 'Q', 'mauro', 'spathi', 'queen_of_clubs2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (39, 13, 'papas', 'K', 'mauro', 'spathi', 'king_of_clubs2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (40, 1, 'ena', 'A', 'mauro', 'mpastouni', 'ace_of_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (41, 2, 'duo', '2', 'mauro', 'mpastouni', '2_of_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (42, 3, 'tria', '3', 'mauro', 'mpastouni', '3_of_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (43, 4, 'tessera', '4', 'mauro', 'mpastouni', '4_of_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (44, 5, 'pente', '5', 'mauro', 'mpastouni', '5_of_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (45, 6, 'eksi', '6', 'mauro', 'mpastouni', '6_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (46, 7, 'efta', '7', 'mauro', 'mpastouni', '7_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (47, 8, 'oxto', '8', 'mauro', 'mpastouni', '8_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (48, 9, 'ennea', '9', 'mauro', 'mpastouni', '9_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (49, 10, 'deka', '10', 'mauro', 'mpastouni', '10_spades');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (50, 11, 'rigas', 'J', 'mauro', 'mpastouni', 'jack_of_spades2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (51, 12, 'ntama', 'Q', 'mauro', 'mpastouni', 'queen_of_spades2');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (52, 13, 'papas', 'K', 'mauro', 'mpastouni', 'king_of_spades2');

INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (53, 14, 'joker', 'W', 'joker', 'joker', 'red_joker.png');
INSERT INTO karta (id, timh, arithmos, symboloarithmou, xrwma, seira, eikona) VALUES (54, 14, 'joker', 'W', 'joker', 'joker', 'black_joker.png');

CREATE TABLE IF NOT EXISTS `hand` (	
	`user` varchar(20) primary key,
        `pos` tinyint NOT NULL,
	`idcard` tinyint
)	

CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `result` enum('Equal','Win','Defeat') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)
  
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
  ('not active', '1', 'Win', '2022-11-08 18:57:40');


CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `side` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`side`)
)

INSERT INTO `players` (`username`, `side`, `token`, `last_action`) VALUES
	(NULL, '1', NULL, NULL),
	(NULL, '2', NULL, NULL);
	
	
