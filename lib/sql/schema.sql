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
--Συνάρτηση που προσθέτει τις κάρτες στην τράπουλα
DELIMITER //
  CREATE PROCEDURE create_Card(in card_number INT, IN card_symbol VARCHAR)
  BEGIN 
  --Αριθμός και σύμβολο
  INSERT INTO Deck (Num,Symbol) VALUES (card_number,card_symbol);
  END //
DELIMITER;





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


CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `result` enum('Equal','Win','Defeat') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
)
  
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
  ('not active', '1', 'Win', '2022-11-08 18:57:40');

drop table `players`;
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
	

	
drop procedure create_Card;

DELIMITER $$
  CREATE PROCEDURE create_Card(in num varchar(1), IN symbol VARCHAR(8))
  BEGIN 
  INSERT INTO Deck (card_number,card_symbol) VALUES (num,symbol);
  END $$
DELIMITER;

drop table Deck;

CREATE TABLE  Deck(
  card_id INT PRIMARY KEY AUTO_INCREMENT,
  card_number enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K') NOT NULL,
  card_symbol enum ('clubs','diamonds','spades','hearts') NOT NULL
);

drop procedure new_Deck;

DELIMITER $$
CREATE PROCEDURE new_Deck()
BEGIN 
drop table Deck;
CALL create_Card('1','spades');
CALL create_Card('2','spades');
CALL create_Card('3','spades');
CALL create_Card('4','spades');
CALL create_Card('5','spades');
CALL create_Card('6','spades');
CALL create_Card('7','spades');
CALL create_Card('8','spades');
CALL create_Card('9','spades');
CALL create_Card('10','spades');
CALL create_Card('J','spades');
CALL create_Card('Q','spades');
CALL create_Card('K','spades'); 
CALL create_Card('1','clubs');
CALL create_Card('2','clubs');
CALL create_Card('3','clubs');
CALL create_Card('4','clubs');
CALL create_Card('5','clubs');
CALL create_Card('6','clubs');
CALL create_Card('7','clubs');
CALL create_Card('8','clubs');
CALL create_Card('9','clubs');
CALL create_Card('10','clubs');
CALL create_Card('J','clubs');
CALL create_Card('Q','clubs');
CALL create_Card('K','clubs'); 
CALL create_Card('1','hearts');
CALL create_Card('2','hearts');
CALL create_Card('3','hearts');
CALL create_Card('4','hearts');
CALL create_Card('5','hearts');
CALL create_Card('6','hearts');
CALL create_Card('7','hearts');
CALL create_Card('8','hearts');
CALL create_Card('9','hearts');
CALL create_Card('10','hearts');
CALL create_Card('J','hearts');
CALL create_Card('Q','hearts');
CALL create_Card('K','hearts'); 
CALL create_Card('1','diamonds');
CALL create_Card('2','diamonds');
CALL create_Card('3','diamonds');
CALL create_Card('4','diamonds');
CALL create_Card('5','diamonds');
CALL create_Card('6','diamonds');
CALL create_Card('7','diamonds');
CALL create_Card('8','diamonds');
CALL create_Card('9','diamonds');
CALL create_Card('10','diamonds');
CALL create_Card('J','diamonds');
CALL create_Card('Q','diamonds');
CALL create_Card('K','diamonds'); 
END $$
DELIMITER;

CALL new_Deck;

--foreing key fix 
CREATE table board(
   card tinyint foreign key,
   pos tinyint enum (1,2,3,4),
   FOREIGN KEY card REFERENCES Deck(card_id)
)
--function shuffle random
DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffle(poss VARCHAR(1))
  BEGIN
  Declare card1 tinyint;  
  set card1 :=(SELECT card_id FROM Deck ORDER BY RAND() LIMIT 1 );
  INSERT INTO board (card,pos) VALUES (card1,poss);
  delete from deck where card_id=card1;
  END $$
  
DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffleAll()
  BEGIN
	DECLARE a INT Default 1 ;
      simple_loop: LOOP
         call shuffle('1');
         SET a=a+1;
         IF a=26 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
   DECLARE b INT Default 1 ;
      simple_loop: LOOP
         call shuffle('2');
         SET b=b+1;
         IF b=26 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
  END $$
