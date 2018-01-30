-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2018 at 12:00 PM
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

CREATE TABLE `Account` (
  `id` int(5) NOT NULL,
  `Nickname` varchar(10) NOT NULL,
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

INSERT INTO `Account` (`id`, `Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`, `Admin`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '1995-10-01', 'admin@admin.admin', 1),
(2, 'Peachka', 'ciaone', 'Lucia', 'Fenu', '1995-06-30', 'lucia.fenu95@gmail.com', 1),
(3, 'Aiolos', '123qwerty789', 'Gianmarco', 'Pettenuzzo', '1995-08-20', 'gian82095@gmail.com', 1),
(4, 'Gionny', '0987654321', 'Francesco', 'Battistella', '1994-10-01', 'frabat@icloud.com', 1),
(5, 'Depaa', 'asdfghjkl', 'Matteo', 'Depascale', '1995-08-20', 'depascale.matteo@gmail.com', 1),
(6, 'user', 'user', 'user', 'user', '1995-01-01', 'user@user.user', 0),
(7, 'Nikocister', 'Sassari', 'Nicola', 'Cisternino', '1995-01-12', 'nicocister95@gmail.com', 0),
(8, 'Mmasier', 'Chubby', 'Marco', 'Masiero', '1996-09-09', 'marcmasi@icloud.com', 0),
(9, 'Snordio', 'Chioggia4ever', 'Stefano', 'Nordio', '1995-06-15', 'steno996@gmail.com', 0),
(10, 'Drakex94', 'helpme', 'Francesco', 'Sacchetto', '1994-12-19', 'frasack94@gmail.com', 0),
(11, 'DarkWario', 'pecpecpec', 'Francesco', 'Pecile', '1996-12-09', 'frapec96@gmail.com', 0),
(16, 'ASDFYD', '123456789', 'asdfghjk', 'asdfghjk', '2000-02-02', 'sdfgh@asdf@it', 0);

-- --------------------------------------------------------

--
-- Table structure for table `commentinotizie`
--

CREATE TABLE `Commentinotizie` (
  `IDc` int(5) NOT NULL,
  `TitoloNotizia` varchar(144) NOT NULL,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `Commento` varchar(512) NOT NULL,
  `NickName` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentinotizie`
--

INSERT INTO `Commentinotizie` (`IDc`, `TitoloNotizia`, `Data`, `Ora`, `Commento`, `NickName`) VALUES
(1, 'Presentata Xbox One X ', '2017-11-30', '10:30:00', 'La nuova Xbox One X spacca, &egrave; molto pi&ugrave; performante di tutte le console <span lang="en">Sony</span>, sommate tra loro ovviamente ;) e poi, diciamoci la verit&agrave;, le esclusive della <span lang="en">sony</span>) non sono nemmeno cos&igrave; carine', 'Nikocister'),
(2, 'Auguri di buone feste dalla redazione di GamesGuide', '2018-01-03', '04:35:30', 'cawabonga', 'admin'),
(3, 'Uscir&agrave; presto il nuovo God of War', '2018-01-03', '04:35:36', 'cawabonga2', 'admin'),
(4, 'The Crew 2: Sono aperte ore le iscrizioni alla Beta', '2018-01-05', '07:09:17', 'sdfgffds', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `commentirecensione`
--

CREATE TABLE `Commentirecensione` (
  `IDc` int(5) NOT NULL,
  `TitoloRecensione` varchar(144) NOT NULL,
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `Commento` varchar(512) NOT NULL,
  `NickName` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentirecensione`
--

INSERT INTO `Commentirecensione` (`IDc`, `TitoloRecensione`, `Data`, `Ora`, `Commento`, `NickName`) VALUES
(1, 'La Recensione di The Legend of Zelda: Breath of the Wild', '2017-11-30', '10:30:00', 'molto bella la grafica, ho perso un semestre a causa di questo gioco', 'Nikocister'),
(2, 'La Recensione di Super Mario Odyssey', '2017-11-30', '01:30:00', 'molto bella la grafica, ho perso un semestre a causa di questo gioco', 'Nikocister'),
(3, 'La Recensione di FIFA 18: sempre il solito?', '2018-01-04', '01:32:18', 'commmentono', 'admin'),
(4, 'La Recensione di Crash Bandicoot, un sogno che diventa realt&agrave;', '2018-01-04','01:32:22', 'asdasdadsa', 'admin'),
(5, 'La Recensione di Crash Bandicoot, un sogno che diventa realt&agrave;', '2018-01-04', '01:32:27', 'molto bene', 'admin'),
(6, 'La Recensione di Assassin&rsquo;s Creed : Origins, mummia o faraone?', '2018-01-04', '07:37:36', 'comento', 'admin'),
(7, 'La Recensione di Call of Duty: WWII, piedi in terra', '2018-01-04', '07:39:05', 'oggi &egrave; un bel giorno 04/01', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `genere`
--

CREATE TABLE `Genere` (
  `CodiceGenere` int(4) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genere`
--

INSERT INTO `Genere` (`CodiceGenere`, `Nome`) VALUES
(1, 'Avventura'),
(2, 'Azione'),
(3, 'Sport'),
(4, 'Simulazione'),
(5, 'Strategia'),
(6, 'Musicale'),
(8, 'Sparatutto'),
(9, 'Picchiaduro'),
(10, '<span lang="en"><abbr title="First Person Shooter">FPS</abbr></span>'),
(11, 'Piattaforma'),
(12, '<span lang="en"><abbr title="Role Playing Game">RPG</abbr></span>'),
(13, '<span lang="en">Horror</span>');

-- --------------------------------------------------------

--
-- Table structure for table `immagini`
--

CREATE TABLE `Immagini` (
  `NomeGioco` varchar(100) NOT NULL,
  `MenuImg` varchar(64) NOT NULL,
  `GiocoImg` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `immagini`
--

INSERT INTO `Immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`) VALUES
('Assassin&rsquo;s Creed: Origins', 'ACO.jpg', 'ACO0.jpg'),
('Call of Duty: World War II', 'CODWWII.jpg', 'CODWWII0.jpg'),
('Crash Bandicoot: N.Sane Trilogy', 'CBT.jpg', 'CBT0.jpg'),
('FIFA 18', 'FIFA18.jpg', 'FIFA180.jpg'),
('Need For Speed: Payback', 'NFSPayback.jpg', 'NFSPayback0.jpg'),
('Super Mario Odyssey', 'SMO.jpg', 'SMO0.jpg'),
('The Legend Of Zelda: A Link Between Worlds', 'Zelda.jpg', 'Zelda0.jpg'),
('The Legend of Zelda: Breath of the Wild', 'ZBW.jpg', 'ZBW0.jpg'),
('The Sims 3', 'Thesims3.jpg', 'Thesims30.jpg'),
('Outlast 2', 'outlast2.jpg', 'outlast20.jpg');
-- --------------------------------------------------------

--
-- Table structure for table `notizie`
--

CREATE TABLE `Notizie` (
  `ID` int(4) NOT NULL,
  `Data` date NOT NULL,
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
  `Playstation4` tinyint(1) DEFAULT NULL,
  `MenuImg` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notizie`
--

INSERT INTO `Notizie` (`ID`, `Data`, `Titolo`, `AdminNick`, `Testo`, `XboxOne`, `Xbox360`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Playstation3`, `Playstation4`, `MenuImg`) VALUES
(1, '2017-11-30', 'Presentata Xbox One X ', 'Depaa', '<span lang=\"en\">Xbox One</span> X &egrave;, anzitutto, un piccolo miracolo di ingegneria e progettazione. La <span lang=\"en\">console</span> se ne esce dalla scatola pronta a stupire l&rsquo;utente grazie alle dimensioni estremamente contenute, addirittura pi&ugrave; ridotte della candida &ldquo;sorellina minore&rdquo;. Il <span lang=\"en\">form factor</span> &egrave; simile a quello di <span lang=\"en\">Xbox One</span> S: essenziale, pulito, squadrato, ma decisamente pi&ugrave; elegante rispetto a quello della versione <span lang=\"en\">&ldquo;fat&rdquo;</span>. Il blocco centrale della macchina ne sovrasta uno pi&ugrave; piccolo, mettendo in risalto il vano del disco.\r\n  Spariscono le forature della parte superiore, anche per via di una revisione integrale del sistema di raffreddamento (che adesso sfrutta la dissipazione a camera di vapore).\r\n  Le superfici nere, leggermente satinate, sono piacevolissime alla vista, e la compattezza dell&rsquo;assemblaggio rende la macchina un piccolo gioiello da esporre fieramente in salotto.\r\n  Che <span lang=\"en\">Microsoft</span> sia riuscita ad infilare il suo &ldquo;mostro di potenza&rsquo; in uno <span lang=\"en\">chassis</span> cos&igrave; piccolo, insomma, &egrave; un risultato pi&ugrave; che ammirevole, frutto di un processo di ingegnerizzazione veramente incredibile. Qui non si tratta, badate bene, solo di una marcata attenzione per l&rsquo;ottimizzazione degli spazi e la &ldquo;miniaturizzazione&rdquo;, bens&igrave; di uno studio meticoloso del posizionamento di ogni componente, attento ad ogni aspetto: potenza, gestione termica, riduzione del rumore, stile.\r\n  <span lang=\"en\">Xbox One</span> X, insomma, si presenta fin da subito come un prodotto premium, ideato per quei giocatori che non vogliono scendere a compromessi su nessun fronte: neppure sul quello estetico e progettuale.', 1, 0, 0, 0, 0, 0, 0, 0, 'XboxOneX.jpg'),
(2, '2017-12-06', 'The Legend Of Zelda: Breath Of The Wild. Premiato come gioco dell&rsquo;anno!', 'Peachka', ' Nuovo importante riconoscimento per <span lang=\"en\">The Legend Of</span> Zelda: <span lang=\"en\">Breath Of The Wild</span>.: questa volta &egrave; <span lang=\"en\">GameSpot USA</span> a premiare l&rsquo;ultima avventura di <span lang=\"en\">Link</span> con il prestigioso premio di <span lang=\"en\">Game of the Year</span>, riservato al miglior gioco dell&rsquo;anno.\r\n  Per la redazione di <span lang=\"en\">GameSpot USA, Breath of the Wild </span>&egrave; il miglior gioco degli ultimi dodici mesi, nonch&egrave; uno dei migliori titoli di sempre, grazie a un <span lang=\"en\">gameplay</span> di assoluto livello, a una narrazione ineccepibile e ad una direzione artistica di alto profilo.\r\n  <span lang=\"en\">The Legend Of</span> Zelda: <span lang=\"en\">Breath Of The Wild</span> &egrave; il videogioco pi&ugrave; premiato del 2017, nonch&egrave; il titolo con la media pi&ugrave; alta dell&rsquo;anno su Metacritic, a testimonianza dell&rsquo;ottima accoglienza ricevuta da parte della stampa specializzata. \r\n  Il gioco &egrave;; stato eletto <span lang=\"en\">Game of the Year</span> ai <span lang=\"en\">The Game Awards</span> dell&rsquo;8 dicembre scorso, riconoscimento importante, inoltre anche <span lang=\"en\">Polygon</span> ha inserito <span lang=\"en\">Zelda Breath of the Wild</span> nella Top 50 dell&rsquo;anno che sta pr terminare.\r\n  Un grande successo per Nintendo e per <span lang=\"ja\">Eiji Aonuma</span>, il <span lang=\"en\">producer</span> della serie ha affermato recentemente che i lavori sul prossimo gioco di Zelda, sono gi&agrave; iniziati, sebbene sia ancora troppo presto per iniziare a parlarne. \r\n  Non ci resta dunque che attendere di saperne di pi&ugrave; sul nuovo capitolo della saga.', 0, 0, 0, 1, 0, 0, 0, 0, 'ZBWN.jpg'),
(3, '2017-12-05', 'Uscir&agrave; presto il nuovo God of War', 'Depaa', ' <span lang=\"en\">Sony Interactive Entertainment</span> ha pubblicato un video di <span lang=\"en\">God of War</span> dedicato ad Atreus, il figlio di Kratos, svelando nuovi dettagli e retroscena sulla storia del personaggio. \r\n  In assenza del padre, Atreus ha continuato a vivere insieme alla madre mentre affinava le proprie abilit&agrave; con l&rsquo;arco, preparandosi cos&igrave; a diventare quel piccolo guerriero che avremo modo di conoscere durante la nuova avventura di Kratos. \r\n  Tra le altre cose, apprendiamo che Atreus sar&agrave; in grado di ascoltare le voci degli animali nella propria testa, caratteristica che con ogni probabilit&agrave; trover&agrave; diverse applicazioni interessanti anche a livello di <span lang=\"en\">gameplay</span>.\r\n  Nell&rsquo;attesa che il nuovo <span lang=\"en\">God of War</span> venga pubblicato in esclusiva su <span lang=\"en\">PlayStation</span> 4 nel corso del 2018, vi riproponiamo gli ultimi <span lang=\"en\">screenshot</span> del gioco mostrati nella giornata di ieri. ', 0, 0, 0, 0, 0, 0, 0, 1, 'GO00W4.jpg'),
(4, '2017-12-25', 'Auguri di buone feste dalla redazione di GamesGuide ', 'Aiolos', 'Un altro anno giunge al termine, e noi della redazione di <span lang=\"en\">Games&rsquo; Guide</span> vogliamo augurarvi buone feste e qualche giorno di sano <span lang=\"en\">relax</span> (magari in compagnia dei vostri videogiochi preferiti) in attesa di un promettente 2018. \r\n  A prescindere da come passerete i prossimi giorni, vi ringraziamo per averci seguito nel corso dell&rsquo;anno, interagendo con noi attraverso commenti e <span lang=\"en\">feedback</span> e aiutandoci a offrirvi contenuti sempre pi&ugrave; ricchi e diversificati. \r\n  All&rsquo;orizzonte ci sono tante nuove idee, rubriche, approfondimenti e contenuti che speriamo apprezzerete. Nel frattempo...Buone feste!', 1, 1, 1, 1, 1, 1, 1, 1, 'MC.jpg'),
(5, '2017-12-29', 'AMD Radeon Adrenalin Edition 17.12.2 ora disponibili ', 'Depaa', ' <span lang=\"en\"> <abbr title=\"Advanced Micro Devices\">AMD</abbr> </span> ha pubblicato una nuova versione dei <span lang=\"en\">driver</span> per le schede video dotate delle sue <span lang=\"en\"> <abbr title=\"Graphics Processing Un\">GPU</abbr> </span>. \r\n  <span lang=\"en\"> <abbr title=\"Advanced Micro Devices\">AMD</abbr> Radeon Adrenalin Edition</span> 17.12.2 risolvono alcuni problemi riscontrati dagli utenti con alcuni giochi ed applicazioni, in particolare modo ARK <span lang=\"en\">Survival Evolved<span lang=\"en\">,<span lang=\"en\"> Star Wars Battlefront</span> 2 e <span lang=\"en\">Netflix</span>. \r\n  Non ci resta che augurare ai nostri lettori buon <span lang=\"en\">download</span> e buon aggiornamento.', 0, 0, 1, 1, 0, 0, 0, 0, 'AMD.jpg'),
(6, '2017-12-30', 'Switch: Nintendo ha rimosso NES Golf dal firmware della console', 'Peachka', ' Come gi&agrave; saprete, diverso tempo fa era stata scoperta la presenza di un emulatore <span lang=\"en\"> <abbr title=\"Nintendo Entertainment System\">NES</abbr> </span> ed il titolo Golf all&rsquo;interno del <span lang=\"en\">firmware</span> di <span lang=\"en\">Switch</span>. \r\n  A quanto pare, tuttavia, Nintendo ha deciso di eliminare il gioco &ldquo;segreto&rdquo; con uno degli ultimi aggiornamenti del <span lang=\"en\">software</span> di sistema. \r\n  Infatti, la recente versione 4.0.0, pubblicata qualche settimana fa, ha completamente rimosso tutto il codice eseguibile del gioco, rimpiazzandolo con dati casuali.\r\n  Al momento non si conosce ancora il motivo per il quale il titolo era presente all&rsquo;interno della <span lang=\"en\">console</span>.\r\n  La sua rimozione lascia pensare che si potesse trattare solo di codice di prova lasciato erroneamente dai progettisti del sistema.', 0, 0, 0, 1, 0, 0, 0, 0, 'GS.jpg'),
(7, '2017-12-31', 'The Crew 2: Sono aperte ore le iscrizioni alla Beta', 'Gionny', 'Nelle scorse ore <span lang=\"en\">Ubisoft</span> ha ufficialmente aperto le iscrizioni alla fase Beta di <span lang=\"en\">The Crew</span> 2 su <span lang=\"en\">PlayStation</span> 4, <span lang=\"en\">Xbox One</span> e PC.\r\n  Per la registrazione &egrave; sufficiente recarsi a questo indirizzo, creare un <span lang=\"en\">account Ubisoft</span> (o semplicemente effettuare il <span lang=\"en\">login</span> in con quello gi&agrave; in vostro possesso), scegliere la piattaforma preferita e premere sul pulsante di conferma. \r\n  I giocatori selezionati riceveranno una <span lang=\"en\">patch</span> pochi giorni prima dell&rsquo;inizio con tutte le informazioni necessarie per ottenere l&rsquo;accesso.\r\n  Purtroppo, <span lang=\"en\">Ubisoft</span> non ha ancora annunciato la data dell&rsquo;inizio della fase di <span lang=\"en\">testing</span>, n&egrave; tantomeno quella dell&rsquo;uscita del gioco. <span lang=\"en\">The Crew</span> 2, inizialmente previsto per il 16 marzo 2018, &egrave; stato infatti rinviato dalla casa francese a data da destinarsi. \r\n  Il <span lang=\"en\">team</span> di sviluppo sfrutter&agrave; i prossimi mesi per effettuare sessioni di <span lang=\"en\">testing</span> aggiuntive e raccogliere il <span lang=\"en\">feedback</span> dei giocatori. Il titolo si &egrave; mostrato l&rsquo;ultima volta nel mese di agosto, in occasione della <span lang=\"en\">Gamescom</span> di Colonia.', 1, 1, 0, 0, 1, 0, 1, 1, 'TC2.jpg'),
(8, '2018-01-01', 'Level-5 sta lavorando a un grande progetto per il suo ventesimo anniversario ', 'Depaa', 'Il noto sviluppatore <span lang=\"en\">Level-5 </span>avrebbe alcuni grandi piani per festeggiare il loro ventesimo anniversario. Secondo quanto rivelato da <span lang=\"ja\">Akihiro Hino</span>, <span lang=\"en\"> <abbr title=\"Chief Executive Officer\">CEO</abbr> </span> di <span lang=\"en\">Level-5</span>, la compagnia starebbe lavorando a un titolo molto importante come parte della celebrazione. \r\n  Nessun dettaglio sul gioco &egrave; ancora emerso <span lang=\"en\">online</span>, ma vale la pena sottolineare che le parole di <span lang=\"ja\">Hino</span> sono apparse nel corso di un&rsquo;intervista con <span lang=\"ja\">Dengeki</span> <span lang=\"en\">PlayStation</span>, cosa che presuppone un progetto destinato alle <span lang=\"en\">console Sony</span>.  ', 0, 0, 0, 0, 1, 0, 0, 0, 'L5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `recensione`
--

CREATE TABLE `Recensione` (
  `IDr` int(4) NOT NULL,
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

INSERT INTO `Recensione` (`IDr`, `NomeGioco`, `AdminNick`, `Titolo`, `Testo`, `Data`, `Playstation3`, `Playstation4`, `Xbox360`, `XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`) VALUES
(1, 'Assassin&rsquo;s Creed: Origins', 'Aiolos', 'La Recensione di Assassin&rsquo;s Creed: Origins, mummia o faraone?', 'Separare il suo nome dalle antipatie personali e dalla negativit&agrave; che fin troppo spesso lo circonda potrebbe essere una necessit&agrave; perch&egrave; molti giocatori ne comprendano il reale valore, eppure la serie <span lang=\"en\">Assassin&rsquo;s Creed </span> possiede ancora oggi una rilevanza a cui buona parte delle altre saghe possono solo aspirare, nata da un brillante misto di accessibilit&agrave; e fascino storico. \r\n  Stiamo pur sempre parlando dei giochi che hanno introdotto nel genere <span lang=\"en\">action adventure</span> la straordinaria meccanica del  <span lang=\"en\">free running</span>, e la definiamo &ldquo;straordinaria&rdquo; perch&egrave; per un  <span lang=\"en\">game designer</span> concettualizzare e applicare un sistema in grado di rendere il movimento verticale alla portata di tutti &egrave; qualcosa di equiparabile a una visione mistica. \r\n   <span lang=\"en\">Assassin&rsquo;s Creed Origins</span> &egrave; un  <span lang=\"en\">open world</span> enorme, per offrire un ancor pi&ugrave; riuscito misto di esplorazione, combattimento e libert&agrave; d&rsquo;azione, il tutto all&rsquo;interno di una suggestiva ambientazione egiziana nell&rsquo;era di Cesare e Cleopatra. \r\n  Oggi, forti di una sessione di prova di qualche giorno a Parigi, cercheremo di capire con voi se l&rsquo;origine degli assassini rappresenta davvero un nuovo inizio per questa iconica serie.', '2017-10-27', 0, 1, 0, 1, 0, 0, 1, 0),
(2, 'Call of Duty: World War II', 'Depaa', 'La Recensione di Call of Duty: WWII, piedi in terra.', 'Se dovessimo guardare solamente i dati di vendita potremmo tranquillamente paragonare <span lang=\"en\">Call of Duty</span> a una macchina inarrestabile, una di quelle vetture talmente perfette da tagliare sempre per prime il traguardo, nonostante intoppi e incidenti di percorso. \r\n  Nell&rsquo;anno di maggior flessione per il <span lang=\"en\">brand</span>, con un capitolo non particolarmente amato dal pubblico e con un <span lang=\"en\">trailer</span> di lancio che fece registrare ai tempi il record assoluto di <span lang=\"en\">dislike</span> su <span lang=\"en\">Youtube</span>, <span lang=\"en\">Call of Duty</span> &egrave; riuscito comunque a imporsi sul mercato, perdendo forse terreno nei confronti di <span lang=\"en\">Battlefield</span> 1 ma restando saldamente ancorato sul trono. \r\n  Gi&agrave; tre anni fa per&ograve; i vertici <span lang=\"en\">Activision</span> avevano ben chiaro che il pubblico si stava disaffezionando al <span lang=\"en\">brand</span>, annoiato pi&ugrave; che dal <span lang=\"en\">gameplay</span>, da un <span lang=\"en\">setting</span> futuristico che ormai aveva ben poco altro da dire e da offrire. \r\n   La soluzione scelta per affacciarsi a questo radicale cambiamento &egrave; stata quella di far un passo indietro e tornare in quella seconda guerra mondiale che mancava dalla scena da ormai troppo tempo. Quest&rsquo;anno, tra le altre cose, della campagna di <span lang=\"en\">Call of Duty</span> e dei suoi contenuti extra se ne &egrave; parlato davvero pochissimo, lasciando che fosse il <span lang=\"en\">multiplayer</span> ad assorbire tutte le attenzioni durante gli eventi e le beta pubbliche. \r\n  Qualche settimana fa siamo per&ograve; volati a Londra per affondare i denti sul pacchetto completo e oggi torniamo da voi con il verdetto finale per la produzione.', '2017-11-03', 0, 1, 0, 1, 0, 0, 1, 0),
(3, 'Super Mario Odyssey', 'admin', 'La Recensione di Super Mario Odyssey', 'Nonostante sia stato spesso definito come tale, Super Mario <span lang=\"en\">Odyssey</span>, almeno in senso stretto, non &egrave; il seguito di Super Mario 64. \r\n  Questo nuovo <span lang=\"en\">platform</span> tridimensionale, diretto da <span lang=\"ja\">Kenta Motokura</span> e prodotto da <span lang=\"ja\">Hayashida</span> e <span lang=\"ja\">Koizumi</span>, non si limita a voler rinverdire le meccaniche di Super Mario 64: prende il punto forte di ogni predecessore e lo sfida a duello, il tutto mentre tenta di armonizzare e fondere assieme queste dinamiche tra loro molto diverse. \r\n  Si ispira all&rsquo;esplorazione del capostipite su Nintendo 64, ripropone le missioni tematiche di Super Mario <span lang=\"en\">Sunshine</span>, eredita la variet&agrave; e gli scherzi gravitazionali di Super Mario <span lang=\"en\">Galaxy</span>, e perfino dall&rsquo;ultimo Super Mario 3D <span lang=\"en\">World</span>, teoricamente cos&igrave; diverso, riprende ritmo e abbondanza di contenuti.\r\n  Insomma, per dirla alla <span lang=\"en\">Tolkien</span>, &ldquo;un <span lang=\"en\">platform</span> per domarli, un <span lang=\"en\">platform</span> per trovarli, un <span lang=\"en\">platform</span> per ghermirli e nell&rsquo;oscurit&agrave; incatenarli&rdquo;.', '2017-10-27', 0, 0, 0, 0, 0, 1, 0, 0),
(4, 'The Legend of Zelda: Breath of the Wild', 'Peachka', 'La Recensione di The Legend of Zelda: Breath of the Wild', 'Questo ultimo episodio di <span lang=\"en\">The Legend of</span> Zelda &egrave; il gioco pi&ugrave; grande e costoso della storia Nintendo: &egrave; stato sviluppato per cinque anni (dal 2012 al 2016) e ha richiesto, al culmine della lavorazione, l&rsquo;impegno di circa trecento persone, alcune delle quali tra l&rsquo;altro, provenienti da <span lang=\"en\">Monolith Soft. </span>\r\n  Per trovare un progetto altrettanto ambizioso da parte dell&rsquo;azienda bisogna andare indietro nel tempo di quasi due decenni. Alcuni di voi potrebbero citare Super Mario <span lang=\"en\"> Galaxy </span> ma, l&rsquo;avventura interplanetaria dell&rsquo;idraulico, per quanto sperimentale e straordinaria, ha rappresentato un&rsquo;eccellenza fine a s&egrave; stessa.\r\n  Al contrario, <span lang=\"en\">Breath of the Wild</span> si &egrave; fatto carico non solo del proprio destino, ma di quello di <span lang=\"en\"> <abbr title=\"Environmental Product Declaratio\">EPD </abbr> </span>: gli enormi tempi richiesti dall&rsquo;elaborazione di un nuovo <span lang=\"en\">engine</span>, comprendente un avanzato motore fisico, saranno ripagati dalla condivisione di questi elementi con altri titoli sviluppati internamente.', '2017-03-03', 0, 0, 0, 0, 0, 1, 0, 0),
(5, 'Need For Speed: Payback', 'Aiolos', 'La Recensione di Need For Speed: Payback, La vendetta &egrave; servita!', 'Con grande sorpresa, il sistema di guida adottato &egrave; abbastanza realistico e l&rsquo;aspetto visivo non &egrave; per niente male. La modalit&agrave; di guida somiglia a Forza <span lang=\"en\">Horizon</span> di <span lang=\"en\">Playground Games</span>, che fa del realismo il proprio cavallo di battaglia, con una grande differenza: il controllo del veicolo. Quest&rsquo;ultimo forse risulta un po&rsquo; troppo eccessivo: &egrave; impensabile fare una curva a gomito. Tuttavia &egrave; un gioco con obiettivi completamente diversi, quindi sotto questo punto di vista &egrave; giustificato. Le gare hanno una struttura classica, ovvero si devono attraversare i vari <span lang=\"en\">checkpoint</span> e concludere primi. Sembra facile detta cos &igrave. L&rsquo;intelligenza artificiale dei piloti contro cui si gareggia &egrave; talvolta un po&rsquo; troppo competitiva: non mancano situazioni in cui si ricevono e si danno sportellate, cambia solo il modo in cui le si danno. Nella modalit&agrave; corsa &egrave; sufficiente spingere un veicolo nemico fuori dalla carreggiata per vedere la sua velocit&agrave; scendere, lo stesso giochetto per&ograve; non si riesce ad applicare nelle gare fuoristrada, dove appunto le auto sono pensate per tutti i tipi di terreni. L&rsquo;aspetto della macchina &egrave; personalizzabile, soprattutto per quanto riguarda le aerografie. Il gioco utilizza un sistema che ricorda molto i livelli di <span lang=\"en\">photoshop</span>, posizionabili e scalabili liberamente, su ogni punto della carrozzeria. Sta solo alla creativit&agrave; del giocatore! Non ci sono <span lang=\"en\">frame drop</span> da segnalare, il gioco mantiene i 30  <abbr title=\"fotogrammi per secondo\">fps</abbr> praticamente sempre, anche in gare fuoristrada dove gli effetti sono tanti. Il tutto senza casi di <span lang=\"en\">aliasing</span> eclatanti. Il mondo aperto ed esplorabile nel gioco &egrave; una delle introduzioni pi&ugrave; gradite: la mappa &egrave; molto vasta, con ogni tipo di pista ma nulla di esagerato. Le piste in cui si svolgono le gare sono pezzi della mappa in cui si guida liberamente, dai deserti, in grande numero, alle montagne, per finire anche citt&agrave;. Ma c&rsquo;&egrave; qualcosa che manca, un qualcosa che per i fan delle corse fa la differenza: la visuale interna del veicolo. Inoltre, i danni al veicolo sono solo estetici, non influiscono sulle prestazioni del mezzo e per di pi&ugrave; basta passare da un benzinaio per far sparire tutto. Ci sono alcuni dettagli che bisogna valorizzare, come lo sporco. La radio ha diversi generi, che spaziano dal <span lang=\"en\">hip hop</span> al <span lang=\"en\">rock</span>, con diversi bei brani. Peccato, per&ograve;, che la radio non si possa spegnere per godersi il rombo del motore. &Egrave; un ottimo gioco, molto divertente. Siamo di fronte ad un erede dei cari e vecchi <span lang=\"en\">Need For Speed Undergound</span>.', '2017-11-30', 0, 1, 0, 1, 0, 0, 1, 0),
(6, 'FIFA 18', 'Gionny', 'La Recensione di FIFA 18: sempre il solito?', 'La modalit&agrave; che maggiormente ne ha beneficiato in FIFA 18 &egrave; il ritorno di <span lang=\"en\">Hunter.</span> \r\n  Nel secondo capitolo dell&rsquo;epopea calcistica di <span lang=\"en\">Alex Hunter</span> potremo osservare tutta una serie di miglioramenti davvero notevoli, che elevano l&rsquo;esperienza al rango di film interattivo. \r\n  Grazie al <span lang=\"en\">Frostbite</span>, infatti, non solo ogni filmato di gioco &egrave; incredibile nel suo realismo, con i volti delle diverse <span lang=\"en\">guest star</span> che si alternano sullo schermo perfettamente riprodotti, ma anche tutto il confezionamento delle scene pre e post partita ha subito un netto balzo in avanti. \r\n  Gli stadi sono riprodotti perfettamente e tutto &egrave; girato con un taglio registico che poco ha da invidiare alle produzioni di <span lang=\"en\">Sky</span> o Mediaset.\r\n  Oltre al lato estetico, in FIFA 18 sono stati introdotti anche altri miglioramenti come la possibilit&agrave; di modificare il <span lang=\"en\">look</span> di <span lang=\"en\">Hunter</span> o la possibilit&agrave; di incidere su alcune piccole decisioni che il giovane dovr&agrave; prendere durante la nuova stagione calcistica. \r\n  Decisamente pi&ugrave; impattanti saranno la possibilit&agrave; di giocare a una sorta di FIFA <span lang=\"en\">Street</span> in miniatura (invero piuttosto divertente) o quella di giocare nei panni di altre persone oltre ad Alex. Non entriamo pi&ugrave; nei dettagli per non rovinare la sorpresa.', '2017-09-29', 1, 1, 1, 1, 0, 1, 1, 0),
(7, 'The Legend Of Zelda: A Link Between Worlds', 'Peachka', 'La Recensione di The Legend Of Zelda: A Link Between Worlds. Un remake con qualcosa di pi&ugrave;!', 'Credeteci o no, malgrado si stia parlando di un capitolo assolutamente e totalmente riconoscibile tanto nell&rsquo;aspetto quanto nel <span lang=\"en\">gameplay, A Link Between Worlds</span> &egrave; un coraggioso esempio di come il <span lang=\"en\">brand</span> possa avere ancora molto da dire pur senza perdere nemmeno un briciolo della propria identit&agrave;. Iniziamo dicendo per&ograve; che la trama non &egrave; certamente dove i <span lang=\"en\">designer</span> hanno scelto di concentrare i propri sforzi, anzi rappresenta probabilmente l&rsquo;unico vero punto debole dell&rsquo;intero pacchetto: siamo infatti ancora una volta nell&rsquo;ambito di un <span lang=\"en\">Link</span> che si scopre eroe nel momento in cui la principessa Zelda viene rapita e trasformata in un dipinto, assieme a sette saggi, dal malvagio di turno chiamato Yuga. Basta per&ograve; superare il prologo infatti per venire in possesso della principale abilit&agrave; di <span lang=\"en\">Link</span> in questo capitolo, ovvero appunto la capacit&agrave; di tramutarsi in un suo ritratto stilizzato su pareti o muri semplicemente premendo A in prossimit&agrave; di essi. Il bello &egrave; che poi, sotto forma di disegno, ci si pu&ograve; muovere lungo tale superficie, su un piano puramente bidimensionale. Una magia, che in termini pratici spalanca le porte ad una moltitudine di applicazioni all&rsquo;interno di ogni ambiente e situazione dell&rsquo;intera storia. C&rsquo;&egrave; soltanto una fessura tra una stanza e l&rsquo;altra? Poco male, basta entrare nel muro per passarci attraverso. Inutile dire che il <span lang=\"en\">level design</span> sia stato studiato finemente e alla perfezione per sfruttare in maniera ottimale tale abilit&agrave;, e su questo aspetto c&rsquo;&egrave;veramente poco da dire: Nintendo rimane uno degli sviluppatori migliori, se non il migliore in assoluto, quando si tratta di far combaciare tutti i pezzi donando una continuit&agrave; e una coerenza inattaccabile. E nel caso specifico di <span lang=\"en\">The Legend of Zelda: A Link Between Worlds</span> il risultato &egrave; veramente eccezionale.', '2013-11-22', 0, 0, 0, 0, 1, 0, 0, 0),
(8, 'Crash Bandicoot: N.Sane Trilogy', 'Aiolos', 'La Recensione di Crash Bandicoot, un sogno che diventa realt&agrave;', 'Chiudete gli occhi e ripensate al passato. Siete davanti alla vostra <span lang=\"en\">PlayStation</span> in un caldo pomeriggio estivo e avete voglia di farvi una bella partita a <span lang=\"en\">Crash Bandicoot</span>: non sentite un brivido lungo la schiena quando ci ripensate? Inaspettatamente per&ograve; <span lang=\"en\">Activision</span> ha esaudito i loro sogni affidando al <span lang=\"en\">team Vicarious Visions</span> il compito di riportare su <span lang=\"en\">PlayStation</span> 4 i primi indimenticabili capitoli dedicati alla <span lang=\"fr\">mascotte </span> <span lang=\"en\">Sony</span>. Quando affermiamo che i tre giochi sono davvero quelli di vent&rsquo;anni fa non lo diciamo con leggerezza: scommettiamo che ognuno di voi conserva il ricordo di un livello particolarmente odiato, di una sfida a tempo impossibile o di una maledetta cassa nascosta che avete trovato solo dopo aver fatto su e gi&ugrave; dalla zona bonus almeno una decina di volte... Se vent&rsquo;anni fa avete vissuto queste difficolt&agrave; preparatevi perch&egrave; sono ancora l&igrave; che vi aspettano, con la differenza che nel frattempo tutti abbiamo giocato per vent&rsquo;anni a videogiochi che ci hanno illuso di essere difficili. A meno che non vi siate esercitati Per essere affrontata seriamente, la <span lang=\"en\">N. Sane Trilogy</span> richiede gli stessi riflessi e la stessa concentrazione impiegati per portare a termine i giochi originali, una <span lang=\"en\">performance</span> particolarmente estenuante per tutti i giocatori moderni un po&rsquo; distratti. La difficolt&agrave; offerta dalla trilogia si estende come in passato su diversi piani perch&egrave; oltre a non abbassare mai la guardia, dovremo scovare i bonus dei vari giochi, rifare pi&ugrave; volte un livello per accedere alla sua zona segreta, cimentarci in ostiche sessioni di <span lang=\"en\">backtracking</span> e capire il giusto ordine in cui rompere un gruppo di casse quasi fosse un piccolo <span lang=\"en\">puzzle</span>.', '2017-06-30', 0, 1, 0, 0, 0, 0, 0, 0),
(9, 'The Sims 3', 'Depaa', 'La Recensione di The Sims 3, il passo tecnologico &egrave; qui!', 'A distanza di cinque anni dal precedente capitolo e di nove da quello originale, i Sims tornano sui nostri schermi con tutto il loro carico di nevrosi, ambizioni, rapporti sociali e carriere da seguire. Ma cosa si pu&ograve; innovare ancora in un genere che sembrava aver detto ormai tutto? Eppur ci riesce. Riproponendo la stessa, solita formula, apparentemente trita e ritrita <span lang=\"en\">The </span>Sims 3 riesce a generare l&rsquo;inconsueta alchimia capace di affascinarci, di incollarci allo schermo e di costringerci a sperimentare nuove possibilit&agrave; nella vita dei nostri simmini. La comunit&agrave; dei <span lang=\"en\">modder</span> si &egrave; sbizzarrita all&rsquo;infinito, creando interi cataloghi di oggetti, abiti e tratti fisici da scaricare ed aggiungere alla pur non sfornita libreria del gioco, oltre a generare fior di addon che permettevano nuove interazioni e qualche modifica all&rsquo;aspetto del gioco. Una delle migliori frecce al suo arco &egrave; sicuramente l&rsquo;introduzione dell&rsquo;integrazione pressoch&egrave; totale dei nostri alter ego virtuali nalla cittadina nella quale vivono. Oggi infatti possiamo raggiungere tutti i luoghi comunitari dalla mappa della citt&agrave; e la nostra vita non &egrave; pi&ugrave; limitata alla nostra abitazione: possiamo visitare la galleria d&rsquo;arte, la piscina comunale, lo stadio, la palestra ed una serie di altri lotti comunitari nei quali possiamo svolgere le attivit&agrave; del caso ed interagire con gli altri Sims presenti. Questa &egrave; una delle vere grandi novit&agrave; del terzo capitolo dei Sims: non pi&ugrave; un mondo istanziato con limitate possibilit&agrave; di visita a locazioni esterne ma un vero e proprio unico ambiente interagibile nel quale sentirci davvero parte di una comunit&agrave;. A noi scegliere quali opportunit&agrave; sfruttare e che genere di integrazione sociale desideriamo avere.', '2009-06-02', 1, 0, 1, 0, 1, 0, 1, 1),
(10, 'Outlast 2', 'Depaa', 'La Recensione di Outlast2, non il solito horror','Quel che &egrave; papabile fin dai primi minuti di gioco &egrave; che la narrazione in <span lang="en"> Outlast </span>2 ha raggiunto una piena maturazione, acquisendo una predominanza che continua incessantemente durante tutta la campagna principale e senza mai annoiare. Dimentichiamoci gli esagerati <span lang="en"> jumpscare </span> del primo capitolo, creando un&rsquo;atmosfera che infastidisce e inquieta nel profondo. I momenti angoscianti sono davvero tanti e non necessitano di improvvisi sbalzi di volume, poich&egrave; quel che spaventa di pi&ugrave; &egrave; quello che possiamo intuire a livello strutturale e profondo, ovvero l&rsquo;organizzazione della setta satanica con cui abbiamo a che fare, ma che non riusciamo a comprendere totalmente. &Egrave; bene specificare infatti che non &egrave; un gioco adatto a tutti, non solo per la violenza o per lo spavento che &egrave; in grado di inscenare, ma soprattutto in virt&ugrave; dei temi trattati e della maturit&agrave; consigliata per poterne cogliere le varie sfaccettature senza fermarsi a un livello pi&ugrave; superficiale. Dal satanismo la religione, il fanatismo e la pedofilia, nonch&egrave; altri temi di cui non &egrave; possibile parlare senza fare <span lang="en"> spoiler</span> su una trama che risulta davvero avvincente, nonch&egrave; centrale nell&rsquo;economia della produzione. Quindi <span lang="en"> Outlast</span> 2 riesce nella difficilissima impresa di superare sotto quasi tutti i punti di vista il proprio predecessore, alzando nuovamente l&rsquo;asticella per quanto riguarda gli standard dei <span lang="en"> survival horror</span>. Trova il suo unico punto debole in un <span lang="en"> gameplay</span> semplice, un po&rsquo; scriptato e spesso riducibile a una corsa disperata verso un&rsquo;incerta salvezza, laddove avremmo di certo preferito godere di una maggiore libert&agrave; d&rsquo;azione.', '2017-04-25', 0, 1, 0, 1, 0, 1, 1, 1);


-- --------------------------------------------------------

--
-- Table structure for table `videogiochi`
--

CREATE TABLE `Videogiochi` (
  `ID` int(4) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Data` date NOT NULL,
  `Genere1` varchar(100) NOT NULL,
  `Genere2` varchar(100) DEFAULT NULL,
  `Genere3` varchar(100) DEFAULT NULL,
  `PEGI` int(5) DEFAULT NULL,
  `Valutazione` double DEFAULT NULL,
  `Disponibilita` varchar(512) DEFAULT NULL,
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
-- Dumping data for table `videogiochi`
--

INSERT INTO `Videogiochi` (`ID`, `Nome`, `Data`, `Genere1`, `Genere2`, `Genere3`, `PEGI`, `Valutazione`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`, `XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`) VALUES
(1, 'Assassin&rsquo;s Creed: Origins', '2017-10-27', '<span lang="en"><abbr title="Role Playing Game">RPG</abbr></span>', 'Avventura', NULL, 18, NULL, '<span lang="en"> <abbr title="Playstation 4">Ps4</abbr>, Xbox One, Windows</span>', 0, 1, 0, 1, 0, 0, 1, 0, 'L&rsquo;Antico Egitto, sta scomparendo in una lotta spietata per il potere. Scopri oscuri segreti e miti dimenticati e vivi l&rsquo;inizio di tutto: le origini della Confraternita degli Assassini.\r\nEsplora tombe perdute e piramidi per scoprire i segreti delle mummie, degli d&egrave;i e degli ultimi faraoni.\r\nNaviga lungo il Nilo e scopri i misteri delle piramidi.\r\nScopri un nuovo sistema di combattimento e impossessati di molte nuove armi, ognuna diversa per rarit&agrave; e caratteristiche.'),
(2, 'Call of Duty: World War II', '2017-11-03', '<span lang="en"><abbr title="First Person Shooter">FPS</abbr></span>', 'Azione', NULL, 18, NULL, '<span lang="en"> <abbr title="Playstation 4">Ps4</abbr>, Xbox One, Windows</span>', 0, 1, 0, 1, 0, 0, 1, 0, 'Un&rsquo;esperienza mozzafiato che porter&agrave; una nuova generazione nella Seconda Guerra Mondiale. Sbarca in Normandia e combatti in tutta Europa rivivendo leggendarie battaglie che hanno segnato il conflitto pi&ugrave; sanguinoso della storia. Scopri il classico combattimento di <span lang=\"en\">Call of Duty</span>, i legami del cameratismo e il cuore crudele della guerra.'),
(3, 'Super Mario Odyssey', '2017-10-27', 'Avventura', 'Azione', NULL, 10, NULL, '<span lang="en"><abbr title="Nintendo Switch">NSwitch</abbr></span>', 0, 0, 0, 0, 0, 1, 0, 0, 'Mario approda su Nintendo <span lang=\"en\">Switch</span> con un&rsquo;avventura 3D senza precedenti! Questo fantastico gioco in stile <span lang=\"en\">sandbox</span>; il primo dai tempi degli amatissimi Super Mario 64 del 1996 e Super Mario <span lang=\"en\">Sunshine</span> del 2002, &egrave; pieno zeppo di segreti e sorprese! Mario pu&ograve; ora contare su tutta una serie di nuove mosse e abilit&agrave;, come lanci o salti che sfruttano il cappello. Pu&ograve; persino impossessarsi di personaggi e oggetti, per possibilit&agrave; di <span lang=\"en\">gameplay</span> incredibili e mai sperimentate prima.'),
(4, 'The Legend of Zelda: Breath of the Wild', '2017-03-03', 'Avventura', 'Azione', NULL, 18, NULL, '<span lang="en"><abbr title="Nintendo Switch">NSwitch</abbr></span>', 0, 0, 0, 0, 0, 1, 0, 0, 'Dimentica tutto quello che sai sui giochi di <span lang=\"en\">The Legend of Zelda</span> e immergiti in un mondo di scoperte, esplorazione e avventura in <span lang=\"en\">The Legend of Zelda: Breath of the Wild</span>, il nuovo capitolo di questa amatissima serie. Attraversa campi, foreste e montagne mentre cerchi di capire cosa &egrave; successo al regno di Hyrule in questa enorme, straordinaria avventura.\r\nLungo la strada affronterai nemici giganteschi, caccerai animali selvatici e raccoglierai il cibo e le pozioni che ti servono per sopravvivere.\r\nPi&ugrave; di 100 sacrari da scoprire ed esplorare.'),
(5, 'Need For Speed: Payback', '2017-11-10', 'Sport', 'Azione', NULL, 12, NULL, '<span lang="en"> <abbr title="Playstation 4">Ps4</abbr>, Xbox One, Windows</span>', 0, 1, 0, 1, 0, 0, 1, 0, 'Sullo sfondo della corruzione di <span lang=\"en\">Fortune Valley</span>, il desiderio di vendetta porta la tua banda a riunirsi per sconfiggere la Loggia, una spietata organizzazione che esercita il suo controllo sui casin&ograve;, i criminali e i poliziotti della citt&agrave;. In questo paradiso del gioco d&rsquo;azzardo, la posta in palio &egrave; alta e la Loggia ha sempre le carte vincenti in mano. Affronta diversi eventi nei panni di <span lang=\"en\">Tyler, Mac, Jess</span>. Guadagnati il rispetto del sottobosco della <span lang=\"en\">Valley</span> e gareggia nella sfida finale per sconfiggere la Loggia una volta per tutte.'),
(6, 'FIFA 18', '2017-09-29', 'Sport', NULL, NULL, 3, NULL, '<span lang="en"> <abbr title="PlayStation 3">Ps3</abbr>, <abbr title="PlayStation 4">Ps4</abbr>, Xbox 360, Xbox One, <abbr title="Nintendo Switch">NSwitch</abbr>, Windows</span>', 1, 1, 1, 1, 0, 1, 1, 0, 'FIFA 18 attenua il confine tra il mondo reale e virtuale dando vita a eroi, squadre e atmosfere del gioco pi&ugrave; bello del mondo. \r\nIntroduce la pi&ugrave; grande innovazione al sistema di gioco nella storia della serie, la tecnologia d&rsquo;animazione <span lang=\"en\">Real Player</span>, un sistema innovativo che sblocca un nuovo livello di reattivit&agrave; e di personalit&agrave; dei giocatori. \r\nOra Cristiano Ronaldo e gli altri campioni si muovono esattamente come sul campo reale.'),
(7, 'The Legend Of Zelda: A Link Between Worlds', '2013-11-22', 'Avventura', '<span lang="en"><abbr title="Role Playing Game">RPG</abbr></span>', NULL, 12, NULL, '<abbr title="Nintendo DS">NDS</abbr>', 0, 0, 0, 0, 1, 0, 0, 0, '<span lang=\"en\">The Legend of Zelda: A Link Between Worlds</span> introduce un set completamente nuovo di rompicapi e <span lang=\"en\">dungeon</span>! Questa volta <span lang=\"en\">Link</span> pu&ograve; anche muoversi sui muri come se fosse un dipinto. Questa possibilit&agrave; cambia completamente la tua prospettiva, permettendoti di pensare in una nuova dimensione e risolvere rompicapi prima impensabili. L&rsquo;ordine e il modo in cui ti cimenti con ciascun labirinto dipender&agrave; completamente da te. Incontrerai anche un nuovo personaggio, Lavio, che rappresenta la chiave verso il successo: nella sua bottega potrai affittare o acquistare oggetti,che ti saranno utili nel corso dell&rsquo;avventura.'),
(8, 'Crash Bandicoot: N.Sane Trilogy', '2017-06-30', 'Piattaforma', 'Azione', 'Avventura', 7, NULL, '<span lang="en"> <abbr title="Playstation 4">Ps4</abbr></span>', 0, 1, 0, 0, 0, 0, 0, 0, 'Il tuo marsupiale preferito, <span lang=\"en\">Crash Bandicoot</span>, &egrave; tornato! Pi&ugrave; forte e pronto a scatenarsi con <span lang=\"en\">N. Sane Trilogy game collection</span>. Ruota, salta, scatta e divertiti atttraverso le sfide e le avventure dei tre giochi da dove tutto &egrave; iniziato. Rivivi i migliori momenti con la grafica completamente rimasterizzata in <abbr title=\"Hight Definition\">HD</abbr>!'),
(9, 'The Sims 3', '2009-06-02', 'Simulazione', NULL, NULL, 13, NULL, '<span lang="en"> <abbr title="PlayStation 3"> Ps3 </abbr>, Xbox 360, <abbr title="Nintendo DS">NDS</abbr>, Windows, Mac</span>', 1, 0, 1, 0, 1, 0, 1, 1, '<span lang=\"en\">The </span>Sims 3 &egrave; un capolavoro di simulazione che ti d&agrave; la possibilit&agrave; di ipotizzare e vivere tutte le vite che ti pare. Crea tutti i personaggi che vuoi, ognuno diverso dall&rsquo;altro in quanto a caratteristiche fisiche e psicologiche, regalagli una casa e un mondo in cui vivere.E poi stai a vedere che succede. Con <span lang=\"en\">The</span> Sims 3 non c&rsquo;&egrave; nulla di prevedibile e nulla di impossibile.'),
(10, 'Outlast 2', '2017-04-25', '<span lang="en"> Horror</span>', 'Azione', NULL, 18, NULL, '<span lang="en"> <abbr title="Playstation 4"> Ps4</abbr>, XboxOne, <abbr title="Nintendo Switch">NDS</abbr>, Windows, Mac</span>', 0, 1, 0, 1, 0, 1, 1, 1, '<span lang="en"> Blake Langermann</span>, un <span lang="en"> cameraman</span> che lavora con sua moglie <span lang="en"> Lynn</span>; giornalisti investigativi disposti a correre qualsiasi rischio e a scavare a fondo per svelare le storie che nessuno si azzarda a toccare. Seguendo una scia di indizi iniziata con l&rsquo;omicidio apparentemente impossibile di una donna incinta sconosciuta ed identificata semplicemente come <span lang="en"> Jane Doe</span>. L&rsquo;indagine li ha condotto nel cuore del deserto dell&rsquo;Arizona, in un&rsquo;oscurit&agrave; cos&igrave; profonda che nessuno potrebbe illuminare e in una corruzione cos&igrave; intensa che impazzire potrebbe essere l&rsquo;unica cosa sensata da fare.');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nickname` (`Nickname`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `commentinotizie`
--
ALTER TABLE `Commentinotizie`
  ADD PRIMARY KEY (`IDc`),
  ADD KEY `CommentiNotizie` (`TitoloNotizia`),
  ADD KEY `NickName` (`NickName`);

--
-- Indexes for table `commentirecensione`
--
ALTER TABLE `Commentirecensione`
  ADD PRIMARY KEY (`IDc`),
  ADD KEY `commentirecensione` (`TitoloRecensione`),
  ADD KEY `NickName` (`NickName`);

--
-- Indexes for table `genere`
--
ALTER TABLE `Genere`
  ADD PRIMARY KEY (`CodiceGenere`),
  ADD UNIQUE KEY `CodiceGenere` (`CodiceGenere`);

--
-- Indexes for table `immagini`
--
ALTER TABLE `Immagini`
  ADD UNIQUE KEY `NomeGioco` (`NomeGioco`);

--
-- Indexes for table `notizie`
--
ALTER TABLE `Notizie`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Titolo` (`Titolo`);

--
-- Indexes for table `recensione`
--
ALTER TABLE `Recensione`
  ADD PRIMARY KEY (`IDr`),
  ADD UNIQUE KEY `CodiceRecensione` (`IDr`),
  ADD KEY `Articolo` (`AdminNick`),
  ADD KEY `Articolo1` (`NomeGioco`);

--
-- Indexes for table `videogiochi`
--
ALTER TABLE `Videogiochi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Videogioco` (`Genere1`),
  ADD KEY `Videogioco1` (`Genere2`),
  ADD KEY `Videogioco2` (`Genere3`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `Account`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `commentinotizie`
--
ALTER TABLE `Commentinotizie`
  MODIFY `IDc` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commentirecensione`
--
ALTER TABLE `Commentirecensione`
  MODIFY `IDc` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genere`
--
ALTER TABLE `Genere`
  MODIFY `CodiceGenere` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notizie`
--
ALTER TABLE `Notizie`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `recensione`
--
ALTER TABLE `Recensione`
  MODIFY `IDr` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `videogiochi`
--
ALTER TABLE `Videogiochi`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
