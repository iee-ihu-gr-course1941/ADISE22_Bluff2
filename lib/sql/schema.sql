/*it174940@users:~/public_html/ADISE22_Bluff2$ mysql -u root -p bluff < lib/sql/schema.sql*/

/* 8elei ta initialized, ktpl elegxous, elegxo me timestamp aborted */
SET SQL_SAFE_UPDATES = 0;

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
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE create_Card(in num varchar(2), IN symbol VARCHAR(8), IN eikona VARCHAR(20))
BEGIN 
INSERT INTO trapoula (card_number,card_symbol, card_icon) VALUES (num,symbol, eikona);
END $$
DELIMITER ;

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
CALL create_Card('J','diamonds', 'jack_of_diamonds2');
CALL create_Card('Q','diamonds', 'queen_of_diamonds2');
CALL create_Card('K','diamonds', 'king_of_diamonds2'); 
END $$
DELIMITER ;

call createtrapoulaTable();
call new_trapoula();
 
/*Δημιουργία του πίνακα τράπουλα και γέμισμα μεχρι τωρα*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE new_tablo()
BEGIN 
drop table IF EXISTS tablo;
CREATE OR REPLACE TABLE tablo(
   /*tablocard_id INT PRIMARY KEY AUTO_INCREMENT,*/
   cardNumber enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K') not null, 
   card tinyint,
   pos enum ('1','2','3','4')
);
END $$

DELIMITER ;
call new_tablo();
/*Δημιουργία του ταμπλό*/

DELIMITER $$
CREATE OR REPLACE PROCEDURE new_game_status()
BEGIN 
DROP TABLE IF EXISTS game_status;
CREATE TABLE game_status (
  status enum('not_active','player_1_waiting','initialized','started','ended','aborted') NOT NULL DEFAULT 'not_active',
  p_turn enum('1','2') DEFAULT null,
  session1 varchar(50),
  session2 varchar(50),
  notes1 varchar(50),
  notes2 varchar(50),
  totalcards1 int, /*arithmos xartiwn paikth 1*/
  totalcards2 int, /*arithmos xartiwn paikth 1*/
  totalmpaza int, /*arithmos xartiwn paikth teleutaia poy phksan*/
  totallast int, /*arithmos xartiwn paikth 1*/
  moves_left enum('0','1','2','3','4') DEFAULT null,
  declared_number enum ('1','2','3','4','5','6','7','8','9','10','J','Q','K'),
  got_passed enum('0','1') DEFAULT '0',
  total_moves int,
  last_change timestamp NULL DEFAULT current_timestamp(),
  time_left varchar(50)
);
INSERT INTO game_status(status,p_turn,session1,session2,notes1,notes2,totalcards1,totalcards2,totalmpaza,totallast, moves_left,declared_number,got_passed,total_moves,last_change,time_left) VALUES ('not_active','1',null,null,'Welcome player 1','Welome player 2',0,0,0,0,"0",null,'0',0,current_timestamp(),"");
END $$
DELIMITER ;


/* UPDATE game_status SET moves_left='4'; */
call new_game_status();

DELIMITER $$
CREATE OR REPLACE PROCEDURE cardNumberCount()
BEGIN 
	Declare count1 int;
	Declare count2 int;
	Declare count3 int;
	Declare count4 int;
	SELECT COUNT(*) into count1 from tablo where pos = "1";
	SELECT COUNT(*) into count2 from tablo where pos = "2";
	SELECT COUNT(*) into count3 from tablo where pos = "3";
	SELECT COUNT(*) into count4 from tablo where pos = "4";
	update game_status set totalcards1 = count1;
	update game_status set totalcards2 = count2;
	update game_status set totalmpaza = count3;
	update game_status set totallast = count4;
	
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE new_players()
BEGIN 
drop table IF EXISTS players;
CREATE TABLE players (
   player_id INT PRIMARY KEY AUTO_INCREMENT,
   result enum('Equal','Win','Defeat','Ongoing') DEFAULT NULL
);
INSERT INTO players (result) VALUES ('Ongoing');
INSERT INTO players (result) VALUES ('Ongoing');
END $$
DELIMITER ;


call new_players();




DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffle(poss VARCHAR(2))
  BEGIN
  Declare card1 tinyint;  
  Declare card2 varchar(2);  
  set card1 :=(SELECT card_id FROM trapoula ORDER BY RAND() LIMIT 1 );
  set card2 :=(SELECT card_number FROM trapoula where card_id=card1 ); 
  INSERT INTO tablo (cardNumber,card,pos) VALUES (card2,card1,poss);
  delete from trapoula where card_id=card1;
  END $$
DELIMITER;

DELIMITER $$
  CREATE OR REPLACE PROCEDURE shuffleAll()
  BEGIN

	  CALL new_game_status();
	  CALL new_players();
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
   ALTER TABLE tablo ORDER BY cardNumber;
   call new_trapoula(); 
   call cardNumberCount();
 END $$
DELIMITER ;

call shuffleAll();

DELIMITER $$
  CREATE OR REPLACE PROCEDURE passFinal() 
  BEGIN 

  DELETE FROM tablo WHERE pos = 3;
  DELETE FROM tablo WHERE pos = 4;
  UPDATE game_status set got_passed='0';
  call cardNumberCount();
 END $$  
DELIMITER ;

DELIMITER $$
  CREATE OR REPLACE PROCEDURE takeBackAll() /*Dinei ston paikth ola ta fylla pou einai katw*/
  BEGIN
	DECLARE player varchar(1);
	UPDATE game_status set got_passed='0';
	SELECT p_turn into player from game_status;	
	UPDATE tablo SET pos = player WHERE pos = '3';
	UPDATE tablo SET pos = player WHERE pos = '4';
    update game_status set p_turn=if(p_turn='1','2','1');
	call cardNumberCount();
 END $$  
 DELIMITER ;
  /*Parametros einai o arithmos pou dhlwse o paikths sthn arxh toy guroy*/


DELIMITER $$
CREATE OR REPLACE PROCEDURE bluffOnCard() 
BEGIN
	DECLARE player varchar(1);	
	DECLARE DeclaredNumber varchar(2);
	DECLARE metablhth varchar(2);
	SELECT p_turn into player from game_status;
	
	SELECT declared_number into DeclaredNumber from game_status;
	select ( sum(cardNumber <> DeclaredNumber) ) into metablhth
	from tablo	
	where pos='4';	
	IF (metablhth = 0) THEN 
		IF (player=1) THEN 
			UPDATE game_status SET notes1 = CONCAT('player ',player, ' bluffed on card ', DeclaredNumber, ' and lost');
		ELSEIF (player=2) THEN 
			UPDATE game_status SET notes2 = CONCAT('player ',player, ' bluffed on card ', DeclaredNumber, ' and lost');
		END IF;	
	CALL takeBackAll();
	ELSE 
		IF (player=1) THEN 
			UPDATE game_status SET notes1 = CONCAT('player ',player, ' bluffed on card ', DeclaredNumber, ' and won');
		ELSEIF (player=2) THEN 
			UPDATE game_status SET notes2 = CONCAT('player ',player, ' bluffed on card ', DeclaredNumber, ' and won');
		END IF;	
		update game_status set p_turn=if(p_turn='1','2','1');
		CALL takeBackAll();	
	END IF;
	CALL show_board_For_Active_Player();
END $$
DELIMITER ;

DELIMITER $$
  CREATE OR REPLACE PROCEDURE move(cardd tinyint) /* DEN DOYLEYEI SWSTA GIA MEGALA NOUMERA, 8ELEI AUTOCOMMIT 0, ELEGXO STHN PHP KAI RETURN sthn manyMoves*/
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
 END $$
DELIMITER ;
 
 
 
 /*h endMoves kalleite gia ka8e paikth otan teliwsei na rixnei kartes*/
 
 
 DELIMITER $$
  CREATE OR REPLACE PROCEDURE pass() 
  BEGIN
  DECLARE passed varchar(1);
  SELECT got_passed into passed from game_status;
  IF (passed='1') THEN 
	call passFinal();
  ELSE UPDATE game_status set got_passed='1';
  END IF;
  update tablo set pos = '3' WHERE pos = '4';
  call cardNumberCount();
  END $$ 
 DELIMITER ;
 
DELIMITER $$
CREATE OR REPLACE PROCEDURE checkVictory(out stat int)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE Message varchar(20);
    DECLARE player varchar(1);
    DECLARE sum DECIMAL(10,2) DEFAULT 0;
    SELECT p_turn into player from game_status;	
	SELECT COUNT(*) INTO sum FROM tablo WHERE pos = player;
	IF sum = 0 THEN
		call bluffOnCard(); /*LOL*/
		SELECT COUNT(*) INTO sum FROM tablo WHERE pos = player;
		IF sum = 0 THEN
			update players set status='Win' where player=player_id;
			set stat = '1';
		END IF;
	ELSE
	set stat = '0';
	END IF;
END $$
DELIMITER ;

/*
DELIMITER $$
  CREATE OR REPLACE PROCEDURE stat() 
  BEGIN
  CREATE VIEW stats 
SELECT COUNT(*) FROM tablo WHERE pos=1
UNION
SELECT COUNT(*) FROM tablo WHERE pos=2
  END $$ 
 DELIMITER ;
*/

/* Auto ekteleitai gia na epistrefei thn parapanw, opou DeclaredNumber to 1 h 2
CALL checkVictory(@TotalSum); 
SELECT @TotalSum;
*/



DELIMITER $$
CREATE OR REPLACE PROCEDURE manyMoves(declaredN varchar(2), card1 varchar(10),card2 varchar(10),card3 varchar(10),card4 varchar(10))
BEGIN 
	DECLARE moves2 INT;
    DECLARE player varchar(1);
    SELECT p_turn into player from game_status;	
	
	IF (card2 IS NULL) THEN SET moves2=1;
	ELSEIF (card3 IS NULL) THEN SET moves2=2;
	ELSEIF (card4 IS NULL) THEN SET moves2=3;
	ELSE SET moves2=4;
	END IF;
	
	IF (player=1) THEN UPDATE game_status SET notes1 = CONCAT('player ',player, ' thrown ', moves2, ' cards on table');
	ELSEIF (player=2) THEN UPDATE game_status SET notes2 = CONCAT('player ',player, ' thrown ', moves2, ' cards on table');
	END IF;
		
	UPDATE game_status SET declared_number = declaredN;	
	UPDATE game_status SET moves_left=moves2;
	update tablo set pos = '3' WHERE pos = '4';
      simple_loop: LOOP
		IF (moves2=4) THEN
			call playerMove(1,card4);
		ELSEIF (moves2=3) THEN
			call playerMove(1,card3);
		ELSEIF (moves2=2) THEN
			call playerMove(1,card2);
		ELSEIF (moves2=1) THEN
			call playerMove(1,card1);
		END IF;		
		 SET moves2 = moves2-1;
         IF moves2=0 THEN	
            LEAVE simple_loop;
         END IF;
    END LOOP simple_loop;
	/*UPDATE game_status SET moves_left='0';*/
	CALL checkVictory(@TotalSum); 
	SET @b = @TotalSum;
	IF @b = 1 THEN
		UPDATE game_status SET status = 'ended';
	END IF;
	UPDATE game_status SET total_moves = total_moves+1;	
	call cardNumberCount();
	CALL show_board_For_Active_Player();
	update game_status set p_turn=if(p_turn='1','2','1');	
	/*update game_status set notes1='wtf';
	update game_status set p_turn=if(p_turn='1','2','1');	*/
END $$
DELIMITER ;

/*call manyMoves('J',1,2,NULL,NULL);*/

SELECT * FROM game_status;

DELIMITER $$
CREATE OR REPLACE PROCEDURE playerMove(choice varchar(1),cards varchar(10))
BEGIN 
	/*player = ο παίκτης που παίζει αυτόν τον γύρο
    choice = η κίνηση που θα κάνει ο παίκτης
    cards = οι κάρτες που θα ρίξει ο παίκτης 
    Declared Number = ο αριθμός που δηλώνει στην αρχή του γύρου*/
	DECLARE stats varchar(50);
	DECLARE player varchar(1);
	SELECT status into stats FROM game_status;
	IF (stats='initialized' OR stats='started' OR stats='player_1_waiting') THEN
		SELECT p_turn into player from game_status;
	
		IF (choice = '1') THEN call move(cards);
			update game_status SET got_passed='0';	
			UPDATE game_status set last_change=CURRENT_TIMESTAMP();	
		ELSEIF (choice = '2') THEN
			IF (player=1) THEN UPDATE game_status SET notes1 = CONCAT('player ',player, ' passed');
				ELSEIF (player=2) THEN UPDATE game_status SET notes2 = CONCAT('player ',player, ' passed');
			END IF;	
			UPDATE game_status set last_change=CURRENT_TIMESTAMP();
			call pass();
			update game_status set p_turn=if(p_turn='1','2','1');	
		ELSEIF (choice = '3') THEN
			call bluffOnCard();
			update game_status set got_passed='0';	
			UPDATE game_status set last_change=CURRENT_TIMESTAMP();
		END IF;
	END IF;
	IF (stats='initialized') THEN 
		update game_status SET status='started';
	END IF; 
END $$
DELIMITER ;

   
DELIMITER $$
CREATE OR REPLACE PROCEDURE show_boardForMe(player varchar(1))
BEGIN 
	select * from tablo where pos = player;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE show_board_For_Active_Player()
BEGIN 
	DECLARE player varchar(1);
	SELECT p_turn into player from game_status;
	SELECT *
	FROM tablo
	WHERE pos = player;
END $$
DELIMITER ; 	


DELIMITER $$
CREATE OR REPLACE PROCEDURE start()
BEGIN 
  Declare STATUS2 varchar(30); 
  SELECT status into STATUS2 from game_status;	  
  IF (STATUS2="not_active") THEN UPDATE game_status set status="player_1_waiting";
  ELSEIF (STATUS2="ended" OR STATUS2="ended") THEN UPDATE game_status set status="player_1_waiting"; CALL shuffleAll();
  UPDATE game_status set last_change=CURRENT_TIMESTAMP();
  ELSEIF (STATUS2="player_1_waiting") THEN UPDATE game_status set status="initialized"; 
  UPDATE game_status set last_change=CURRENT_TIMESTAMP(); 
  END IF;
  CALL startReturn();   
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE startReturn()
BEGIN 
  SELECT status from game_status;	  
END $$
DELIMITER ;

/*
DELIMITER $$
CREATE TRIGGER checklastaction BEFORE UPDATE ON game_status
       FOR EACH ROW
       BEGIN
           IF OLD.last_change  >= DATE_SUB(NOW(), INTERVAL 5 MINUTE) THEN
               SET NEW.status = 'aborted';
           END IF;
       END $$
delimiter ;   
*/
DELIMITER $$
  CREATE OR REPLACE PROCEDURE checkTimer() 
  BEGIN
  DECLARE timer TIMESTAMP;
  DECLARE diff TIMESTAMP;
  DECLARE diffSec INT;
  DECLARE player varchar(1);	
  DECLARE stats varchar(30);
  DECLARE secToShow INT;
  SELECT status INTO stats FROM game_status;
  SELECT p_turn into player from game_status;
  select last_change INTO timer from game_status;
  SELECT TIMEDIFF(CURRENT_TIMESTAMP(), timer) INTO diff;
  SELECT TIME_TO_SEC(diff) INTO diffSec;
  if (stats='initialized' OR stats='started') then 
    SET secToShow = 300-diffSec;
	IF (secToShow<0) THEN 
		SET secToShow =0;
	END IF;
	UPDATE game_status set time_left = CONCAT(secToShow, ' sec');	
  end if;
  if (diffSec>300 AND (stats='initialized' OR stats='started')) THEN
	update players set result='Win' where player<>player_id;
	update players set result='Defeat' where player=player_id;
	UPDATE game_status set status="aborted";
	if (player=1) then 
		UPDATE game_status SET notes1 = CONCAT('player ',player, ' defeated, aborted');
		UPDATE game_status SET notes2 = CONCAT('player ',player, ' wins');  
	elseif (player=2) then 
		UPDATE game_status SET notes1 = CONCAT('player ',player, ' wins');
		UPDATE game_status SET notes2 = CONCAT('player ',player, ' defeated, aborted'); 
	end if;  
  END IF;
  select * from game_status;
  END $$ 
 DELIMITER ;

CALL checkTimer();

