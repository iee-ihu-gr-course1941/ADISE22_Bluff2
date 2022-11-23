-- --------------------------------------------------------
-- Διακομιστής:                  127.0.0.1
-- Έκδοση διακομιστή:            10.4.25-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

-- Dumping structure for procedure test.bluffOnCard
DELIMITER //
CREATE PROCEDURE `bluffOnCard`()
BEGIN
	DECLARE DeclaredNumber varchar(2);
	DECLARE metablhth varchar(2);
	SELECT `declared_number` into DeclaredNumber from game_status;
	select ( sum(cardNumber <> DeclaredNumber) ) as metablhth
	from tablo	
	where pos='4';	
	IF (metablhth > 0) THEN 
	update game_status set p_turn=if(p_turn='1','2','1');
	CALL takeBackAll();
	ELSE
	CALL takeBackAll();
	END IF;
END//
DELIMITER ;

-- Dumping structure for procedure test.checkVictory
DELIMITER //
CREATE PROCEDURE `checkVictory`(out stat int)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE Message varchar(20);
    DECLARE player varchar(1);
    DECLARE sum DECIMAL(10,2) DEFAULT 0;
    SELECT `p_turn` into player from game_status;	
	SELECT COUNT(*) INTO sum FROM tablo WHERE pos = player;
	IF sum = 0 THEN
		call bluffOnCard(); /*LOL*/
		SELECT COUNT(*) INTO sum FROM tablo WHERE pos = player;
		IF sum = 0 THEN
			update `players` set status='Win' where player=p_turn;
			set stat = '1';
		END IF;
	ELSE
	set stat = '0';
	END IF;
END//
DELIMITER ;

-- Dumping structure for procedure test.createtrapoulaTable
DELIMITER //
CREATE PROCEDURE `createtrapoulaTable`()
BEGIN
CREATE OR REPLACE TABLE  trapoula(
  card_id INT PRIMARY KEY AUTO_INCREMENT,
  card_number enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K') NOT NULL,
  card_symbol enum ('clubs','diamonds','spades','hearts') NOT NULL,
  card_icon VARCHAR(20) NOT NULL
);
END//
DELIMITER ;

-- Dumping structure for procedure test.create_Card
DELIMITER //
CREATE PROCEDURE `create_Card`(in num varchar(2), IN symbol VARCHAR(8), IN eikona VARCHAR(20))
BEGIN 
INSERT INTO trapoula (card_number,card_symbol, card_icon) VALUES (num,symbol, eikona);
END//
DELIMITER ;

-- Dumping structure for πίνακας test.game_status
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not_active','player_1_waiting','initialized','started','ended','aborded') NOT NULL DEFAULT 'not_active',
  `p_turn` enum('1','2') DEFAULT NULL,
  `moves_left` enum('0','1','2','3','4') DEFAULT NULL,
  `declared_number` enum('1','2','3','4','5','6','7','8','9','10','J','Q','K') DEFAULT NULL,
  `got_Passed` enum('0','1') DEFAULT '0',
  `moves` int(11) DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for procedure test.manyMoves
DELIMITER //
CREATE PROCEDURE `manyMoves`(declaredN varchar(2), card1 varchar(10),card2 varchar(10),card3 varchar(10),card4 varchar(10))
BEGIN 
	DECLARE moves INT;
	IF (card2 = NULL AND card3 = NULL AND card4 = NULL) THEN SET moves=1; 
	ELSEIF (card3 = NULL AND card4 = NULL) THEN SET moves=2; 
	ELSEIF (card3 = NULL) THEN SET moves=3; 
	ELSE SET moves=4; 
	END IF;
	call pass();
	UPDATE game_status SET declared_number = declaredN;	
	UPDATE game_status SET moves_left=moves;
      simple_loop: LOOP
		IF (moves=4) THEN
			call playerMove(1,card4);
		ELSEIF (moves=3) THEN
			call playerMove(1,card3);
		ELSEIF (moves=2) THEN
			call playerMove(1,card2);
		ELSEIF (moves=1) THEN
			call playerMove(1,card1);
		END IF;		
		 SET moves = moves-1;
         IF moves=0 THEN
            LEAVE simple_loop;
         END IF;
    END LOOP simple_loop;
	UPDATE game_status SET moves_left='0';
	CALL checkVictory(@TotalSum); 
	SET @b = @TotalSum;
	IF @b = 1 THEN
		UPDATE game_status SET status = 'ended';
	END IF;
	update game_status set p_turn=if(p_turn='1','2','1');	
END//
DELIMITER ;

-- Dumping structure for procedure test.move
DELIMITER //
CREATE PROCEDURE `move`(cardd tinyint)
BEGIN 
  /*
  H Καρτα που μετακινούμε πρέπει να ανήκει στον παίκτη που παίζει
  */
  DECLARE player varchar(1);
  SELECT p_turn into player from game_status ;
	UPDATE tablo SET pos = '4' WHERE card = cardd; 
	/*UPDATE tablo SET pos = '4' WHERE card = cardd and pos=player;    -> auth bgainei la8os, den kserw giati*/
	/*Εβγαλα απο την move την αλλαγή σειράς γιατί θα καλείτε σε κάθε κάρτα που αλλάζει θέση
	Η αλλαγή σειράς θα γίνεται στην επιλογή της κίνησης
    */
 END//
DELIMITER ;

-- Dumping structure for procedure test.new_game_status
DELIMITER //
CREATE PROCEDURE `new_game_status`()
BEGIN 
DROP TABLE IF EXISTS game_status;
CREATE TABLE `game_status` (
  `status` enum('not_active','player_1_waiting','initialized','started','ended','aborded') NOT NULL DEFAULT 'not_active',
  `p_turn` enum('1','2') DEFAULT null,
  `moves_left` enum('0','1','2','3','4') DEFAULT null,
  `declared_number` enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K'),
  `got_Passed` enum('0','1') DEFAULT '0',
   moves int,
  `last_change` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);
INSERT INTO `game_status`(`status`,`p_turn`,`moves_left`,`declared_number`,`got_Passed`,`moves`,`last_change`) VALUES ('not_active','1',"0",null,'0',"0",current_timestamp());
END//
DELIMITER ;

-- Dumping structure for procedure test.new_players
DELIMITER //
CREATE PROCEDURE `new_players`()
BEGIN 
drop table IF EXISTS `players`;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `side` enum('1','2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `result` enum('Equal','Win','Defeat') DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`side`)
);
END//
DELIMITER ;

-- Dumping structure for procedure test.new_tablo
DELIMITER //
CREATE PROCEDURE `new_tablo`()
BEGIN 
drop table IF EXISTS tablo;
CREATE OR REPLACE TABLE tablo(
   tablocard_id INT PRIMARY KEY AUTO_INCREMENT,
   cardNumber enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K') not null, 
   card tinyint,
   pos enum ('1','2','3','4')
);
END//
DELIMITER ;

-- Dumping structure for procedure test.new_trapoula
DELIMITER //
CREATE PROCEDURE `new_trapoula`()
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
CALL create_Card('J','diamonds', 'jack_of_diamonds2');
CALL create_Card('Q','diamonds', 'queen_of_diamonds2');
CALL create_Card('K','diamonds', 'king_of_diamonds2'); 
END//
DELIMITER ;

-- Dumping structure for procedure test.pass
DELIMITER //
CREATE PROCEDURE `pass`()
BEGIN
  DECLARE passed varchar(1);
  SELECT got_passed into passed from game_status;
  IF (passed='1') THEN 
	call passFinal();
  ELSE UPDATE game_status set got_passed='1';
  END IF;
  update tablo set pos = '3' WHERE pos = '4';
  END//
DELIMITER ;

-- Dumping structure for procedure test.passFinal
DELIMITER //
CREATE PROCEDURE `passFinal`()
BEGIN 

  DELETE FROM tablo WHERE pos = 3;
  DELETE FROM tablo WHERE pos = 4;
 END//
DELIMITER ;

-- Dumping structure for procedure test.playerMove
DELIMITER //
CREATE PROCEDURE `playerMove`(choice varchar(1),cards varchar(10))
BEGIN 
	/*player = ο παίκτης που παίζει αυτόν τον γύρο
    choice = η κίνηση που θα κάνει ο παίκτης
    cards = οι κάρτες που θα ρίξει ο παίκτης 
    Declared Number = ο αριθμός που δηλώνει στην αρχή του γύρου*/
	DECLARE movesfinal INT;
	IF (choice = '1') THEN call move(cards);
	update game_status SET got_passed=0;
	/*movesfinal = movesfinal + 1;*/
	UPDATE game_status SET moves = movesFinal;
		/*IF (movesfinal='1') UPDATE game_status SET status = 'started';
		END IF;*/
    ELSEIF (choice = '2') THEN
	call pass();	
	update game_status set p_turn=if(p_turn='1','2','1');
	ELSEIF (choice = '3') THEN
    call bluffOnCard();
	update game_status set got_passed=0;
	END IF;
	/*update game_status set p_turn=if(p_turn='1','2','1');
	call show_board_For_Active_Player();
	update game_status set p_turn=if(p_turn='1','2','1'); auto einai fake*/
END//
DELIMITER ;

-- Dumping structure for procedure test.show_boardForMe
DELIMITER //
CREATE PROCEDURE `show_boardForMe`(player varchar(1))
BEGIN 
	select * from tablo where pos = player;
END//
DELIMITER ;

-- Dumping structure for procedure test.show_board_For_Active_Player
DELIMITER //
CREATE PROCEDURE `show_board_For_Active_Player`()
BEGIN 
	SELECT *
	FROM tablo t, game_status g
	WHERE t.pos = g.p_turn;
END//
DELIMITER ;

-- Dumping structure for procedure test.shuffle
DELIMITER //
CREATE PROCEDURE `shuffle`(poss VARCHAR(2))
BEGIN
  Declare card1 tinyint;  
  Declare card2 varchar(2);  
  set card1 :=(SELECT card_id FROM trapoula ORDER BY RAND() LIMIT 1 );
  set card2 :=(SELECT card_number FROM trapoula where card_id=card1 );

  INSERT INTO tablo (cardNumber,card,pos) VALUES (card2,card1,poss);
  delete from trapoula where card_id=card1;
  END//
DELIMITER ;

-- Dumping structure for procedure test.shuffleAll
DELIMITER //
CREATE PROCEDURE `shuffleAll`()
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
 END//
DELIMITER ;

-- Dumping structure for procedure test.start
DELIMITER //
CREATE PROCEDURE `start`()
BEGIN 
  Declare STATUS2 varchar(20); 
  SELECT status into STATUS2 from game_status;	  
  IF (STATUS2="not_active") THEN UPDATE game_status set status="player_1_waiting";
  ELSEIF (STATUS2="ended") THEN UPDATE game_status set status="player_1_waiting";
  ELSEIF (STATUS2="player_1_waiting") THEN UPDATE game_status set status="initialized";  
  END IF;
  CALL startReturn();   
END//
DELIMITER ;

-- Dumping structure for procedure test.startReturn
DELIMITER //
CREATE PROCEDURE `startReturn`()
BEGIN 
  SELECT STATUS from game_status;	  
END//
DELIMITER ;

-- Dumping structure for πίνακας test.tablo
CREATE TABLE IF NOT EXISTS `tablo` (
  `tablocard_id` int(11) NOT NULL AUTO_INCREMENT,
  `cardNumber` enum('1','2','3','4','5','6','7','8','9','10','J','Q','K') NOT NULL,
  `card` tinyint(4) DEFAULT NULL,
  `pos` enum('1','2','3','4') DEFAULT NULL,
  PRIMARY KEY (`tablocard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for procedure test.takeBackAll
DELIMITER //
CREATE PROCEDURE `takeBackAll`()
BEGIN
	DECLARE player varchar(1);
	SELECT p_turn into player from game_status;	
	UPDATE tablo SET pos = player WHERE pos = '3';
	UPDATE tablo SET pos = player WHERE pos = '4';
    update game_status set p_turn=if(p_turn='1','2','1');
 END//
DELIMITER ;

-- Dumping structure for πίνακας test.trapoula
CREATE TABLE IF NOT EXISTS `trapoula` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` enum('1','2','3','4','5','6','7','8','9','10','J','Q','K') NOT NULL,
  `card_symbol` enum('clubs','diamonds','spades','hearts') NOT NULL,
  `card_icon` varchar(20) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
