-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2017 at 10:57 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamesguide`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Nickname` varchar(16) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`, `Admin`) VALUES
('admin', 'admin', 'admin', 'admin', '1995-10-01', 'admin@admin.admin', 1),
('Peachka', 'ciaone', 'Lucia', 'Fenu', '1995-06-30', 'lucia.fenu95@gmail.com', 1),
('Aiolos', '123qwerty789', 'Gianmarco', 'Pettenuzzo', '1995-08-20', 'gian82095@gmail.com', 1),
('Gionny-Atlas', '0987654321', 'Francesco', 'Battistella', '1994-10-01', 'frabat@icloud.com', 1),
('Depaa', 'asdfghjkl', 'Matteo', 'Depascale', '1995-08-20', 'depascale.matteo@gmail.com', 1),
('user', 'user', 'user', 'user', '1995-01-01', 'user@user.user', 0),
('Nikocister', 'Sassari', 'Nicola', 'Cisternino', '1995-01-12', 'nicocister95@gmail.com', 0),
('Mmasier', 'Chubby', 'Marco', 'Masiero', '1996-09-09', 'marcmasi@icloud.com', 0),
('Snordio', 'Chioggia4ever', 'Stefano', 'Nordio', '1995-06-15', 'steno996@gmail.com', 0),
('Drakex94', 'helpme', 'Francesco', 'Sacchetto', '1994-12-19', 'frasack94@gmail.com', 0),
('DarkWarrior', 'pecpecpec', 'Francesco', 'Pecile', '1996-12-09', 'frapec96@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `commentinotizie`
--

CREATE TABLE `commentinotizie` (
  `TitoloNot` varchar(144) NOT NULL,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `Commento` varchar(512) NOT NULL,
  `Nick` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentinotizie`
--

INSERT INTO `commentinotizie` (`TitoloNot`, `Data`, `Ora`, `Commento`, `Nick`) VALUES
('XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', '2017-11-30', '10:30:00', 'La nuova Xbox One X spacca, è molto più performante di tutte le console Sony, sommate tra loro ovviamente ;) e poi,\r\ndiciamoci la verità, le esclusive della sony non sono nemmeno così carine :sad:', 'Nikocister');

-- --------------------------------------------------------

--
-- Table structure for table `commentirecensione`
--

CREATE TABLE `commentirecensione` (
  `TitoloRec` varchar(144) NOT NULL,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `Commento` varchar(512) NOT NULL,
  `Nick` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentirecensione`
--

INSERT INTO `commentirecensione` (`TitoloRec`, `Data`, `Ora`, `Commento`, `Nick`) VALUES
('Need For Speed Payback – La vendetta è servita', '2017-11-30', '10:30:00', 'molto bella la grafica, ho perso un semestre a causa di questo gioco', 'Nikocister');

-- --------------------------------------------------------

--
-- Table structure for table `giochi`
--

CREATE TABLE `giochi` (
  `Nome` varchar(100) NOT NULL,
  `DataPub` date NOT NULL,
  `Genere1` varchar(20) NOT NULL,
  `Genere2` varchar(20) DEFAULT NULL,
  `Genere3` varchar(20) DEFAULT NULL,
  `PEGI` int(5) DEFAULT NULL,
  `Valutazione` double DEFAULT NULL,
  `Disponibilita` varchar(144) DEFAULT NULL,
  `Playstation3` tinyint(1) DEFAULT NULL,
  `Playstation4` tinyint(1) DEFAULT NULL,
  `Xbox360` tinyint(1) DEFAULT NULL,
  `XboxOne` tinyint(1) DEFAULT NULL,
  `NintendoDS` tinyint(1) DEFAULT NULL,
  `NintendoSwitch` tinyint(1) DEFAULT NULL,
  `Windows` tinyint(1) DEFAULT NULL,
  `Mac` tinyint(1) DEFAULT NULL,
  `Descrizione` varchar(5000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `giochi`
--

INSERT INTO `giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`, `Valutazione`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`, `XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`) VALUES
('Need for Speed: Payback', '2017-11-10', 'Corse', 'Azione', NULL, 12, NULL, 'Ps4, XboxOne, Windows', 0, 1, 0, 1, 0, 0, 1, 0, 'Sullo sfondo della corruzione di Fortune Valley, il desiderio di vendetta porta la tua banda\r\n            a riunirsi per sconfiggere la Loggia, una spietata organizzazione che esercita il suo controllo sui casinò, i criminali e i poliziotti della città. In questo paradiso del gioco d\'azzardo, la posta in palio è alta e la Loggia ha sempre le carte vincenti in mano. Affronta diversi eventi nei panni di Tyler, Mac e Jess. Guadagnati il\r\n            rispetto del sottobosco della Valley e gareggia nella sfida finale per sconfiggere la Loggia una volta per\r\n            tutte.'),
('Assassin\'s Creed: Brotherhood', '2010-11-16', 'RPG', 'Avventura', NULL, 18, NULL, 'Ps3, Ps4, Xbox360, XboxOne, Windows', 1, 1, 1, 1, 0, 0, 1, 0, 'Vivi e respira come Ezio, un leggendario Maestro Assassino, nella sua continua lotta contro il potente Ordine Templare. Dovrà viaggiare nella più grande città d\'Italia, Roma, centro di potere, avidità e corruzione per colpire il cuore del nemico.\r\n            Sconfiggere i tiranni corrotti richiederà non solo la forza, ma la leadership, poiché Ezio comanda un\'intera Fratellanza che si radunerà al suo fianco.\r\n            Solo lavorando insieme gli Assassini possono sconfiggere i loro nemici mortali. E per la prima volta, tramite il multigiocatore pluripremiato ti consentirà di scegliere tra una vasta gamma di personaggi unici, ognuno con le proprie armi e tecniche di assassinio! È ora di unirsi alla Fratellanza.'),
('Call of Duty: World War II', '2017-11-03', 'FPS', 'Azione', NULL, 18, NULL, 'Ps4, XboxOne, Windows', 0, 1, 0, 1, 0, 0, 1, 0, 'Un\'esperienza mozzafiato che porterà una nuova generazione nella Seconda Guerra Mondiale. Sbarca in Normandia durante il fatidico D-Day e combatti in tutta Europa rivivendo leggendarie battaglie che hanno segnato il conflitto più sanguinoso della storia.\r\n            Scopri il classico combattimento di Call of Duty, i legami del cameratismo e il cuore crudele della guerra.'),
('The Legend of Zelda: A Link between worlds', '2013-11-22', 'Avventura', 'RPG', NULL, 12, NULL, 'NDS', 0, 0, 0, 0, 1, 0, 0, 0, 'The Legend of Zelda: A Link Between Worlds introduce un set completamente nuovo di rompicapi e dungeon! Questa volta Link può anche muoversi sui muri come se fosse un dipinto.\r\n            Questa possibilità cambia completamente la tua prospettiva, permettendoti di pensare in una nuova dimensione e risolvere rompicapi prima impensabili.\r\n            L\'ordine e il modo in cui ti cimenti con ciascun labirinto dipenderà completamente da te. Incontrerai anche un nuovo personaggio, Lavio, che rappresenta la chiave verso il successo: nella sua bottega potrai affittare o acquistare oggetti, come l\'arpione, l\'arco e il martello, che ti saranno utili nel corso dell\'avventura.\r\n            Molti di questi oggetti saranno disponibili all\'inizio del gioco e starà a te decidere quali affittare o acquistare, a seconda del labirinto che desideri affrontare!'),
('Outlast II', '2017-04-25', 'Horror', 'Azione', NULL, 18, NULL, 'Ps4, XboxOne, Windows, Mac', 0, 1, 0, 1, 0, 0, 1, 1, 'In Outlast 2 fai la conoscenza di Sullivan Knoth e dei suoi seguaci, che si sono lasciati alle spalle il nostro mondo corrotto per fondare la cittadina di Temple Gate, nel cuore del deserto, lontana da qualsiasi segno di civiltà.\r\n            Knoth si sta preparando insieme al suo gregge alle tribolazioni della fine dei tempi e tu ti ci ritrovi dentro fino al collo.\r\n            Tu sei Blake Langermann, un cameraman che lavora con sua moglie Lynn. Siete dei giornalisti investigativi disposti a correre qualsiasi rischio e a scavare a fondo per svelare le storie che nessuno si azzarda a toccare.\r\n            Stai seguendo una scia di indizi iniziata con l\'omicidio apparentemente impossibile di una donna incinta sconosciuta ed identificata semplicemente come Jane Doe. L\'indagine ti ha condotto nel cuore del deserto dell\'Arizona, in un\'oscurità così profonda che nessuno potrebbe illuminare e in una corruzione così intensa che impazzire potrebbe essere l\'unica cosa sensata da fare.'),
('The Sims 3', '2009-06-02', 'Simulatore', NULL, NULL, 13, NULL, 'Ps3, Xbox360, XboxOne, NDS, Windows, Mac', 1, 0, 1, 1, 1, 0, 1, 1, 'The Sims 3 è un capolavoro di simulazione che ti dà la possibilità di ipotizzare e vivere tutte le vite che ti pare. Crea tutti i personaggi che vuoi, ognuno diverso dall\'altro in quanto a caratteristiche fisiche e psicologiche, regalagli una casa e un mondo in cui vivere.\r\n            E poi stai a vedere che succede. Con The Sims 3 non c\'è nulla di prevedibile e nulla di impossibile.'),
('Mortal Kombat X', '2015-04-07', 'Horror', 'Picchiaduro', NULL, 18, NULL, 'Ps4, XboxOne, Windows', 0, 1, 0, 1, 0, 0, 1, 0, 'Mortal Kombat X combina animazioni cinematografiche uniche a un nuovo stile di gioco.\r\n            Per la prima volta, potrai scegliere tra diverse varianti di ogni personaggio, che influenzeranno strategie e stili di combattimento.'),
('FIFA 18', '2017-09-29', 'Sport', NULL, NULL, 3, NULL, 'Ps3, Ps4, Xbox360, XboxOne, NSwitch, Windows', 1, 1, 1, 1, 0, 1, 1, 0, 'Sei pronto per la più grande stagione di sempre? Grazie al motore Frostbite™, FIFA 18 attenua il confine tra il mondo reale e quello virtuale dando vita a eroi, squadre e atmosfere del gioco più bello del mondo.\r\n            Crea il tuo Ultimate Team nella modalità più giocata di FIFA scegliendo tra migliaia di calciatori. Scopri i nuovi obiettivi giornalieri, affronta la modalità Squad Battles per ricevere premi settimanali e osserva i migliori giocatori al mondo su Champions Channel!'),
('Crash Bandicoot: N.Sane Trilogy', '2017-06-30', 'Platform', 'Azione', 'Avventura', 7, NULL, 'Ps4', 0, 1, 0, 0, 0, 0, 0, 0, 'Il tuo marsupiale preferito, Crash Bandicoot, è tornato! Più forte e pronto a scatenarsi con N. Sane Trilogy game collection. Ora potrai provare Crash Bandicoot come mai prima d’ora in HD.\r\n            Ruota, salta, scatta e divertiti atttraverso le sfide e le avventure dei tre giochi da dove tutto è iniziato, Crash Bandicoot®, Crash Bandicoot® 2: Cortex Strikes Back e Crash Bandicoot®: Warped.\r\n            Rivivi i migliori \"Momenti Crash\" con la grafica completamente rimasterizzata in HD!\r\n            Crash Bandicoot: Dr. Neo Cortex ha in piano di conquistare il mondo, e vuole creare una stirpe di animali geneticamente modificati per raggiungere il suo obiettivo. Per creare il suo esercito in miniatura dovrà rapire più animali possibile.\r\n            La fidanzata di Crash Bandicoot fa parte delle sue vittime! Prendi il controllo di Crash, corri, salta e attraverso 30 livelli di azione intensa in 3 meravigliose isole Australiane.\r\n            Solo tu potrai aiutare Crash a salvare gli animali, la sua fidanzata e impedire a Dr. Cortex di portare a termine il suo piano malefico.\r\n            Crash Bandicoot 2, Cortex Strikes Back: Il malvagio Dr. Neo Cortex è tornato… ma questa volta a salvare il mondo? E per farlo dovrà chiedere l’aiuto del suo arci nemico Crash Bandicoot®?\r\n            Sarà questa una messinscena per attirare Crash nel prossimo folle esperimento di Cortex? Riuscirà Crash a difendersi da questa insidia?\r\n            Ambiente 3D free roaming molto più vasto, nuove animazioni e un roster di personaggi coloratissimi – pattina sul ghiaccio, cavalca orsi polari e guida jet-packs a gravità zero con Crash, nella nuova avventura.\r\n            Crash Bandicoot Warped: Eh si… è proprio tornato…. ed è prontissimo all’azione! In una nuova avventura a spasso nel tempo! Gameplay innovativo per la serie – vai sottacqua, nuota, guida motociclette, un piccolo T-Rex, e gira in free-roaming pilotando un aereo!\r\n            Gioca come Coco! Cavalcauna tigre sulla Grande Muraglia Cinese, esegui straordinarie acrobaziesu jetski! Metti alla prova le tue abilità con nuove mosse straordinarie, come Super-charge Body Slam, Super Slide, Salto doppio, Death-Tornado Spin e un Bazooka teleguidato.\r\n            Nuovi nemici da sconfiggere, come Big Boss, Uka Uka, N. Tropy, il minaccioso Dingodile e il ritorno di alcuni super famosi come N. Gin and Tiny. Più Azione. Più Divertimento. Più puzzle e livelli segreti.'),
('Super Mario Odyssey', '2017-10-27', 'Avventura', 'Azione', NULL, 10, NULL, 'NSwitch', 0, 0, 0, 0, 0, 1, 0, 0, 'Mario approda su Nintendo Switch con un’avventura 3D senza precedenti!\r\n            Questo fantastico gioco in stile sandbox – il primo dai tempi degli amatissimi Super Mario 64 del 1996 e Super Mario Sunshine del 2002 – è pieno zeppo di segreti e sorprese! Mario può ora contare su tutta una serie di nuove mosse e abilità, come lanci o salti che sfruttano il cappello. Può persino impossessarsi di personaggi e oggetti, per possibilità di gameplay incredibili e mai sperimentate prima.\r\n            Questo titolo è il biglietto ufficiale per un’emozionante viaggio, tra mondi incredibili e lontani dal classico Regno dei Funghi!'),
('God of War: 4', '2018-01-01', 'Action', 'Avventura', '', 18, NULL, 'Ps4, Ps3', 1, 1, 0, 0, 0, 0, 0, 0, 'God of War Ã¨ il quarto capitolo della serie di videogiochi God of War, sviluppato da SIE Santa Monica Studio e pubblicato dalla Sony Interactive Entertainment per PlayStation 4. L\'uscita del gioco Ã¨ prevista per l\'inizio del 2018. SarÃ  l\'ottavo capitolo della serie God of War, e sequel di God of War III. Il gioco sarÃ  un riavvio per il franchise e porterÃ  la serie nel mondo della mitologia norrena (tutti i giochi precedenti si basavano sulla mitologia greca). Il protagonista della serie, Kratos, tornerÃ  come personaggio principale, e ora ha un figlio di nome Atreus. Kratos funge da mentore e protettore per suo figlio, e deve dominare la rabbia che lo ha spinto per molti anni.');

-- --------------------------------------------------------

--
-- Table structure for table `immagini`
--

CREATE TABLE `immagini` (
  `NomeGioco` varchar(100) NOT NULL,
  `MenuImg` varchar(20) NOT NULL,
  `GiocoImg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `immagini`
--

INSERT INTO `immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`) VALUES
('Assassin\'s Creed: Brotherhood', 'ACB.jpg', 'ACB0.jpg'),
('Call of Duty: World War II', 'CODWWII.jpg', 'CODWWII0.jpg'),
('Crash Bandicoot: N.Sane Trilogy', 'CBT.jpg', 'CBT0.jpg'),
('FIFA 18', 'FIFA18.jpg', 'FIFA180.jpg'),
('God of War: 4', 'GO00W4.jpg', 'GO00W4.jpg0'),
('Mortal Kombat X', 'MKX.jpg', 'MKX0.jpg'),
('Need for Speed: Payback', 'NFSPayback.jpg', 'NFSPayback0.jpg'),
('Outlast II', 'outlast2.jpg', 'outlast20.jpg'),
('Super Mario Odyssey', 'SMO.jpg', 'SMO0.jpg'),
('The Legend of Zelda: A Link between worlds', 'Zelda.jpg', 'Zelda0.jpg'),
('The Sims 3', 'Thesims3.jpg', 'Thesims30.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notizie`
--

CREATE TABLE `notizie` (
  `DataPubblicazione` date NOT NULL,
  `Titolo` varchar(144) NOT NULL,
  `AdminNick` varchar(16) NOT NULL,
  `Testo` varchar(8192) NOT NULL,
  `XboxOne` tinyint(1) DEFAULT NULL,
  `Xbox360` tinyint(1) DEFAULT NULL,
  `NintendoDS` tinyint(1) DEFAULT NULL,
  `NintendoSwitch` tinyint(1) DEFAULT NULL,
  `Windows` tinyint(1) DEFAULT NULL,
  `Mac` tinyint(1) DEFAULT NULL,
  `Playstation3` tinyint(1) DEFAULT NULL,
  `Playstation4` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notizie`
--

INSERT INTO `notizie` (`DataPubblicazione`, `Titolo`, `AdminNick`, `Testo`, `XboxOne`, `Xbox360`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Playstation3`, `Playstation4`) VALUES
('2017-11-30', 'XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', 'Depaa', 'Nel corso di un\' intervista concessa a GamesGuide.com, Piers Harding-Rolls, Director of Research and Analysis Games presso IHS Markit, ha confermato che la compagnia di ricerche di mercato ha quasi raddoppiato le proprie previsioni di vendita di Xbox One X nel 2017.\r\n\"Il feedback sui pre-order per Xbox One X standard e la Project Scorpio Edition ci ha spinti a rivedere le nostre previsioni di vendita di Xbox One X nel 2017. La edizione limitata di Xbox One X si è rivelata una mossa vincente, riuscendo a veicolare una robusta quantità di macchine durante la settimana di lancio, nelle Regioni chiave. IHS Markit ha quindi incrementato le proprie previsioni da 500.000 a 900.000 unità\".\r\nAllo stesso modo, la compagnia crede che, al netto di questo possibile successo commerciale, non basterà Xbox One X per colmare il gap presente tra Microsoft e Sony, specialmente prendendo in considerazione lo andamento del mercato in Europa continentale.', 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `recensione`
--

CREATE TABLE `recensione` (
  `NomeGioco` varchar(144) NOT NULL,
  `AdminNick` varchar(16) NOT NULL,
  `Titolo` varchar(144) NOT NULL,
  `Testo` varchar(8192) NOT NULL,
  `Data` date NOT NULL,
  `Playstation3` tinyint(1) DEFAULT NULL,
  `Playstation4` tinyint(1) DEFAULT NULL,
  `Xbox360` tinyint(1) DEFAULT NULL,
  `XboxOne` tinyint(1) DEFAULT NULL,
  `NintendoDS` tinyint(1) DEFAULT NULL,
  `NintendoSwitch` tinyint(1) DEFAULT NULL,
  `Windows` tinyint(1) DEFAULT NULL,
  `Mac` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recensione`
--

INSERT INTO `recensione` (`NomeGioco`, `AdminNick`, `Titolo`, `Testo`, `Data`, `Playstation3`, `Playstation4`, `Xbox360`, `XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`) VALUES
('Need For Speed: Payback', 'Aiolos', 'NEED FOR SPEED PAYBACK: LA VENDETTA E\' SERVITA', 'Si parte subito con il prologo in cui si provano alcuni mezzi e viene narrata la storia che apre la modalità carriera. Con grande sorpresa, il sistema di guida adottato è abbastanza realistico e l\'aspetto visivo non è per niente male – il tutto è sostenuto dal frostbite, il famoso motore grafico di DICE. La modalità di guida somiglia a \"Forza Horizon\" di Playground Games, che fa del realismo il proprio cavallo di battaglia, con una grande differenza: il controllo del veicolo. Quest\'ultimo forse risulta un po\' troppo eccessivo: è impensabile fare una curva a gomito, a 140, di freno a mano, con una Buick del \'64.\r\nTuttavia è un gioco con obiettivi completamente diversi (Qualcuno ha detto Fast & Furious?), quindi sotto questo punto di vista Need for Speed: Payback è giustificato. In modalità Carriera si trovano in mezzo alla strada degli archi azzurro/verdi,che danno il via ad alcune come Autovelox e Salto, dove si deve rispettivamente passare dal varco ad una velocità maggiore di quella indicata oppure  superare i metri richiesti con un salto. La Gara di velocità, dove quello che conta è la media tra il primo e l\'ultimo varco – non la velocità istantanea raggiunta nei check point – costa qualche tentativo prima di capire come funzioni. \r\nOltre le nuove modalità, forse un po\' macchinose, ci son le gare \"classiche\", disponibili nelle categorie corsa, fuoristrada, derapata, accelerazione e fuga (con relative auto di categoria) ed alla fine di ogni gara vengono consegnati dei crediti e delle Speed Card. Le gare hanno una struttura classica, ovvero si deve attraversare i vari checkpoint e concludere primi. Sembra facile detta così. L\'intelligenza artificiale dei piloti contro cui si gareggia è talvolta un po\' troppo competitiva: non mancano situazioni in cui si ricevono e si danno sportellate, cambia solo il modo in cui le si danno. Nella modalità corsa è sufficiente spingere un veicolo nemico fuori dalla carreggiata per vedere la sua velocità scendere, lo stesso giochetto però non si riesce ad applicare nelle gare fuoristrada, dove appunto le auto sono pensate per tutti i tipi di terreni. \r\nParlando di differenze, questi sono i principali tipi di gare: Corsa: Gara classica su asfalto, il primo a tagliare il traguardo vince. Fuoristrada: Gara classica con tratti offroad, il primo arrivato vince. Derapata: Gara di derapate, il cambio di terreno non va ad intaccare i punti che vengono dati, il punteggio più alto vince. Accelerazione: l\'erede di \"sparo\" dei capitoli Underground della saga. Rettilineo, cambio manuale, il più veloce vince. Fuga: scappare dai poliziotti e farne fuori il più possibile, non penso necessiti di ulteriori spiegazioni. Le Speed Card rappresentano le modifiche che potete fare al vostro veicolo, di diversi livelli e diverse marche, combinandone tre dello stesso marchio otterrete un bonus diverso in base al brand. \r\nLe Speed Card si ricevono alla fine di una gara, si comprano in officina oppure si trovano in una \"consegna\", una specie di pacchetto ricompense che viene assegnato o ottenibile accumulando stelle delle varie attività. Da segnalare si possono ottenere pacchetti anche comprandoli – realmente però, non con crediti di gioco! Insomma, sono riusciti a microtransazioni perfino in Need For Speed. Non c\'è da dannarsi, però: con un po\' di grinding selvaggio si risolvono tutti i problemi di crediti. Se con le Speed Card si perde un punto, lo si riguadagna quando si parla di modifiche estetiche: cofano, cerchi, dischi dei freni e alette sul paraurti anteriore, insomma ogni singolo aspetto della macchina è personalizzabile, soprattutto per quanto riguarda le aerografie. Il gioco utilizza un sistema che ricorda molto i livelli di photoshop, posizionabili e scalabili liberamente, su ogni punto della carrozzeria. \r\nSta solo alla creatività del giocatore! Su PS4 si ha un ottima resa visiva. Need For Speed: Payback, grazie all\'ottimo motore grafico, offre delle viste mozzafiato. Non ci sono frame drop da segnalare, il gioco mantiene i 30 Frame al Secondo praticamente sempre, anche in gare fuoristrada dove gli effetti sono tanti. Il tutto senza casi di aliasing eclatanti. Le uniche situazioni in cui una PS4 standard si affanna sono le gare notturne in fuoristrada. Con l\'illuminazione e il terreno ricco di particolari, la GPU sembra un po\' sotto stress. Il mondo aperto ed esplorabile nel gioco è una delle introduzioni più gradite: la mappa è molto vasta, con ogni tipo di pista – questo causa qualche piccolo glitch – ma nulla di esagerato. Le piste in cui si svolgono le gare sono pezzi della mappa in cui si guida liberamente, dai deserti, in grande numero, alle montagne, per finire anche città. \r\nOvviamente, ma c\'è qualcosa che manca, un qualcosa che per i fan delle corse fa la differenza: la visuale interna del veicolo. Inoltre, i danni al veicolo sono solo estetici, non influiscono sulle prestazioni del mezzo e per di più basta passare da un benzinaio per far sparire tutto. Ci sono alcuni dettagli che bisogna valorizzare, come lo sporco sull\'auto – dopo un po\' di offroad il veicolo è così sporco che vi vien la voglia di scriverci \"Lavami\" sul lunotto posteriore –  oppure la modalità foto, dove potrete fermare il tempo per scattare una foto del vostro gioiellino da una qualsiasi angolazione, in qualsiasi situazione. Inoltre la radio ha diversi generi, che spaziano dal hip hop al rock, con diversi bei brani. Peccato, però, che la radio non si possa spegnere per godersi il rombo del motore. È un ottimo gioco, molto divertente. Siamo di fronte ad un erede dei cari e vecchi Need For Speed Undergound. Ci sono delle differenze, come ovvio che sia, ma rimane comunque un titolo che vi terrà impegnati per del tempo.', '2017-11-30', 0, 1, 0, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `valutazione`
--

CREATE TABLE `valutazione` (
  `Voto` int(11) NOT NULL,
  `NomeGioco` varchar(144) NOT NULL,
  `UserNick` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `valutazione`
--

INSERT INTO `valutazione` (`Voto`, `NomeGioco`, `UserNick`) VALUES
(4, 'Outlast II', 'Nikocister'),
(3, 'FIFA 18', 'Mmasier'),
(5, 'The Legend of Zelda: A Link between worlds', 'Snordio'),
(4, 'Super Mario Odissey', 'Drakex94'),
(1, 'Call of Duty: World War II', 'DarkWarrior'),
(4, 'Need For Speed: Payback', 'Nikocister'),
(4, 'Assassin\'s Creed: Brotherhood', 'Mmasier'),
(5, 'Clash of Clans', 'Snordio'),
(4, 'The Sims 3', 'Drakex94'),
(1, 'Crash Bandicoot: N.Sane Trilogy', 'DarkWarrior'),
(5, 'Mortal Combat X', 'DarkWarrior');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Nickname`),
  ADD UNIQUE KEY `Nickname` (`Nickname`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `commentinotizie`
--
ALTER TABLE `commentinotizie`
  ADD PRIMARY KEY (`TitoloNot`,`Data`,`Ora`,`Commento`,`Nick`),
  ADD KEY `CommentiNotizie` (`Nick`);

--
-- Indexes for table `commentirecensione`
--
ALTER TABLE `commentirecensione`
  ADD PRIMARY KEY (`TitoloRec`,`Data`,`Ora`,`Commento`,`Nick`),
  ADD UNIQUE KEY `TitoloRec` (`TitoloRec`),
  ADD UNIQUE KEY `Nick` (`Nick`);

--
-- Indexes for table `giochi`
--
ALTER TABLE `giochi`
  ADD PRIMARY KEY (`Nome`),
  ADD UNIQUE KEY `Nome` (`Nome`),
  ADD KEY `Giochi1` (`Genere1`),
  ADD KEY `Giochi2` (`Genere2`),
  ADD KEY `Giochi3` (`Genere3`);

--
-- Indexes for table `immagini`
--
ALTER TABLE `immagini`
  ADD UNIQUE KEY `NomeGioco` (`NomeGioco`);

--
-- Indexes for table `notizie`
--
ALTER TABLE `notizie`
  ADD PRIMARY KEY (`Titolo`),
  ADD UNIQUE KEY `Titolo` (`Titolo`),
  ADD KEY `Notizie` (`AdminNick`);

--
-- Indexes for table `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`Titolo`),
  ADD UNIQUE KEY `NomeGioco` (`NomeGioco`),
  ADD UNIQUE KEY `AdminNick` (`AdminNick`),
  ADD UNIQUE KEY `Titolo` (`Titolo`);

--
-- Indexes for table `valutazione`
--
ALTER TABLE `valutazione`
  ADD PRIMARY KEY (`NomeGioco`,`UserNick`),
  ADD KEY `Valutazione` (`UserNick`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
