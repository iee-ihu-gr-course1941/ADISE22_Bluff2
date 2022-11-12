
/* */
SET SQL_SAFE_UPDATES = 0;

DELIMITER $$
CREATE OR REPLACE PROCEDURE new_game_status()
BEGIN 
DROP TABLE IF EXISTS game_status;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `result` enum('Equal','Win','Defeat') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);
END $$
call new_game_status();
  
-- INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES ('not active', '1', 'Win', '2022-11-08 18:57:40');


DELIMITER $$
CREATE OR REPLACE PROCEDURE new_players()
BEGIN 
drop table IF EXISTS `players`;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `side` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`side`)
);
END $$
call new_players();


-- INSERT INTO `players` (`username`, `side`, `token`, `last_action`) VALUES (NULL, '1', NULL, NULL), (NULL, '2', NULL, NULL);

DELIMITER $$
CREATE OR REPLACE PROCEDURE new_tablo()
BEGIN 
drop table IF EXISTS tablo;
CREATE OR REPLACE TABLE tablo(
   tablocard_id INT PRIMARY KEY AUTO_INCREMENT,
   card tinyint,
   pos enum ('1','2','3','4')
);
END $$
call new_tablo();

	
DELIMITER $$
  CREATE OR REPLACE PROCEDURE create_Card(in num varchar(1), IN symbol VARCHAR(8), IN eikona VARCHAR(20))
  BEGIN 
  INSERT INTO trapoula (card_number,card_symbol, card_icon) VALUES (num,symbol, eikona);
  END $$

DELIMITER $$
CREATE OR REPLACE PROCEDURE createtrapoulaTable()
BEGIN
CREATE OR REPLACE TABLE  trapoula(
  card_id INT PRIMARY KEY AUTO_INCREMENT,
  card_number enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K') NOT NULL,
  card_symbol enum ('clubs','diamonds','spades','hearts') NOT NULL,
  card_icon VARCHAR(20) NOT NULL
);
 END $$
 call createtrapoulaTable();
 
DELIMITER $$
CREATE OR REPLACE PROCEDURE new_trapoula()
BEGIN 
drop table if exists trapoula;
call createtrapoulaTable();

CALL create_Card('1','spades', 'ace_of_spades');
CALL create_Card('2','spades', '2_of_spades');
CALL create_Card('3','spades', '3_of_spades');
CALL create_Card('4','spades', '4_of_spades');
CALL create_Card('5','spades', '5_of_spades');
CALL create_Card('6','spades', '6_of_sspades');
CALL create_Card('7','spades', '7_of_spades');
CALL create_Card('8','spades', '8_of_spades');
CALL create_Card('9','spades', '9_of_spades');
CALL create_Card('10','spades', '10_of_spades');
CALL create_Card('J','spades', 'jack_of_spades2');
CALL create_Card('Q','spades', 'queen_of_spades2');
CALL create_Card('K','spades','king_of_spades2'); 
CALL create_Card('1','clubs', 'ace_of_clubs');
CALL create_Card('2','clubs', '2_of_clubs');
CALL create_Card('3','clubs', '3_of_clubs');
CALL create_Card('4','clubs', '4_of_clubs');
CALL create_Card('5','clubs', '5_of_clubs');
CALL create_Card('6','clubs', '6_of_clubs');
CALL create_Card('7','clubs', '7_of_clubs');
CALL create_Card('8','clubs', '8_of_clubs');
CALL create_Card('9','clubs', '9_of_clubs');
CALL create_Card('10','clubs', '10_of_clubs');
CALL create_Card('J','clubs', 'jack_of_clubs2');
CALL create_Card('Q','clubs', 'queen_of_clubs2');
CALL create_Card('K','clubs', 'king_of_clubs2'); 
CALL create_Card('1','hearts', 'ace_of_hearts');
CALL create_Card('2','hearts', '2_of_hearts');
CALL create_Card('3','hearts', '3_of_hearts');
CALL create_Card('4','hearts', '4_of_hearts');
CALL create_Card('5','hearts', '5_of_hearts');
CALL create_Card('6','hearts', '6_of_hearts');
CALL create_Card('7','hearts', '7_of_hearts');
CALL create_Card('8','hearts', '8_of_hearts');
CALL create_Card('9','hearts', '9_of_hearts');
CALL create_Card('10','hearts', '10_of_hearts');
CALL create_Card('J','hearts', 'jack_of_hearts2');
CALL create_Card('Q','hearts', 'queen_of_hearts2');
CALL create_Card('K','hearts', 'king_of_hearts2'); 
CALL create_Card('1','diamonds', 'ace_of_diamonds');
CALL create_Card('2','diamonds', '2_of_diamonds');
CALL create_Card('3','diamonds', '3_of_diamonds');
CALL create_Card('4','diamonds', '4_of_diamonds');
CALL create_Card('5','diamonds', '5_of_diamonds');
CALL create_Card('6','diamonds', '6_of_diamonds');
CALL create_Card('7','diamonds', '7_of_diamonds');
CALL create_Card('8','diamonds', '8_of_diamonds');
CALL create_Card('9','diamonds', '9_of_diamonds');
CALL create_Card('10','diamonds', '10_of_diamonds');
CALL create_Card('J','diamonds', 'jack_of_hearts2');
CALL create_Card('Q','diamonds', 'queen_of_hearts2');
CALL create_Card('K','diamonds', 'king_of_hearts2'); 
END $$

CALL new_trapoula();

--function shuffle random
DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffle(poss VARCHAR(1))
  BEGIN
  Declare card1 tinyint;  
  set card1 :=(SELECT card_id FROM trapoula ORDER BY RAND() LIMIT 1 );
  INSERT INTO tablo (card,pos) VALUES (card1,poss);
  delete from trapoula where card_id=card1;
  END $$


  
DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffleAll()
  BEGIN
	  drop table if exists tablo;
      call new_tablo();
	  call new_trapoula();
      SET @a = 0;
      simple_loop: LOOP
		 call shuffle('1');
         SET @a=@a+1;
         IF @a=26 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
         SET @a = 0;
      simple_loop: LOOP
		 call shuffle('2');
         SET @a=@a+1;
         IF @a=26 THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
   call new_trapoula(); 
 END $$


DELIMITER $$
  CREATE OR REPLACE PROCEDURE passFinal() 
  BEGIN 

  DELETE FROM tablo WHERE pos = 3;
  DELETE FROM tablo WHERE pos = 4;
 END $$  
 
DELIMITER $$
  CREATE OR REPLACE PROCEDURE takeBackAll(playerID varchar(1)) --Dinei ston paikth ola ta fylla pou einai katw
  BEGIN
	UPDATE tablo SET pos = playerID WHERE pos = '3';
	UPDATE tablo SET pos = playerID WHERE pos = '4';
 END $$  
 
  /*Parametros einai o arithmos pou dhlwse o paikths sthn arxh toy guroy*/
DELIMITER $$
  CREATE OR REPLACE PROCEDURE bluffOnCard(DeclaredNumber varchar(1)) 
  BEGIN
	DECLARE isExist tinyint;
    SET isExist = 0;
	
    SELECT EXISTS(    
	SELECT tr.card_number
    from tablo t natural join trapoula tr
    where t.pos='4' and t.card=tr.card_id and tr.card_number=DeclaredNumber
    ) INTO isExist;
    select isExist;
END $$

DELIMITER $$
  CREATE OR REPLACE PROCEDURE bluffOnCard(DeclaredNumber varchar(1)) 
  BEGIN

	SELECT count(tr.card_number)
    from tablo t natural join trapoula tr
    where t.pos='4' and t.card=tr.card_id and tr.card_number=DeclaredNumber;
    union 
    SELECT count(tr.card_number)
    from tablo t natural join trapoula tr
    where t.pos='4' and t.card=tr.card_id ;
END $$



DELIMITER $$
  CREATE OR REPLACE PROCEDURE move(cardd tinyint)
  BEGIN 
	UPDATE tablo SET pos = '4' WHERE card = cardd; 
    
 END $$
 
 /*h endMoves kalleite gia ka8e paikth otan teliwsei na rixnei kartes*/
 DELIMITER $$
  CREATE OR REPLACE PROCEDURE pass() 
  BEGIN
	update tablo set pos = '3' WHERE pos = '4';
  END $$ 
  
SET SQL_SAFE_UPDATES = 0;
select * from tablo;
select * from trapoula;
