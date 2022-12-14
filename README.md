# Bluff Game
## ADISE22_Bluff2

Διαδικτυακό παιχνίδι μπλόφας 2 πακτών

###### [Bluff GitHub Library](https://github.com/iee-ihu-gr-course1941/ADISE22_Bluff2)

Περιεχόμενα
=================
   * [Ιστοσελίδα Demo](#Ιστοσελίδα_Demo)
	  * [Συντελεστές](##Συντελεστές)
   * [Εγκατάσταση](#Εγκατάσταση)
      * [Απαιτήσεις](#Απαιτήσεις)
      * [Οδηγίες Εγκατάστασης](##Οδηγίες_Εγκατάστασης)
   * [Περιγραφή Εφαρμογής - Παιχνιδιού](#Περιγραφή_Εφαρμογής_Παιχνιδιού)
      
   * [Περιγραφή API](#περιγραφή-api)
      * [Methods](#methods)


![alt tag](https://raw.githubusercontent.com/iee-ihu-gr-course1941/ADISE22_Bluff2/main/images/Bluff.jpg)

# Ιστοσελίδα_Demo

* Ιστοσελίδα: [ADISE22_Bluff2 USERS IEE IHU](https://users.iee.ihu.gr/~it032378/ADISE22_Bluff2/)
* 2η Ιστοσελίδα: [ADISE22_Bluff2 Custom](https://legendmod.ml/adise/)
* API controller: [API](https://users.iee.ihu.gr/~it032378/ADISE22_Bluff2/APIcontroller.html) 

Η εφαρμογή απαπτύχθηκε πλήρως, το demo είναι user friendly σε όλες τις πλατφόρμες.

## Συντελεστές

 * Κυριακίδης Δημήτριος [Github για ακαδημαϊκή χρήση](https://github.com/kyriakidisdimitrios), [Github προγραμματιστή](https://github.com/jimboy3100/): User Interface, PHP, Mysql

#### Στόχοι εργασίας: Μάθημα [Ανάπτυξη Διαδικτυακών Συστημάτων και Εφαρμογών](https://1941.iee.ihu.gr/site/) στο [Tμήμα Μηχανικών Πληροφορικής και Ηλεκτρονικών Συστημάτων Tμήμα Μηχανικών Πληροφορικής και Ηλεκτρονικών Συστημάτων](https://www.iee.ihu.gr/en/)
#### Εκπαιδευτικοί στόχοι: Μεταπτυχιακό σε [MSc in Big Data Management and Analytics](https://www.griffith.ie/faculties/computing/courses/msc-big-data-management-and-analytics)  
#### Προγραμματιστική εμπειρία παρεμφερής με την παρούσα εργασία: Διαδικτυακή πλατφόρμα χρήσης για το παιχνίδι [agar.io](https://agar.io) με ενεργούς χρήστες [legendmod.ml](https://legendmod.ml/), και βρίσκεται στο [jimboy3100.github.io](https://github.com/jimboy3100/jimboy3100.github.io) 

 * Σκαρλάτος Στράτος [Github για ακαδημαϊκή χρήση](https://github.com/Haxemaniac): PHP, Mysql, χειρισμός USERS
#### Στόχοι εργασίας: Μάθημα [Ανάπτυξη Διαδικτυακών Συστημάτων και Εφαρμογών](https://1941.iee.ihu.gr/site/) στο [Tμήμα Μηχανικών Πληροφορικής και Ηλεκτρονικών Συστημάτων Tμήμα Μηχανικών Πληροφορικής και Ηλεκτρονικών Συστημάτων](https://www.iee.ihu.gr/en/)
#### Εκπαιδευτικοί στόχοι: Πτυχιακή εργασία σε APIs σχετικά με δειχείρηση στοιχείων απο βάσεις δεδομένων, π.χ Βελτιστοποίηση εφαρμογής "Πρόγραμμα εξεταστικής" ή "Εβδομαδιαίο πρόγραμμα μαθημάτων"
#### Εργασιακοί στόχοι: Βελτιστοποίηση APIs για επιχειρήσεις. Βελτιστοποίηση πληροφορικών συστημάτων

# Εγκατάσταση

## Απαιτήσεις

* Apache2
* Mysql Server
* php

## Οδηγίες_Εγκατάστασης

 * Κάντε clone το project σε κάποιον φάκελο <br/>
  ```bash
  $ git clone https://github.com/iee-ihu-gr-course1941/ADISE22_Bluff2.git
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


# Περιγραφή_Εφαρμογής_Παιχνιδιού

Η σχεδίαση στην βάση υλοποιείτε με Stored Procedures, στα οποία δόθηκε τέτοια έκταση, ώστε να υλοποιούν όλο το παιχνίδι, με εξαίρεση τα Session Id,
η διαχείρηση των οπίων υλοποιείται στην Php. Η βάση ελέγχει επίσης όλες τις νόμιμες κινήσεις. (Πολλές λειτουργίες)
Η PHP ελέγχει για την ορθότητα των API εντολών, ενεργεί εντολές στην βάση και επιστρέφει αποτελέσματα. (Λίγες λειτουργίες)
Το User Interface σχεδιάστηκε, ώστε να είναι να είναι διασκεδαστικό στον χρήστη (σε πλαίσιο εγασίας σε μάθημα βέβαια). (Μέτριες λειτουργιες)

Αρχικά, όταν έρχουμε αρχικό άνοιγμα της ιστοσελίδας, δημιουργεί ενα UID (Session Id) και μοιράζει την τράπουλα τυχαία σε 2 θέσεις.
Όταν φορτώσει για δεύτερη φορά η σελίδα, δηιμουργεί δεύτερο UID, και το παιχνίδι ξεκινάει μόλις γίνει η πρώτη κίνηση απο τον παίκτη που μπήκε πρώτα.
Εάν στο textarea του UID εισάγουμε ενεργό UID και κάνουμε κλίκ αλλού (trigger change), ενώ το παιχνίδι είναι ενεργό, θα μπορoύμε να παίξουμε απο το σημείο 
που σταμάτησαμε (π.χ σε περίπτωση κλείσιμο ιστοσελίδας).

Σημειώνουμε ότι για λόγους ταχύτητας και ευκολίας, επιτρέπουμε στον πρώτο παίκτη να παίξει την πρώτη κίνηση, πρίν μπεί ο δευτερος, ο οποίος με 
την σειρά του θα δεί την κίνηση του πρώτου πρίν ξεκινήσει το παιχνίδι.

Όταν επαναφορτώσει η σελίδα, βλέπει ότι υπάρχουν δυο παίκτες και βγάζει επιλογή εναπαδημιουργίας παιχνιδιού με καραστροφή των υπολοίπων UID.
Διαθέτει επιλογή QUIT GAME, η οποία δίωχνει τον παίκτη. Επίσης η επιλογή REFRESH ανανεώνει το σημείο της ιστοσελίδας που δείχενι την παρούσα 
κατάσταση του παιχνιδιού για τον εκάστωτε παίκτη.

Όταν τελειώσει το παιχνίδι ή περάσουν 5 λεπτά, και εφόσον δείξει το αποτέλεσμα στο ταμπλό, μπορεί και πάλι να γίνει νέο παιχνίδι με νέα UID.

Στο δικό μας παιχνίδι, δύναται να υπάρχει παραλαγή του παιχνιδιού ώστε το παιχνίδι να σχεδιαστεί εύκολα, να υπάρχουν περισσότερες "κινήσεις", 
και τελικώς το παιχνίδι να είναι ενδιαφέρον.
Όλες οι ενέργειες ελέγχοντε στην βάση (παίξιμο μέχρι 4 φύλλα, έλεγχο σειράς, κτλπ). Σε κάποιες περιπτώσεις έλεγχοι γίνοντε και στο User Interface.

#### Η μπλόφα μας παίζεται ως εξής:

Μοιράζονται και αρχειοθετούντε τα χαρτία της τράπουλας (οι άσσοι με την σειρά, τα δυάρια κτλπ) ανά παίκτη.
Ο παίκτης πατώντας πάνω στην εικόνα του κλειστού φύλλου, με γραφικά Vue.js βλέπει να ανοίγουν.
Τα φύλλα τα οποία είναι ανοιχτά θεωρούντε ότι τα κρατάει στο χέρι, ενώ μπορεί να τα ρίξει με το throw.
Τα φύλλα τα οποία δεν επιθυμεί να τα ρίξει, απλά τα κλείνει. Ο λόγος που είναι με την σειρά, είναι για να μπορεί να παίζει οργανωμένα.

#### Κανόνες:
Νίκη έχουμε εάν α) ο αντίπαλος δεν παίξει μια κίνηση εντός 5 λεπτών απο την τελευταία κίνηση που παίχτηκε, β) ο παίκτης αδειάσει τα φύλλα του.
Όταν ρίχνει ο παίκτης τα φύλλα, δηλώνει και τι είναι αυτά στο combo box, π.χ Άσσοι. Όταν ο παίκτης αδειάσει γίνεται αυτόματη μπλόφα απο το σύστημα σε αυτόν,
στην τελευταία του κίνηση. Ο παίκτης οφείλει να δηλώνει αλήθεια λοιπόν στην τελευταία του κίνηση, προκειμένου να νικήσει.

#### Που βρίσκοντε τα φύλλα:
 * Παίκτης 1
 * Παίκτης 2
 * Τελευταία κίνηση
 * Κάτω φύλλα 
 * Στην άκρη

Όταν ο παίκτης ρίξει τα φύλλα, αυτά αποθηκέυοντε στην τελευταία κίνηση, και επι αυτόν μπορεί να επικαλεστεί μπλόφα ο αντίπαλος.
Όταν ρίξει φύλλα ο επόμενος, τα φύλλα της τελευταίας κίνησης προσθέτοντε στα κάτω φύλλα.
Όταν δεν επιθυμεί να κάνει κίνηση κάποιος μπορεί να επικαλεστεί πάσο, εαν και ο επόμενος επικαλεστεί πάσο (2ο πάσο), τα κάτω φύλλα πάνε στην άκρη.
Αντί αυτού, σε περίπτωση που ο επόμενος παίξει, τα κάτω φύλλα δεν πάνε στην άκρη και τα πάσο επαναορίζοντε στο 0. 
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
| `shuffle()`        | Προσθήκη φύλλου σε παίκτη, διαγραφή απο trapoula|
| `shuffleAll()`        | Μοίρασμα τράπουλας σε παίκτες τυχαία, αλλά κατανεμημένα φύλλα στους παίκτες|
| `passFinal()`        | Άδεισμα των φύλλων κάτω και των φύλλων στην άκρη, μετά το δεύτερο πάσο|
| `takeBackAll()`        | Άδεισμα των φύλλων κάτω και των φύλλων στην άκρη, μεταφορά σε παίκτη|
| `bluffOnCard()`        | Ενέργεια μπλόφας σε παίκτη για κάτω φύλλα σε σχέση με αναφερόμενο φύλλο|
| `move()`        | Μετακίνηση κάρτας|
| `pass()`        | Δήλωση πάσο|
| `manyMoves()`        | Απόδοση απο 1 έως και 4 κινήσεων|
| `show_boardForMe()`        | Επιστροφή φύλλων για παίκτη, κάτω φύλλα, στην άκρη φύλλα|
| `show_board_For_Active_Player()`        | Επιστροφή φύλλων για ενεργό παίκτη|
| `start()`        | Ενεργοποίηση παίκτη|
| `startReturn()`        | Επιστροφή φύλλων για ενεργό παίκτη|
| `checkTimer()`        | 'Ελεγχος για στιγμή που έπαιξε ο τελευταίος παίκτης και ενέργειες αποχώρησης|
| `checkVictory()`        | 'Ελεγχος νίκης και αυτόματη μπλόφα απο το σύστημα, σε περίπτωση που πάει για νίκη|
| `bluffOnCardForVictory()`        | 'Ενέργειες αυτόματη μπλόφας|


# Περιγραφή API

   * [API controller](https://users.iee.ihu.gr/~it032378/ADISE22_Bluff2/APIcontroller.html) 
   * Όλες οι επιστροφές, πλήν του κενού είναι JSON, όπου το 1ο στοιχείο είναι String είτε "successmesg" είτε "errormesg", 
το 2ο στοιχείο είναι JSON με τα επιστρεφόμενα στοιχεία, ενώ επίσης περιέχει το είδος της επιστροφής π.χ game_status
   * Κανένα στοιχείο επιστροφής δεν έχει header('Content-type: application/json'), αλλά  header('HTTP/1.1 200 OK', αντί αυτού, οπότε χρίζει απο interface 
JSON.parse() για ανάγνωση ως JSON και JSON.parse() του 2ου στοιχείου για για ανάγνωση ως JSON.
   * Υπάρχουν επιστροφές 1.1 405 Method Not Allowed, HTTP/1.1 404 Not Found, HTTP/1.1 100 Informational.
   * Οι επιστροφές 1.1 405 Method Not Allowed διαχειρίζονται με το JSON.parse(data.responseText), όπου data η επιστροφή σε περίπτωση λάθους (και αυτές JSON)
 
## Methods

### FIND

```
GET /find
```

Επιστρέφει το ποιός παίκτης έχει σειρά.

### CHEATSESSION1

```
GET /cheatSession1
```

Επιστρέφει το Session id (uid) του παίκτη 1. Δεν χρησιμοποιείται απο το demo παιχνιδιού, αλλά απο το API Controller

### CHEATSESSION2

```
GET /cheatSession1
```

Επιστρέφει το Session id (uid) του παίκτη 2. Δεν χρησιμοποιείται απο το demo παιχνιδιού, αλλά απο το API Controller

### STARTUSER

```
POST /startuser
```

Επιστρέφει το Session id (uid) του παίκτη και εισάγεται ο παίκτης

### DESTROY

```
POST /destroy
```

Καταστρέφει το παιχνίδι και τα UID, επιστρέφει κενό μήνυμα

### CHECKSESSIONID

```
GET checkSessionId/xxxxx
```

Ελέγχει εάν το UID xxxxx είναι σωστό και επιστρέφει ποιός παίκτης είναι (1 ή 2)


### SHOW
```
GET /show/xxxxx
```

| Πεδίο επιστροφής  | Σχόλιο                      |
| ----------------- | --------------------------- |
| `cardNumber`      | Είδος κάρτας (π.χ Άσσος)    |
| `card`            | Μοναδικός αριθμός κάρτας    |
| `pos`             | Παίκτης                      |

Ο παίκτης επιστροφής για όλα τα φύλλα είναι είτε ο 1, είτε ο 2. Δεν επιστρέφει ποτέ τα φύλλα διαφορετικού position.

```
POST /show/
```

Κατσστρέφει το παιχνίδι και τα UID, επιστρέφει κενό μήνυμα, όπως και το DESTROY. Δεν χρησιμοποιείται απο το demo παιχνιδιού, αλλά απο το API Controller

### STATUS
```
GET /status
```

| Πεδίο επιστροφής  | Σχόλιο                      |
| ----------------- | --------------------------- |
| `status`      | Status παιχνιδιού   |
| `p_turn`      | Ποιανού σειρά είναι    |
| `notes1`      | Σχόλια για παίκτη 1 |
| `notes2`      | Σχόλια για παίκτη 2 |
| `totalcards1`      | Κάρτες παίκτη 1 |
| `totalcards2`      | Κάρτες παίκτη 2 |
| `totalmpaza`      | Κάτω φύλλα |
| `totallast`      | Τελευταία κίνηση (κάρτες) |
| `moves_left`      | Εναπομείναντα φύλλα σε επεξεργασία (δεν χρησιμοποιείται) |
| `declared_number`      | Δήλωση κάρτας π.χ Άσσος |
| `got_passed`      | Το 1 σημαίνει ότι ο προηγούμενος πάτησε πάσο |
| `total_moves`      | Αριθμός κινήσεων που παίχτηκαν συνολικά|
| `last_change`      | Χρονική στιγμή τελευταίας αλλαγής |
| `time_left`      | Πόση ώρα έμεινε απο τα 5 λεπτά υπόλοιπο, απο την τελευταία κίνηση αντιπάλπου |

   * Οι κάρτες απο την τελευταία κίνηση δεν προσμετρούντε στα κάτω φύλλα. 
   * Το moves_left δεν χρησιμοποείται απο το demo παιχνιδιού, σε περίπτωση αργού server θα βλέπαμε από τα φύλλα 
που ρίξαμε κάτω, πόσα δεν πήγαν στην μπάζα φύλλων, ενώ η διαδικασία είναι σε LOOP έως την περάτωση.
   * Ο λόγος για τον οποίο, δεν χρειάζεται UID στην αποστολή, είναι διότι δείχνει μόνο στατιστικά, πιθανή εξωτερική χρήση απο αλλού.

### Μέθοδοι Board (Κινήσεις παίκτη)
Όπου xxxxx είναι το UID του παίκτη.

#### THROW 

```
POST /board/xxxxx/throw/"ΔηλεθένΚάρτα"/ΜοναδικόςΑριΘμόςΚάρτας1/ΜοναδικόςΑριΘμόςΚάρτας2/ΜοναδικόςΑριΘμόςΚάρτας3/ΜοναδικόςΑριΘμόςΚάρτας4
```
   * Π.χ board/xxxxx/throw/"A"/1/2/3/4 
   * Ρίξε την κάρτα με αριθμιτικό 1, με αριθμιτικό 2, με αριθμιτικό 3, με αριθμιτικό 4, και δηλώνω ότι είναι Άσσοι.
   * Σε περίπτωση που ρίξε 3 κάρτες board/xxxxx/throw/"A"/1/2/3/null κτλπ.
Επιστροφή "".

#### PASS 

```
POST board/xxxxx/pass
```
Ο παίκτης πάει πάσο.
Επιστροφή "".

#### BLUFF 

```
POST board/xxxxx/bluff
```
Ο παίκτης δηλώνει μπλόφα στα χαρτιά του αντιπάλου.
Επιστρέφει ότι και στην [SHOW](###SHOW)


