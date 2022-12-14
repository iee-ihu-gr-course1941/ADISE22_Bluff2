# Bluff Game
## ADISE22_Bluff2

Διαδικτυακό παιχνίδι μπλόφας

###### [Bluff GitHub Library](https://github.com/iee-ihu-gr-course1941/ADISE22_Bluff2)



Table of Contents
=================
   * [Εγκατάσταση](#Εγκατάσταση)
      * [Απαιτήσεις](#Απαιτήσεις)
      * [Οδηγίες Εγκατάστασης](##Οδηγίες_Εγκατάστασης)
   * [Περιγραφή Εφαρμογής - Παιχνιδιού](#Περιγραφή_Εγαρμογής_Παιχνιδιού)
      * [Συντελεστές](##Συντελεστές)
   * [Περιγραφή API](#περιγραφή-api)
      * [Methods](#methods)
         * [Board](#board)
            * [Ανάγνωση Board](#ανάγνωση-board)
            * [Αρχικοποίηση Board](#αρχικοποίηση-board)
         * [Piece](#piece)
            * [Ανάγνωση Θέσης/Πιονιού](#ανάγνωση-θέσηςπιονιού)
            * [Μεταβολή Θέσης Πιονιού](#μεταβολή-θέσης-πιονιού)
         * [Player](#player)
            * [Ανάγνωση στοιχείων παίκτη](#ανάγνωση-στοιχείων-παίκτη)
            * [Καθορισμός στοιχείων παίκτη](#καθορισμός-στοιχείων-παίκτη)
         * [Status](#status)
            * [Ανάγνωση κατάστασης παιχνιδιού](#ανάγνωση-κατάστασης-παιχνιδιού)
      * [Entities](#entities)
         * [Board](#board-1)
         * [Players](#players)
         * [Game_status](#game_status)


![alt tag](https://raw.githubusercontent.com/iee-ihu-gr-course1941/ADISE22_Bluff2/main/images/Bluff.jpg)

# Demo Page

Ιστοσελίδα: [ADISE22_Bluff2 USERS IEE IHU](https://users.iee.ihu.gr/~it032378/ADISE22_Bluff2/)
2η Ιστοσελίδα: [ADISE22_Bluff2 Custom](https://legendmod.ml/adise/)
API controller: [API](https://users.iee.ihu.gr/~it032378/ADISE22_Bluff2/APIcontroller.html) 



# Εγκατάσταση

## Απαιτήσεις

* Apache2
* Mysql Server
* php

## Οδηγίες_Εγκατάστασης

 * Κάντε clone το project σε κάποιον φάκελο <br/>
  ```bash
  `$ git clone https://github.com/iee-ihu-gr-course1941/ADISE22_Bluff2.git`
  ```

 * Βεβαιωθείτε ότι ο φάκελος είναι προσβάσιμος από τον Apache Server. πιθανόν να χρειαστεί να καθορίσετε τις παρακάτω ρυθμίσεις.

 * Θα πρέπει να δημιουργήσετε στην Mysql την βάση με όνομα 'ADISE22_Bluff2' και να φορτώσετε σε αυτήν την βάση τα δεδομένα από το αρχείο schema.sql απο τον φάκελο lib/sql/

 * Θα πρέπει να φτιάξετε το αρχείο lib/connect/db_upass.php το οποίο να περιέχει:
 
$\color{#D29922}\textsf{\Large\&#x26A0;\kern{0.2cm}\normalsize Προσοχή}$
```
	$DB_PASS = 'κωδικός';
	$DB_USER = 'όνομα χρήστη';
	$dbUsers = 'διέυθυνση του mysql.sock της Mysql';
	$db = 'όνομα βάσης δεδομένων στην Mysql';
```


# Περιγραφή_Εγαρμογής_Παιχνιδιού

Η σχεδίαση στην βάση υλοποιείτε με Stored Procedures, στα οποία δόθηκε τέτοια έκταση, ώστε να υλοποιούν όλο το παιχνίδι, με εξαίρεση τα Session Id,
η διαχείρηση των οπίων υλοποιείται στην Php. Η βάση ελέγχει επίσης όλες τις νόμιμες κινήσεις. (Πολλές λειτουργίες)
Η PHP ελέγχει για την ορθότητα των API εντολών, ενεργεί εντολές στην βάση και επιστρέφει αποτελέσματα. (Λίγες λειτουργίες)
Το User Interface σχεδιάστηκε, ώστε

Αρχικά, όταν έρχουμε αρχικό άνοιγμα της ιστοσελίδας, δημιουργεί ενα UID (Session Id) και μοιράζει την τράπουλα τυχαία σε 2 θέσεις.
Όταν φορτώσει για δεύτερη φορά η σελίδα, δηιμουργεί δεύτερο UID, και το παιχνίδι ξεκινάει μόλις γίνει η πρώτη κίνηση απο τον παίκτη που μπήκε πρώτα.

Σημειώνουμε ότι για λόγους ταχύτητας και ευκολίας, επιτρέπουμε στον πρώτο παίκτη να παίξει την πρώτη κίνηση, πρίν μπεί ο δευτερος, ο οποίος με 
την σειρά του θα δεί την κίνηση του πρώτου πρίν ξεκινήσει το παιχνίδι.

Όταν επαναφορτώσει η σελίδα, βλέπει ότι υπάρχουν δυο παίκτες και βγάζει επιλογή εναπαδημιουργίας παιχνιδιού με καραστροφή των υπολοίπων UID.
Διαθέτει επιλογή QUIT GAME, η οποία δίωχνει τον παίκτη. Επίσης η επιλογή REFRESH ανανεώνει το σημείο της ιστοσελίδας που δείχενι την παρούσα 
κατάσταση του παιχνιδιού για τον εκάστωτε παίκτη.

Όταν τελειώσει το παιχνίδι ή περάσουν 5 λεπτά, και εφόσον δείξει το αποτέλεσμα στο ταμπλό, μπορεί και πάλι να γίνει νέο παιχνίδι με νέα UID.

Στο δικό μας παιχνίδι, δύναται να υπάρχει παραλαγή του παιχνιδιού ώστε το παιχνίδι να σχεδιαστεί εύκολα, να υπάρχουν περισσότερες "κινήσεις", 
και τελικώς το παιχνίδι να είναι ενδιαφέρον.
Όλες οι ενέργειες ελέγχοντε στην βάση (παίξιμο μέχρι 4 φύλλα, έλεγχο σειράς, κτλπ). Σε κάποιες περιπτώσεις έλεγχοι γίνοντε και στο User Interface.

#### Η μπλάφα μας παίζεται ως εξής:

Μοιράζονται και αρχειοθετούντε τα χαρτία της τράπουλας (οι άσσοι με την σειρά, τα δυάρια κτλπ) ανα παίκτη.
Ο παίκτης πατώντας πάνω στην εικόνα του κλειστού φύλλου, με γρφικά Vue.js βλέπει να ανοίγουν.
Τα φύλλα τα οποία είναι ανοιχτά θεωρούντε ότι τα κρατάει στο χέρι, ενώ μπορεί να τα ρίξει με το throw.
Τα φύλλα τα οποία δεν επιθυμεί να τα ρίξει, απλά τα κλείνει. Ο λόγος που είναι με την σειρά, είναι για να μπορεί να παίζει οργανωμένα.

#### Κανόνες:
Νίκη έχουμε εάν α) ο αντίπαλος δεν παίξει μια κίνηση εντός 5 λεπτών απο την τελευταία κίνηση που παίχτηκε, β) ο παίκτης αδειάσει τα φύλλα του.
Όταν ρίχνει ο παίκτης τα φύλλα, δηλώνει και τι είναι αυτά σο combo box, π.χ Άσσοι. Όταν ο παίκτης αδειάσει γίνεται αυτόματη μπλόφα, οχι απο τον 
αντίπαλο, αλλά απο το σύστημα σε αυτόν, στην τελευταία του κίνηση. Ο παίκτης οφείλει να δηλώνει αλήθεια λοιπόν στην τελευταία του κίνηση, προκειμένου
να νικήσει.

#### Που βρίσκοντε τα φύλλα:
 * Παίκτης 1
 * Παίκτης 2
 * Τελευταία κίνηση
 * Κάτω φύλλα 
 * Στην άκρη

Όταν ο παίκτης ρίξει τα φύλλα, αυτά αποθηκέυοντε στην τελευταία κίνηση, και επι αυτόν μπορεί να επικαλεστεί μπλόφα ο αντίπαλος.
Όταν ρίξει φύλλα ο επόμενος, τα φύλλα της τελευταίας κίνησης προσθέτοντε στα κάτω φύλλα.
Όταν δεν επιθυμεί να κάνει κίνηση κάποιος μπορεί να επικαλεστεί πάσω, εαν και ο επόμενος επικαλεστεί πάσω (2ο πάσω), τα κάτω φύλλα πάνε στην άκρη.
Αντί αυτού, σε περίπτωση που ο επόμενος παίξει, τα κάτω φύλλα δεν πάνε στην άκρη και τα πάσω επαναορίζοντε στο 0. 
Όλα τα κάτω φύλλα θα γυρίσουν σε αυτόν που λανθασμένα επικαλείτε μπλόφα, ή σε αυτόν που έρειξε άλλα φύλλα απο αυτά που δήλωσε, και ο αντίπαλος τον μπλόφαρει.

#### Κινήσεις:

 * Call Bluff
 * Throw
 * Pass


#### Πίνακες

| Πίνακας             | Παιδία                | Σχόλια   |
| ----------------- | --------------------------- | ---------- |
| `trapoula`        | card_id INT, card_number enum, card_symbol enum, card_icon varchar | Φύλλα τράπουλας (Άσσος Καρώ, κτλπ) |
| `tablo`           | cardNumber enum , card tinyint, card_symbol enum, pos enum | Θέση των απαριθμημένων φύλλων Παίκτης 1, Παίκτης 2, Τελευταία κίνηση, Κάτω φύλλα |
| `game_status`     | status enum, p_turn enum, session1 varchar, session2 varchar, notes1 varchar, notes2 varchar, totalcards1 int, totalcards2 int, totalmpaza int, totallast int, moves_left enum, declared_number enum, got_passed enum, total_moves int, last_change timestamp, time_left | Αποθήκευση σταθερών μεταβλητών, σχολίων και στοιχείων παιχνιδιού        |
| `players`           | player_id, result enum | Πίνακας παικτών, φοτώνονται δεδομένα, αλλά __δεν__ χρησιμοποιύντε  (Χρήση για επέκταση σε άνω των 2 παικτών) |

#### Stored Procedures

| Πίνακας             | Σχόλια   |
| ----------------- | --------------------------- |
| `createtrapoulaTable()`        | Δημιουργία πίνακα trapoula |
| `create_Card()`        | Μέθοδος φότωσης καρτών στον πίνακα trapoula |
| `new_trapoula()`        | Φόρτωση καρτών στην τράπουλα |
| `new_tablo()`        | Δημιουργία πίνακα tablo |
| `new_game_status())`        | Δημιουργία πίνακα status |
| `new_players()`        | Δημιουργία πίνακα players |


Η εφαρμογή απαπτύχθηκε μέχρι το σημείο .....(αναφέρετε τι υλοποιήσατε και τι όχι)

## Συντελεστές

Κυριακίδης Δημήτριος: User Interface, PHP, Mysql

Σκαρλάτος Στράτος: PHP, Mysql, χειρισμός USERS




# Περιγραφή API

## Methods


### Board
#### Ανάγνωση Board

```
GET /board/
```

Επιστρέφει το [Board](#Board).

#### Αρχικοποίηση Board
```
POST /board/
```

Αρχικοποιεί το Board, δηλαδή το παιχνίδι. Γίνονται reset τα πάντα σε σχέση με το παιχνίδι.
Επιστρέφει το [Board](#Board).

### Piece
#### Ανάγνωση Θέσης/Πιονιού

```
GET /board/piece/:x/:y/
```

Κάνει την κίνηση του πιονιού από την θέση x,y στην νέα θέση. Προφανώς ελέγχεται η κίνηση αν είναι νόμιμη καθώς και αν είναι η σειρά του παίκτη να παίξει με βάση το token.
Επιστρέφει τα στοιχεία από το [Board](#Board-1) με συντεταγμένες x,y.
Περιλαμβάνει το χρώμα του πιονιού και τον τύπο.

#### Μεταβολή Θέσης Πιονιού

```
PUT /board/piece/:x/:y/
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `x`               | Η νέα θέση x                | yes        |
| `y`               | Η νέα θέση y                | yes        |

Επιστρέφει τα στοιχεία από το [Board](#Board-1) με συντεταγμένες x,y.
Περιλαμβάνει το χρώμα του πιονιού και τον τύπο


### Player

#### Ανάγνωση στοιχείων παίκτη
```
GET /players/:p
```

Επιστρέφει τα στοιχεία του παίκτη p ή όλων των παικτών αν παραληφθεί. Το p μπορεί να είναι 'B' ή 'W'.

#### Καθορισμός στοιχείων παίκτη
```
PUT /players/:p
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `username`        | Το username για τον παίκτη p. | yes        |
| `color`           | To χρώμα που επέλεξε ο παίκτης p. | yes        |


Επιστρέφει τα στοιχεία του παίκτη p και ένα token. Το token πρέπει να το χρησιμοποιεί ο παίκτης καθόλη τη διάρκεια του παιχνιδιού.

### Status

#### Ανάγνωση κατάστασης παιχνιδιού
```
GET /status/
```

Επιστρέφει το στοιχείο [Game_status](#Game_status).



## Entities


### Board
---------

Το board είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `x`                      | H συντεταγμένη x του τετραγώνου              | 1..8                                |
| `y`                      | H συντεταγμένη y του τετραγώνου              | 1..8                                |
| `b_color`                | To χρώμα του τετραγώνου                      | 'B','W'                             |
| `piece_color`            | To χρώμα του πιονιού                         | 'B','W', null                       |
| `piece`                  | To Πιόνι που υπάρχει στο τετράγωνο           | 'K','Q','R','B','N','P', null       |
| `moves`                  | Πίνακας με τα δυνατά τετράγωνα (x,y) που μπορεί να μετακινηθεί το τρέχον πιόνι. Αν δεν υπάρχει πιόνι, ή δεν έχει κάνει login ο χρήστης, ή δεν έχει ξεκινήσει το παιχνίδι ή αν δεν υπάρχουν κινήσεις, τότε το πεδίο δεν υπάρχει. |   |


### Players
---------

O κάθε παίκτης έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `username`               | Όνομα παίκτη                                 | String                              |
| `piece_color`            | To χρώμα που παίζει ο παίκτης                | 'B','W'                             |
| `token  `                | To κρυφό token του παίκτη. Επιστρέφεται μόνο τη στιγμή της εισόδου του παίκτη στο παιχνίδι | HEX |


### Game_status
---------

H κατάσταση παιχνιδιού έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `status  `               | Κατάσταση             | 'not active', 'initialized', 'started', 'ended', 'aborded'     |
| `p_turn`                 | To χρώμα του παίκτη που παίζει        | 'B','W',null                              |
| `result`                 |  To χρώμα του παίκτη που κέρδισε |'B','W',null                              |
| `last_change`            | Τελευταία αλλαγή/ενέργεια στην κατάσταση του παιχνιδιού         | timestamp |
