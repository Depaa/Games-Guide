/********************************************************************* ADMIN *********************************************************************/
DROP TABLE IF EXISTS `Admin`;
CREATE TABLE IF NOT EXISTS `Admin`
(
	`Nickname` VARCHAR(16) NOT NULL UNIQUE,
    `Password` VARCHAR(16) NOT NULL,
    `Email` VARCHAR(32) NOT NULL UNIQUE,
    `Cognome` VARCHAR(20) NOT NULL,
    `Nome` VARCHAR(20) NOT NULL,
    `DataNascita` DATE NOT NULL,
    `DataRegistrazione` DATE NOT NULL,
    `CodiceFiscale` CHAR(16) NOT NULL,
    `Città` VARCHAR(32),
    `Via` VARCHAR(32),
    `NumeroCivico` INT(4),
    
    PRIMARY KEY(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Admin`(`NickName`, `Password`, `Email`, `Cognome`, `Nome`, `DataNascita`, `DataRegistrazione`, `CodiceFiscale`, `Città`, `Via`, `NumeroCivico`)
VALUES
('admin', 'admin', 'admin@admin.admin', 'admin', 'admin', '2001-01-01', '2017-12-01', 'DMNDMN01R01C743Q', 'Adminlandia', 'Administrazione', '10'),
('Maxutanu', 'pecpecpec', 'frapec96@gmail.com', 'Pecile', 'Francesco', '1996-12-04', '2017-11-20', 'PCLFRN01R01C743Q', 'Gorizia', 'udinese', '6'),
('Depaa', 'asdfghjkl', 'depascale.matteo@gmail.com', 'Depascale', 'Matteo', '1995-08-20', '2017-11-20', 'DPSMTT95M20C743A', 'Cittadella', 'della centuriazione', '9'),
('Drakex94', 'helpme', 'frasack94@gmail.com', 'Sacchetto', 'Francesco', '1994-12-19', '2017-11-28', 'SCCFRN01R01C743Q', 'Ancona', 'anconese', '120');

/********************************************************************* USER *********************************************************************/
DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User`
(
	`Nickname` VARCHAR(16) NOT NULL UNIQUE,
    `Password` VARCHAR(16) NOT NULL,
    `Email` VARCHAR(32) NOT NULL UNIQUE,
    `Cognome` VARCHAR(20) NOT NULL,
    `Nome` VARCHAR(20) NOT NULL,
    `DataNascita` DATE NOT NULL,
    `DataRegistrazione` DATE NOT NULL,
    `CodiceFiscale` CHAR(16) NOT NULL UNIQUE,
    `Città` VARCHAR(32),
    `Via` VARCHAR(32),
    `NumeroCivico` INT(4),
    
    PRIMARY KEY(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `User`(`NickName`, `Password`, `Email`, `Cognome`, `Nome`, `DataNascita`, `DataRegistrazione`, `CodiceFiscale`, `Città`, `Via`, `NumeroCivico`)
VALUES
('user', 'user', 'user@user.user', 'user', 'user', '2001-01-01', '2017-12-01', 'USRUSR01R01C743Q', 'Userlandia', 'Usernistrazione', '10'),
('Aiolos', '123qwerty789', 'gian82095@gmail.com', 'Pettenuzzo', 'Gianmarco', '1995-08-20', '2017-12-03', 'PTTGMR95M20C743Y', 'San Martino di Lupari', 'tolomei', '1'),
('Gionny-Atlas', '0987654321', 'frabat@icloud.com', 'Battistella', 'Francesco', '1994-10-01', '2017-12-05', 'BTTFRC94R01C743T', 'Cittadella', 'carducci', '23'),
('Nikocister', 'Sassonia', 'nicocister95@gmail.com', 'Cisternino', 'Nicola', '1995-01-12', '2017-12-12', 'CSTNCL95H70B745B', 'Cagliari', 'breganzie', '70'),
('Snordio', 'Chioggia4ever', 'steno996@gmail.com', 'Nordio', 'Stefano', '1995-06-15', '2017-12-20', 'NRDSTF95R08C743Q', 'Chioggia', 'verdi', '46'),
('Mmasier', 'chubby', 'marcmasi@icloud.com', 'Masiero', 'Marco', '1992-09-09', '2017-12-26', 'MSRMRC92R03C743Q', 'Treviso', 'novembre', '80'),
('Peachka', 'ciaone', 'lucia.fenu95@gmail.com', 'Lucia', 'Fenu', '1995-06-30', '2017-12-30', 'FNELCU95H70B745B', 'Cagliari', 'muri bianchi', '39'),
('user123', 'user', 'user123@user.user', 'user', 'user', '2001-01-01', '2017-12-01', '123USR01R01C743Q', 'Userlandia', 'Usernistrazione', '10');

/********************************************************************* GENERE *********************************************************************/
DROP TABLE IF EXISTS `Genere`;
CREATE TABLE IF NOT EXISTS `Genere`
(
	`CodiceGenere` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `Nome` VARCHAR(32) NOT NULL, 
    
    PRIMARY KEY(`CodiceGenere`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Genere`(`Nome`)
VALUES
('Avventura'),
('Azione'),
('Sport'),
('Simulazione'),
('Strategia'),
('Musicale'),
('Ruolo'),
('Sparatutto'),
('Picchiaduro'),
('FPS'),
('Piattaforma'),
('Horror');

/********************************************************************* PIATTAFORMA *********************************************************************/
DROP TABLE IF EXISTS `Piattaforma`;
CREATE TABLE IF NOT EXISTS `Piattaforma`
(
	`CodicePiattaforma` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `Nome` VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(`CodicePiattaforma`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Piattaforma`(`Nome`)
VALUES 
('Xbox One'),
('Playstation 4'),
('Nintendo Switch'),
('Xbox 360'),
('Playstation 3'),
('Nintendo DS'),
('PC'),
('Andriod'),
('iOS');

/********************************************************************* NOTIZIA *********************************************************************/
DROP TABLE IF EXISTS `Notizia`;
CREATE TABLE IF NOT EXISTS `Notizia`
(
	`CodiceNotizia` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `CodiceGioco` INT(4) DEFAULT NULL,
	`AdminNick` VARCHAR(16) NOT NULL,
    `DataPubblicazione` DATETIME NOT NULL,
    `Titolo` VARCHAR(256) NOT NULL,
    `Contenuto` VARCHAR(4096) NOT NULL,
    `CodicePiattaforma` INT(4) DEFAULT NULL,
    
    FOREIGN KEY `Notizia`(`AdminNick`) REFERENCES `Admin`(`Nickname`),
    FOREIGN KEY `Notizia1`(`CodicePiattaforma`) REFERENCES `CodicePiattaforma`(`Piattaforma`),
    FOREIGN KEY `Notizia2`(`CodiceGioco`) REFERENCES `Videogioco`(`CodiceGioco`),
    PRIMARY KEY (`CodiceNotizia`)    
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Notizia`(`AdminNick`, `CodiceGioco`, `DataPubblicazione`, `Titolo`, `Contenuto`, `CodicePiattaforma`)
VALUES
('Depaa', NULL, '2017-11-21 19:30:10', 'Presentata Xbox One X', 
'Xbox One X è, anzitutto, un piccolo miracolo di ingegneria e progettazione.',
1),
('Drakex94', 6, '2017-11-29 15:05:08', 'BREATH OF THE WILD PREMIATO COME GIOCO DELL''ANNO', 
'Nuovo importante riconoscimento per The Legend of Zelda Breath of the Wild.', 
NULL),
('admin', NULL, '2017-12-02 12:30:10', 'admin admin admin admin admin', 
'admin admin admin admin admin admin', 
NULL),
('Depaa', NULL, '2017-12-03 12:00:10', 'THE CREW 2: APERTE LE ISCRIZIONI ALLA FASE BETA', 
'Nelle scorse ore Ubisoft ha ufficialmente aperto le iscrizioni alla fase Beta di The Crew 2.', 
NULL),
('Depaa', NULL, '2017-12-04 06:47:33', 'DUE SVILUPPATORI LASCIANO GUERRILLA', 
'Due sviluppatori che hanno contribuito alla realizzazione di Horizon: Zero Dawn.', 
NULL),
('Drakex94', NULL, '2017-12-05 16:11:58', 'Level-5 grande progetto per 20° anniversario', 
'Il noto sviluppatore Level-5 avrebbe alcuni grandi piani per festeggiare il loro 20°.', 
NULL),
('Depaa', 5, '2017-12-06 05:30:10', 'Doppio aggiornamento per Overwatch: Live e PTR', 
'Ieri sera sono state rilasciate due patch per Overwatch.', 
NULL),
('Depaa', NULL, '2017-12-07 23:18:11', 'Prenota Dragon Ball FighterZ', 
'Prenota Dragon Ball FighterZ su Amazon.it per ottenere interessanti bonus preorder.', 
NULL),
('Drakex94', NULL, '2017-12-10 19:30:10', 'Uscità presto il nuovo God of War', 
'Sony Interactive Entertainment ha pubblicato un video di God of War.', 
2),
('Depaa', NULL, '2018-01-15 15:05:08', 'I Nintendo Switch saranno gratuiti', 
'Si parlava di una partenza dell''abbonamento a pagamento nel 2018.', 
3), 
('Depaa', NULL, '2017-12-30 07:18:52', 'Auguri di buone feste dalla redazione', 
'Un altro anno giunge al termine, Buone feste!', 
NULL), 
('Drakex94', NULL, '2017-12-31 07:18:52', 'Gran Turismo Sport, server USA online', 
'Nel corso delle vacanze di Natale alcuni problemi.', 
2),
('Depaa', NULL, '2018-01-01 00:00:58', 'Switch: Nintendo ha rimosso NES Golf', 
'Come già saprete, diverso tempo fa era stata scoperta la presenza di un emulatore NES.', 
3),
('Drakex94', NULL, '2018-01-02 11:08:08', 'AMD Radeon Adrenalin Edition 17.12.2', 
'AMD ha pubblicato una nuova versione dei driver per le schede video dotate delle sue GPU.', 
NULL),
 ('admin', 3, '2018-01-05 07:15:58', 'Concorso Super Mario Odyssey', 
'Nintendo ha da poco svelato la fotografia vincitrice del concorso fotografico.', 
3),
('Depaa', 4, '2018-01-10 11:08:08', 'Wolfenstein II: Le avventure di Joe', 
'Disponibile dal 14 Dicembre il primo di una serie di tre DLC.', 
NULL);

/********************************************************************* RECENSIONE *********************************************************************/
DROP TABLE IF EXISTS `Recensione`;
CREATE TABLE IF NOT EXISTS `Recensione`
(
	`CodiceRecensione` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `CodiceGioco` INT(4) DEFAULT NULL,
	`AdminNick` VARCHAR(16) NOT NULL,
    `DataPubblicazione` DATETIME NOT NULL,
    `Titolo` VARCHAR(256) NOT NULL,
    `Contenuto` VARCHAR(4096) NOT NULL,
    `ValGrafica` TINYINT(2) DEFAULT NULL, 
    `ValStoria` TINYINT(2) DEFAULT NULL,
    `ValAudio` TINYINT(2) DEFAULT NULL,
    
    FOREIGN KEY `Articolo`(`AdminNick`) REFERENCES `Admin`(`Nickname`),
    FOREIGN KEY `Articolo1`(`CodiceGioco`) REFERENCES `Videogioco`(`CodiceGioco`),
    PRIMARY KEY (`CodiceRecensione`)    
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Recensione`(`AdminNick`, `CodiceGioco`, `DataPubblicazione`, `Titolo`, `Contenuto`, `ValGrafica` ,`ValStoria`, `ValAudio`)
VALUES
('Depaa', 1, '2017-11-21 19:35:10', 'Recensione di Assassin''s Creed: Origins', 
'Separare il suo nome dalle antipatie personali e dalla negatività.', 
9, 8, 7), 
('Maxutanu', 2, '2017-12-03 10:30:20', 'Recensione di Call of Duty: WWII', 
'Se dovessimo guardare solamente Call of Duty è una macchina inarrestabile.', 
6, 7, 7),
('Maxutanu', 3, '2017-12-03 18:40:50', 'Recensione di Super Mario Odyssey', 
'Per parlare di questo gioco non possiamo che partire da due concetti.', 
8, 10, 8),
('Drakex94', 4, '2017-12-05 08:08:08', 'Recensione di Wolfenstein II', 
'Caratterizzato da un''attenta alternanza tra fasi giocate e suggestive cutscene.', 
8, 9, 10),
('admin', 5, '2017-12-05 21:18:52', 'Recensione di Overwatch', 
'Sempre più abile nel gestire l''hype.', 
7, 7, 7),
('Depaa', 6, '2017-12-07 11:38:12', 'Recensione Breath of the Wild', 
'Questo ultimo episodio di The Legend of Zelda è il gioco più grande.',
8, 10, 9), 
('Maxutanu', 10, '2017-12-08 03:35:40', 'Recensione di Just Dance 2018, si balla', 
'Difficile Nuovo capitolo della serie Just Dance.', 
6, 5, 7),
('Depaa', 12, '2017-12-08 15:05:08', 'Recensione di Dark Souls III', 
'Ridendo e scherzando, nel panorama degli action RPG.', 
8, 8, 8),
('Depaa', 11, '2017-12-09 07:18:52', 'Recensione di WWE Smackdown! vs Raw 2009', 
'Come di consueto anche quest’anno titoli sportivi.', 
4, 3, 5), 
('Drakex94', 7, '2017-12-25 19:30:10', 'Recensione di Grepolis', 
'In questi anni gli sviluppatori si sono impegnati', 
7, 5, 3),
('Maxutanu', 8, '2018-01-03 15:05:56', 'Recensione di Call of Duty: Black Ops III', 
'Anche voi fate parte di quel partito che quando sente parlare di Call of Duty.', 
7, 6, 7),
('Depaa', 13, '2018-01-04 19:30:10', 'Recensione di Assetto Corsa', 
'Il pacchetto si basa sulla versione PC 1.0.', 
8, 5, 7), 
('Maxutanu', 9, '2018-01-06 19:30:10', 'Recensione FIFA 18', 
'La modalità che maggiormente ne ha beneficiato in FIFA 18 è Il Viaggio.', 
6, 7, 8);

/********************************************************************* COMMENTO *********************************************************************/
DROP TABLE IF EXISTS `Commento`;
CREATE TABLE IF NOT EXISTS `Commento`
(
	`CodiceCommento` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
	`UserNick` VARCHAR(16),
    `AdminNick` VARCHAR(16),
    `CodiceNotizia` INT(4),
    `CodiceRecensione` INT(4),
    `DataPubblicazione` DATETIME NOT NULL,
    `Contenuto` VARCHAR(256) NOT NULL,

	FOREIGN KEY `Commento`(`UserNick`) REFERENCES `User`(`Nickname`),
    FOREIGN KEY `Commento1`(`AdminNick`) REFERENCES `Admin`(`Nickname`),
    FOREIGN KEY `Commento2`(`CodiceNotizia`) REFERENCES `Notizia`(`CodiceNotizia`),
    FOREIGN KEY `Commento3`(`CodiceRecensione`) REFERENCES `Recensione`(`CodiceRecensione`),
    
    PRIMARY KEY(`CodiceCommento`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Commento`(`UserNick`, `AdminNick`, `CodiceNotizia`, `CodiceRecensione`, `DataPubblicazione`, `Contenuto`)
VALUES
('user', NULL, 4, NULL, '2017-12-02 23:30:10', 'user user user user user user'),
('user123', NULL, 1, NULL, '2017-12-02 23:35:10', 'user user user user user user'),
('user123', NULL, 5, NULL, '2017-12-02 23:33:10', 'user user user user user user'),
('user123', NULL, 4, NULL, '2017-12-02 23:32:10', 'user user user user user user'),
(NULL, 'Depaa', NULL, 1, '2017-12-03 19:35:50', 'ma quanto bello è questo gioco'),
('Gionny-Atlas', NULL, 1, NULL, '2017-12-04 23:35:50', 'ma quanto è bella'),
('Gionny-Atlas', NULL, 2, NULL, '2017-12-05 21:01:50', 'gioco fantastico'),
('Gionny-Atlas', NULL, 2, NULL, '2017-12-06 15:14:50', 'davvero fantastico che devo ripeterlo'),
('Nikocister', NULL, NULL, 5, '2017-12-07 15:08:14', 'interessante'), 
(NULL, 'Maxutanu', 5, NULL, '2017-12-07 23:59:12', 'vediamo che combinano'),
('Peachka', NULL, NULL, 4, '2017-12-08 07:25:24', 'è ok'),
('Nikocister', NULL, 3, NULL, '2017-12-08 18:02:13', 'oooook'),
('Peachka', NULL, 3, NULL, '2017-12-09 15:15:15',  'ho un bug che legge admin?'), 
('Nikocister', NULL, NULL, 7, '2017-12-10 22:22:23', 'vorrei laurearmi a dicembre, ma sto sempre ballando'),
('Nikocister', NULL, NULL, 7, '2018-12-15 17:20:23', 'ma quanto mi piace ballare questo gioco'), 
('Snordio', NULL, 7, NULL, '2017-12-25 20:01:10', 'finalmente'),
('Nikocister', NULL, NULL, 8, '2017-12-30 12:12:12', 'già finito da tempo'), 
('Aiolos', NULL, 9, NULL, '2017-12-31 20:12:37', 'non ho ancora deciso, ma ho intenzione di decidere'),
('Aiolos', NULL, NULL, 8, '2018-01-01 15:22:00', 'davvero un gioco emozionante'),
('Peachka', NULL, 9, NULL, '2018-01-02 23:08:08', 'non vedo l''ora'),
('Snordio', NULL, 6, NULL,  '2018-01-03 17:05:56', 'chissà cosa sarà mai'),
('Aiolos', NULL, NULL, 6, '2018-01-04 20:20:45', 'capisco perchè è il miglior gioco'), 
('Peachka', NULL, 2, NULL, '2018-01-05 09:15:23', 'il più bel gioco che io abbia giocato'),
(NULL, 'admin', 3, NULL, '2018-01-06 21:22:45', 'admin admin admin'),
('Peachka', NULL, 11, NULL, '2018-01-10 19:45:32', 'auguri anche a voi'),
('Peachka', NULL, NULL, 13, '2018-01-11 21:25:30', 'sempre bello lo sport');

/********************************************************************* VALUTAZIONE *********************************************************************/
DROP TABLE IF EXISTS `Valutazione`;
CREATE TABLE IF NOT EXISTS `Valutazione`
(
	`Voto` TINYINT(2) NOT NULL,
    `UserNick` VARCHAR(16) NOT NULL,
    `CodiceGioco` INT(4) NOT NULL,
	
    FOREIGN KEY `Valutazione`(`UserNick`) REFERENCES `User`(`Nickname`),
    FOREIGN KEY `Valutazione1`(`CodiceGioco`) REFERENCES `Videogioco`(`CodiceGioco`),
    PRIMARY KEY(`UserNick`, `CodiceGioco`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Valutazione`(`CodiceGioco`, `UserNick`, `Voto`)
VALUES
(1, 'Aiolos', 8),
(2, 'Aiolos', 3),
(10, 'Aiolos', 4),
(4, 'Aiolos', 9),
(6, 'Aiolos', 7),
(1, 'user', 9),
(5, 'user', 4),
(7, 'user', 3),
(9, 'user', 7),
(13, 'user', 8),
(2, 'Gionny-Atlas', 3),
(3, 'Gionny-Atlas', 7),
(8, 'Gionny-Atlas', 8),
(11, 'Gionny-Atlas', 1),
(10, 'Peachka', 6),
(12, 'Peachka', 6),
(1, 'Peachka', 8),
(7, 'Peachka', 2),
(1, 'Snordio', 8),
(3, 'Snordio', 7),
(4, 'Snordio', 9),
(8, 'Snordio', 6),
(10, 'Snordio', 5),
(11, 'Snordio', 4),
(1, 'Nikocister', 7),
(2, 'Nikocister', 4),
(10, 'Nikocister', 10),
(4, 'Nikocister', 6),
(6, 'Nikocister', 10),
(1, 'Mmasier', 8),
(5, 'Mmasier', 6),
(7, 'Mmasier', 5),
(9, 'Mmasier', 6),
(13, 'Mmasier', 5),
(2, 'Mmasier', 5),
(3, 'Mmasier', 8);

/********************************************************************* VIDEOGIOCO *********************************************************************/
DROP TABLE IF EXISTS `Videogioco`;
CREATE TABLE IF NOT EXISTS `Videogioco`
(
	`CodiceGioco` INT(4) NOT NULL,
    `Titolo` VARCHAR(128) NOT NULL,
    `Valutazione` DECIMAL(3, 2) DEFAULT NULL,
    `CodiceGenere1` INT(4) NOT NULL,
    `CodiceGenere2` INT(4) DEFAULT NULL,
    `CodiceGenere3` INT(4) DEFAULT NULL,
    `CodicePiattaforma` INT(4) NOT NULL,
    `DataUscita` DATE NOT NULL,
    `CasaEditrice` VARCHAR(32) NOT NULL,
    `PEGI` INT(2) NOT NULL,
    
    FOREIGN KEY `Videogioco`(`CodiceGenere1`) REFERENCES `Genere`(`CodiceGenere`),
    FOREIGN KEY `Videogioco1`(`CodiceGenere2`) REFERENCES `Genere`(`CodiceGenere`),
    FOREIGN KEY `Videogioco2`(`CodiceGenere3`) REFERENCES `Genere`(`CodiceGenere`),
    FOREIGN KEY `Videogioco3`(`CodicePiattaforma`) REFERENCES `Piattaforma`(`CodicePiattaforma`),
    PRIMARY KEY(`CodiceGioco`, `CodicePiattaforma`) /*perchè cambia per ogni piattaforma*/
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Videogioco`(`CodiceGioco`, `Titolo`, `DataUscita`, `Valutazione`, `CodicePiattaforma`, `CodiceGenere1`, `CodiceGenere2`, `CodiceGenere3`, `CasaEditrice`, `PEGI`)
VALUES
(1, 'Assassin''s Creed: Origins', '2017-10-27', 8.00, 1, 1, 2, NULL, 'Ubisoft', 18),
(1, 'Assassin''s Creed: Origins', '2017-10-27', 8.00, 2, 1, 2, NULL, 'Ubisoft', 18),
(1, 'Assassin''s Creed: Origins', '2017-10-27', 8.00, 7, 1, 2, NULL, 'Ubisoft', 18),
(2, 'Call of Duty: WWII', '2017-11-03', 3.75, 1, 8, 10, NULL, 'Activision', 18),
(2, 'Call of Duty: WWII', '2017-11-03', 3.75, 2, 8, 10, NULL, 'Activision', 18),
(2, 'Call of Duty: WWII', '2017-11-03', 3.75, 7, 8, 10, NULL, 'Activision', 18),
(3, 'Super Mario Odyssey', '2017-10-27', 7.33, 3, 11, NULL, NULL, 'Nintendo', 7),
(4, 'Wolfenstein II: The New Colossus', '2017-10-27', 8.00, 1, 8, 10, NULL, 'Bethesda Softworks', 18),
(4, 'Wolfenstein II: The New Colossus', '2017-10-27', 8.00, 2, 8, 10, NULL, 'Bethesda Softworks', 18),
(4, 'Wolfenstein II: The New Colossus', '2017-10-27', 8.00, 7, 8, 10, NULL, 'Bethesda Softworks', 18),
(5, 'Overwatch', '2016-05-24', 5.00, 1, 8, 10, NULL, 'Activision Blizzard', 12),
(5, 'Overwatch', '2016-05-24', 5.00, 2, 8, 10, NULL, 'Activision Blizzard', 12),
(5, 'Overwatch', '2016-05-24', 5.00, 7, 8, 10, NULL, 'Activision Blizzard', 12),
(6, 'The Legend of Zelda: Breath of the Wild', '2017-03-03', 8.50, 3, 1, 2, NULL, 'Nintendo', 12),
(7, 'Grepolis', '2010-08-08', 3.33, 8, 5, NULL, NULL, 'InnoGames', 16),
(7, 'Grepolis', '2010-08-08', 3.33, 9, 5, NULL, NULL, 'InnoGames', 16),
(7, 'Grepolis', '2010-08-08', 3.33, 7, 5, NULL, NULL, 'InnoGames', 16),
(8, 'Call of Duty: Black Ops III', '2015-11-06', 7.00, 1, 8, 10, NULL, 'Treyarch', 18),
(8, 'Call of Duty: Black Ops III', '2015-11-06', 7.00, 2, 8, 10, NULL, 'Treyarch', 18),
(8, 'Call of Duty: Black Ops III', '2015-11-06', 7.00, 4, 8, 10, NULL, 'Treyarch', 18),
(8, 'Call of Duty: Black Ops III', '2015-11-06', 7.00, 5, 8, 10, NULL, 'Treyarch', 18),
(8, 'Call of Duty: Black Ops III', '2015-11-06', 7.00, 7, 8, 10, NULL, 'Treyarch', 18),
(9, 'FIFA 18', '2017-09-29', 6.5, 1, 3, NULL, NULL, 'Electionic Arts', 3),
(9, 'FIFA 18', '2017-09-29', 6.5, 2, 3, NULL, NULL, 'Electionic Arts', 3),
(9, 'FIFA 18', '2017-09-29', 6.5, 3, 3, NULL, NULL, 'Electionic Arts', 3),
(9, 'FIFA 18', '2017-09-29', 6.5, 4, 3, NULL, NULL, 'Electionic Arts', 3),
(9, 'FIFA 18', '2017-09-29', 6.5, 5, 3, NULL, NULL, 'Electionic Arts', 3),
(9, 'FIFA 18', '2017-09-29', 6.5, 7, 3, NULL, NULL, 'Electionic Arts', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 1, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 2, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 3, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 4, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 5, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 7, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 8, 6, NULL, NULL, 'Ubisoft', 3),
(10, 'Just Dance 2018', '2017-10-24', 6.25, 9, 6, NULL, NULL, 'Ubisoft', 3),
(11, 'WWE Smackdown! vs Raw 2009', '2008-11-09', 2.50, 4, 3, 9, NULL, 'THQ', 16),
(11, 'WWE Smackdown! vs Raw 2009', '2008-11-09', 2.50, 5, 3, 9, NULL, 'THQ', 16),
(11, 'WWE Smackdown! vs Raw 2009', '2008-11-09', 2.50, 6, 3, 9, NULL, 'THQ', 16),
(12, 'Dark Souls III', '2016-03-24', 6.00, 1, 2, 7, NULL, 'Bandai Namco', 16),
(12, 'Dark Souls III', '2016-03-24', 6.00, 2, 2, 7, NULL, 'Bandai Namco', 16),
(12, 'Dark Souls III', '2016-03-24', 6.00, 7, 2, 7, NULL, 'Bandai Namco', 16),
(13, 'Assetto Corsa', '2014-12-19', 6.50, 1, 4, 3, NULL, 'Kunos Simulazioni', 3),
(13, 'Assetto Corsa', '2014-12-19', 6.50, 2, 4, 3, NULL, 'Kunos Simulazioni', 3),
(13, 'Assetto Corsa', '2014-12-19', 6.50, 7, 4, 3, NULL, 'Kunos Simulazioni', 3),
(14, 'Horizon Zero Dawn', '2017-02-28', NULL, 2, 1, 2, NULL, 'Guerrilla Games', 16),
(15, 'The Evil Within 2', '2017-10-19', NULL, 1, 1, 12, NULL, 'Bethesda Softworks', 18),
(15, 'The Evil Within 2', '2017-10-19', NULL, 2, 1, 12, NULL, 'Bethesda Softworks', 18),
(15, 'The Evil Within 2', '2017-10-19', NULL, 7, 1, 12, NULL, 'Bethesda Softworks', 18);

/********************************************************************* FUNZIONANO TUTTI *********************************************************************/

/********************************************************************* FUNZIONI *********************************************************************/
-- Restituisce un booleano per una ricerca su un gioco per un genere e per una piattaforma
DROP FUNCTION IF EXISTS `DisponibilitaGioco`; 
DELIMITER | 
CREATE FUNCTION `DisponibilitaGioco`(CodiceGenere INT(4), CodicePiatta INT(4)) RETURNS BOOL 
BEGIN 
DECLARE Esiste BOOL; 
DECLARE NumeroRighe INT; 
SELECT COUNT(*) 
INTO NumeroRighe 
FROM Videogioco 
WHERE Videogioco.CodicePiattaforma=CodicePiatta AND (CodiceGenere1=CodiceGenere OR CodiceGenere2=CodiceGenere OR CodiceGenere3=CodiceGenere) 
GROUP BY Videogioco.CodiceGioco;
IF NumeroRighe=0 THEN SET Esiste=0; 
ELSE SET Esiste=1; 
END IF; 
RETURN Esiste; 
END|
DELIMITER ;

-- Restituisce il numero totale di commenti di un user
DROP FUNCTION IF EXISTS `CommentiUser`; 
DELIMITER | 
CREATE FUNCTION `CommentiUser`(Username VARCHAR(16)) RETURNS INT(4) 
BEGIN 
DECLARE TotaleCommenti INT; 
SELECT COUNT(*) 
INTO TotaleCommenti 
FROM Commento 
WHERE Commento.UserNick=Username 
GROUP BY UserNick;
RETURN TotaleCommenti; 
END|
DELIMITER ;

/********************************************************************* TRIGGER *********************************************************************/
-- elimina i commenti di un utente dopo che questo è stato cancellato
DROP TRIGGER IF EXISTS `EliminaCommentiUser`; 
DELIMITER |
CREATE TRIGGER  `EliminaCommentiUser` BEFORE DELETE ON `User`
FOR EACH ROW 
BEGIN 
DELETE FROM Commento 
WHERE Commento.UserNick=OLD.Nickname; 
END|
DELIMITER ;

-- controlla se il nuovo voto inserito è corretto, sennò rimanda un messaggio di errore
DROP TRIGGER IF EXISTS ControllaVotoInserito; 
DELIMITER |
CREATE TRIGGER  ControllaVotoInserito BEFORE INSERT ON Valutazione 
FOR EACH ROW 
BEGIN 
IF (NEW.Voto>10 OR NEW.Voto<1) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Voto deve essere compreso tra 1 e 10"; 
END IF; 
END| 
DELIMITER ;

-- Aggiorna la valutazione del videogioco dopo che è stata inserita una nuova valutazione
DROP TRIGGER IF EXISTS AggiornamentoVoto; 
DELIMITER |
CREATE TRIGGER  AggiornamentoVoto AFTER INSERT ON Valutazione 
FOR EACH ROW 
BEGIN 
UPDATE Videogioco, Valutazione 
SET Valutazione = 
(SELECT AVG(Valutazione.Voto) FROM Valutazione WHERE Videogioco.CodiceGioco=Valutazione.CodiceGioco) 
WHERE Videogioco.CodiceGioco=Valutazione.CodiceGioco; 
END| 
DELIMITER ;

/********************************************************************* QUERY *********************************************************************/
-- Query che restituisce tutte i Videogiochi per i quali non è ancora stata pubblicata una Recensione.
SELECT DISTINCT V.CodiceGioco, V.Titolo 
FROM Videogioco V 
WHERE V.Titolo NOT IN (
SELECT DISTINCT Videogioco.Titolo 
FROM Videogioco JOIN Recensione ON Recensione.CodiceGioco=Videogioco.CodiceGioco); 
                                

-- Query che restituisce gli utenti che hanno fatto più commenti
SELECT UserNick, TotaleCommenti 
FROM (
SELECT UserNick, COUNT(*) TotaleCommenti /*seleziono tutti i commenti con il numero*/
FROM Commento 
WHERE UserNick IS NOT NULL 
GROUP BY UserNick ) AS ACommento 
WHERE TotaleCommenti = ( 
SELECT MAX(TotaleCommenti) 
FROM ( 
SELECT UserNick, COUNT(*) TotaleCommenti /*seleziono tutti i commenti con il numero più alto*/
FROM Commento 
WHERE UserNick IS NOT NULL 
GROUP BY UserNick ) AS BCommento 
);

-- Query che restituisce il titolo dei giochi che sono esclusiva di una particolare piattaforma
SELECT DISTINCT Titolo, Piattaforma.Nome AS Esclusiva 
FROM Videogioco JOIN Piattaforma ON Videogioco.CodicePiattaforma=Piattaforma.CodicePiattaforma 
WHERE Videogioco.Titolo NOT IN ( 
SELECT DISTINCT A1.Titolo 
FROM Videogioco A1, Videogioco A2 
WHERE A1.Titolo=A2.Titolo AND A1.CodicePiattaforma!=A2.CodicePiattaforma );


-- Query che restituisce il titolo dei giochi che sono stati pubblicati dalla stessa casa editrice
SELECT DISTINCT V1.Titolo, V1.CasaEditrice 
FROM Videogioco V1, Videogioco V2 
WHERE V1.CasaEditrice=V2.CasaEditrice AND V1.Titolo!=V2.Titolo 
ORDER BY V1.CasaEditrice; 

-- Query che restituisce la classifica dei 5 giochi del 2017, valutati dall'utente, con la valutazione più alta
SELECT DISTINCT Titolo, Valutazione 
FROM Videogioco 
WHERE YEAR(DataUscita)=2017 AND Valutazione IS NOT NULL 
ORDER BY Valutazione DESC 
LIMIT 5; 

-- Query che restituisce la classifica delle prime recensioni con la media dei tre voti dell'admin più alta
SELECT DISTINCT V.Titolo, (ValGrafica+ValStoria+ValAudio)/3 AS MediaValutazione 
FROM Recensione AS R JOIN Videogioco AS V ON R.CodiceGioco=V.CodiceGioco 
ORDER BY MediaValutazione DESC 
LIMIT 5;

-- Query che restituisce le Notizie del 2018 fatte da un Admin su una particolare piattaforma
SELECT N.AdminNick, N.DataPubblicazione, P.Nome NomePiattaforma, N.Titolo 
FROM Notizia AS N JOIN Piattaforma AS P ON N.CodicePiattaforma=P.CodicePiattaforma 
WHERE YEAR(DataPubblicazione)=2018 
ORDER BY DataPubblicazione DESC;

-- VIEW che corrisponde alla tabella di admin che hanno pubblicato solamente recensioni
DROP VIEW IF EXISTS AdminRecensione;
CREATE VIEW AdminRecensione AS 
SELECT R.AdminNick, R.CodiceRecensione, R.Titolo 
FROM Recensione R 
WHERE R.AdminNick NOT IN ( SELECT AdminNick FROM Notizia) 
ORDER BY AdminNick, CodiceRecensione; 

-- Query che visualizza i commenti nelle recensioni che fanno parte della VIEW AdminRecensione
SELECT V.Titolo, C.UserNick, C.Contenuto 
FROM AdminRecensione AS V JOIN Commento AS C 
WHERE V.CodiceRecensione=C.CodiceRecensione; 


/*
-- fatto titoli&testi troppo lunghi, lasciati come commento, non credo siano aggiornati con il database

DROP TABLE IF EXISTS `Recensione`;
CREATE TABLE IF NOT EXISTS `Recensione`
(
	`CodiceRecensione` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `CodiceGioco` INT(4) DEFAULT NULL,
	`AdminNick` VARCHAR(16) NOT NULL,
    `DataPubblicazione` DATETIME NOT NULL,
    `Titolo` VARCHAR(256) NOT NULL,
    `Contenuto` VARCHAR(4096) NOT NULL,
    `ValutazioneGrafica` TINYINT(2) DEFAULT NULL, 
    `ValutazioneStoria` TINYINT(2) DEFAULT NULL, 
    `ValutazioneAudio` TINYINT(2) DEFAULT NULL,
    
    FOREIGN KEY `Articolo`(`AdminNick`) REFERENCES `Admin`(`Nickname`),
    FOREIGN KEY `Articolo1`(`CodiceGioco`) REFERENCES `Videogioco`(`CodiceGioco`),
    PRIMARY KEY (`CodiceRecensione`)    
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Recensione`(`AdminNick`, `CodiceGioco`, `DataPubblicazione`, `Titolo`, `Contenuto`, `ValutazioneGrafica` ,`ValutazioneStoria`, `ValutazioneAudio`)
VALUES
('Depaa', 1, '2017-11-21 19:35:10', 'La Recensione di Assassin''s Creed: Origins, mummia o faraone?', 
'Separare il suo nome dalle antipatie personali e dalla negatività che fin troppo spesso lo circonda potrebbe essere una necessità perché molti giocatori ne comprendano il reale valore, eppure la serie Assassin''s Creed possiede ancora oggi una rilevanza a cui buona parte delle altre saghe possono solo aspirare, nata da un brillante misto di accessibilità e fascino storico. 
Stiamo pur sempre parlando dei giochi che hanno introdotto nel genere action adventure la straordinaria meccanica del free running, e la definiamo "straordinaria" perché per un game designer concettualizzare e applicare un sistema in grado di rendere il movimento verticale alla portata di tutti è qualcosa di equiparabile a una visione mistica. 
Proprio dalla solidità di quella base deriva però il malcontento attuale di molti dei fan del marchio: gli Assassin''s Creed hanno raggiunto notevoli vette con la trilogia di Ezio, per ridimensionarsi non appena l''obiettivo è stato posto più in alto. 
Dopo il terzo capitolo principale la narrativa si è persa in larga parte per strada, ampliando sì l''interessante background di partenza ma al contempo mettendo in secondo piano la trama principale con capitoli che sono parsi più dei contentini che reali seguiti; Unity, poi, non è riuscito a rappresentare quell''evoluzione di cui la saga aveva bisogno, a causa di numerose problematiche strutturali e di idee implementate solo a metà. 
La scelta di Ubisoft di cambiare strada rispetto agli ultimi due capitoli, dunque, è quanto mai giustificata: Assassin''s Creed Origins è un open world enorme, affidato ai director dell''ottimo Black Flag e pensato per offrire un ancor più riuscito misto di esplorazione, combattimento e libertà d''azione del solito, il tutto all''interno di una suggestiva ambientazione egiziana nell''era di Cesare e Cleopatra. 
Oggi, forti di una sessione di prova di qualche giorno a Parigi, cercheremo di capire con voi se l''origine degli assassini rappresenta davvero un nuovo inizio per questa iconica serie.', 
9, 8, 7), 
('Maxutanu', 2, '2017-12-03 10:30:20', 'La Recensione di Call of Duty: WWII, piedi in terra', 
'Se dovessimo guardare solamente i dati di vendita potremmo tranquillamente paragonare Call of Duty a una macchina inarrestabile, una di quelle vetture talmente perfette da tagliare sempre per prime il traguardo, nonostante intoppi e incidenti di percorso. 
Nell''anno di maggior flessione per il brand, con un capitolo non particolarmente amato dal pubblico e con un trailer di lancio che fece registrare ai tempi il record assoluto di dislike su Youtube, Call of Duty è riuscito comunque a imporsi sul mercato, perdendo forse terreno nei confronti di Battlefield 1 ma restando saldamente ancorato sul trono. 
Già tre anni fa però i vertici Activision avevano ben chiaro che il pubblico si stava disaffezionando al brand, annoiato più che dal gameplay, da un setting futuristico che ormai aveva ben poco altro da dire e da offrire. 
Le Exo tute avevano portato i ritmi e i movimenti a un livello esagerato e i giocatori rimbalzavano come palline da flipper impazzite nelle piccole mappe del multiplayer, rendendo le partite difficili da leggere ed estremamente caotiche. A Sledgehammer è quindi stato proposto di ripartire da zero, di ritornare a un tipo di gameplay ragionato che affondasse le radici in un sistema forse più lineare ma al contempo più tecnico, meno basato sui riflessi. 
La soluzione scelta per affacciarsi a questo radicale cambiamento è stata quella di far un passo indietro e tornare in quella seconda guerra mondiale che mancava dalla scena da ormai troppo tempo. Quest''anno, tra le altre cose, della campagna di Call of Duty e dei suoi contenuti extra se ne è parlato davvero pochissimo, lasciando che fosse il multiplayer ad assorbire tutte le attenzioni durante gli eventi e le beta pubbliche. 
Qualche settimana fa siamo però volati a Londra per affondare i denti sul pacchetto completo e oggi torniamo da voi con il verdetto finale per la produzione. La fiducia riposta in Sledgehammer sarà stata ripagata?', 
6, 7, 7),
('Maxutanu', 3, '2017-12-03 18:40:50', 'La Recensione di Super Mario Odyssey', 
'Per parlare di questo gioco non possiamo che partire da due concetti, il primo dei quali è di facile comprensione. 
Nonostante sia stato spesso definito - e anche pubblicizzato - come tale, Super Mario Odyssey, almeno in senso stretto, non è il seguito di Super Mario 64. 
Il secondo concetto è leggermente più complicato, e antico quasi quanto l''opera citata nel titolo del gioco: EPD Tokyo ha peccato, se così si può dire, di hybris. 
È stata superba nella concezione di Super Mario Odyssey, e tracotante nella sua realizzazione. Perché questo nuovo platform tridimensionale, diretto da Kenta Motokura e prodotto da Hayashida e Koizumi, non si limita a voler rinverdire le meccaniche di Super Mario 64: prende il punto forte di ogni predecessore e lo sfida a duello, il tutto mentre tenta di armonizzare e fondere assieme queste dinamiche tra loro molto diverse. 
Si ispira all''esplorazione del capostipite su Nintendo 64, ripropone le missioni tematiche di Super Mario Sunshine, eredita la varietà e gli scherzi gravitazionali di Super Mario Galaxy, e perfino dall''ultimo Super Mario 3D World, teoricamente così diverso, riprende ritmo e abbondanza di contenuti.
Non bastasse, in quanto a trasformazioni e power-up, fa quello che ogni fan di Kirby vorrebbe da una sua iterazione tridimensionale, ispirandosi anche - in questo campo - ai lavori Rareware di inizio secolo, in particolare a Conker''s Bad Fur Day. 
Insomma, per dirla alla Tolkien, "un platform per domarli, un platform per trovarli, un platform per ghermirli e nell''oscurità incatenarli".', 
8, 10, 8),
('Drakex94', 4, '2017-12-05 08:08:08', 'La Recensione di Wolfenstein II: The New Colossus, ritorna B.J.', 
'Strutturalmente il compito svolto da Jens Matthies e dai suoi collaboratori è in verità piuttosto semplice, caratterizzato com''è da un''attenta alternanza tra fasi giocate e suggestive cutscene, alcune delle quali completamente fuori di testa, finanche tarantiniane nell''uso del "gore", ma in tutti i casi scritte dannatamente bene e dirette in modo eccellente. 
Il risultato finale è molto convincente, un The New Order sotto steroidi, ancora più folle e spietato, frenetico e spettacolare, arricchito sotto vari aspetti per consegnarci anche un contorno / endgame sostanzioso, nonché la possibilità di rigiocare il tutto almeno una volta per dar seguito alla dolorosa scelta fatta nel primo episodio: sacrificheremo Fergus o Wyatt? 
Ognuno dei due percorsi produrrà cutscene e missioni secondarie differenti, mettendoci peraltro a disposizione un''arma extra che utilizza fasci di luce o sfere di fuoco.', 
8, 9, 10),
('admin', 5, '2017-12-05 21:18:52', 'La Recensione di Overwatch', 
'Sempre più abile nel gestire l''hype, Blizzard ha trasformato quella che poteva essere vista come un''operazione di riciclaggio in uno dei titoli più celebrati del momento. 
Un titolo che segna il debutto della compagnia californiana nel mondo dell''azione in prima persona con uno shooter a squadre che punta alla massima fruibilità senza rinunciare al lato competitivo. 
Di fronte a questa partenza stupisce la mancanza al lancio delle partite classificate, ma queste arriveranno presto a completare un''offerta che nella beta ha attirato quasi dieci milioni di giocatori. 
Il resto è all''incirca quello che abbiamo già visto durante i precedenti test, a partire dalle meccaniche generali per arrivare ai contenuti, ed è abbastanza per darci modo di arrivare al tanto atteso verdetto.', 
7, 7, 7),
('Depaa', 6, '2017-12-07 11:38:12', 'La Recensione di The Legend of Zelda: Breath of the Wild', 
'Questo ultimo episodio di The Legend of Zelda è il gioco più grande e costoso della storia Nintendo: è stato sviluppato per cinque anni (dal 2012 al 2016) e ha richiesto, al culmine della lavorazione, l''impegno di circa trecento persone, alcune delle quali tra l''altro - come forse saprete - provenienti da Monolith Soft (Xenoblade X Chronicles). 
Per trovare un progetto altrettanto ambizioso da parte dell''azienda kyotese bisogna andare indietro nel tempo di quasi due decenni; alcuni di voi potrebbero citare Super Mario Galaxy ma, a parte il fatto che è stato scolpito alla sede di Tokyo (ma questo poco ci interessa), l''avventura interplanetaria dell''idraulico, per quanto sperimentale e straordinaria, ha rappresentato un''eccellenza fine a sé stessa.
Al contrario, Breath of the Wild si è fatto carico non solo del proprio destino, ma di quello di EPD tutta: gli enormi tempi richiesti dall''elaborazione di un nuovo engine, comprendente un avanzato motore fisico, saranno ripagati dalla condivisione di questi elementi con altri titoli sviluppati internamente. ', 
8, 10, 9), 
('Maxutanu', 10, '2017-12-08 03:35:40', 'La Recensione di Just Dance 2018, si balla', 
'Difficile trovare qualcosa che aderisca più fedelmente al principio di "more of the same" di un nuovo capitolo della serie Just Dance, come ha dimostrato anche la nuova edizione 2018 fin dalla presentazione all''E3: la regolarità con cui il rhythm game di Ubisoft si presenta sul mercato è praticamente la stessa dei titoli sportivi EA o 2K, ma mentre questi ultimi si trovano parzialmente giustificati dal progredire tecnologico delle simulazioni, nonché dalle novità portate dai cambiamenti ai vari campionati sportivi di anno in anno, per Just Dance si tratta sostanzialmente di rinfrescare un catalogo di canzoni e aggiungere qualche modalità. 
In effetti viene da domandarsi se tutto questo non sia un po'' anacronistico, considerando che il lancio del servizio su abbonamento Just Dance Unlimited dovrebbe aver reso ormai obsoleto il ricorso a nuovi capitoli da immettere sul mercato ogni anno, ma è evidente che questa serie continui ad essere estremamente proficua per Ubisoft, tanto da non mettere in discussione la sua distribuzione attraverso i canali classici del mercato anche con una struttura su abbonamento ormai ben consolidata.', 
6, 5, 7),
('Depaa', 12, '2017-12-08 15:05:08', 'La Recensione di Dark Souls III', 
'Ridendo e scherzando, direbbe un giocatore saggio, sono passati sette anni da quando From Software e quel geniaccio di Hidetaka Miyazaki hanno creato un nuovo sotto genere nel panorama degli action RPG; sette anni, quattro capitoli regolari e un po'' di espansioni a corredo, per un''eredità videoludica importante che ha visto aumentare in maniera esponenziale la base utenti affezionata, così come l''esigenza di dare a questo patrimonio di appassionati nuovi contenuti e idee. 
Ricordiamo con estrema chiarezza il nostro approccio brutale alla demo di Demon''s Souls, durante il Tokyo Game Show del 2008: ambientazione e armature suggestive, legnosità del protagonista principale, tante botte prese dagli avversari, per un rapporto morti/tempo giocato decisamente a sfavore di quest''ultimo.
Il divertimento e la spensieratezza vengono lasciati ad altri videogiochi e lo scorso anno Bloodborne, inoltre, ha insegnato che ci può essere ancora tanto di inedito da mostrare e raccontare all''interno di questo genere, rinnovando al contempo il comparto estetico.', 
8, 8, 8),
('Depaa', 11, '2017-12-09 07:18:52', 'La Recensione di WWE Smackdown! vs Raw 2009', 
'Come di consueto anche quest’anno gli scaffali dei negozi si sono riempiti di titoli sportivi che portano la data dell’anno venturo in copertina. La preoccupazione degli sviluppatori prima e degli utenti finali poi, sta nelle novità e nei cambiamenti che dovrebbero essere apportati di anno in anno per poter garantire sempre un prodotto fresco e in continuo miglioramento. 
Nonostante il wrestling non spossa essere definito un vero e proprio sport, fa parte anche lui di questa categoria di titoli che puntualmente un po‘ prima di Natale affollano le vetrine. 
Con WWE Smackdown Vs. RAW 2009 saranno riusciti gli storici programmatori di Yuke’s ad apportare sostanziali novità allo stile di gioco già collaudato nelle precedenti uscite? ', 
4, 3, 5), 
('Drakex94', 7, '2017-12-25 19:30:10', 'La Recensione di Grepolis, gioco per chi compra', 
'In questi anni gli sviluppatori si sono impegnati a limare ogni aspetto del gameplay, rendendolo accessibile per qualsiasi tipo di utente. 
Cominciare la nostra avventura in Grepolis è infatti molto semplice, grazie anche a un comodo tutorial che ci guiderà alla scoperta delle meccaniche di base. 
Fondare una città non è mai stato così facile e dopo qualche piccolo accorgimento burocratico potremo iniziare a costruire le prime strutture seguendo uno schema prestabilito che, almeno parzialmente, limiterà la nostra libertà di scelta. 
Segherie e cave non ci faranno mai mancare le due risorse fondamentali, ovvero legno e pietra, mentre potremo raccogliere un notevole gruzzolo di monete d’argento grazie a tasse e missioni secondarie. 
Gli edifici commerciali saranno il fulcro dell’economia interna, visto che ci permetteranno di scambiare merci e prodotti finiti con altri giocatori e popolazioni straniere. 
Ogni costruzione necessiterà inoltre di un’adeguata manutenzione e potrà essere migliorata, aumentando così la rendita e diminuendo i costi. 
Per fortuna i tempi di attesa sono generalmente sopportabili, tranne per i lavori più onerosi che potrebbero richiedere diverse ore.', 
7, 5, 3),
('Maxutanu', 8, '2018-01-03 15:05:56', 'La Recensione di Call of Duty: Black Ops III', 
'Anche se voi fate parte di quel partito che quando sente parlare di Call of Duty inizia (più o meno a ragione) ad urlare al "copia e incolla" e alla "minestra riscaldata", bisogna dare a Treyarch quel che è di Treyarch. 
Senza dubbio il team di Santa Monica è quello che in seno "al gruppo di lavoro" del franchise ha saputo rischiare di più, tanto in termini narrativi quanto di contenuti e meccaniche di gioco.
D''altronde è loro la paternità della modalità Zombies, così come la voglia di raccontare storie di ampio respiro, più complesse e stratificate rispetto al solito canovaccio sin troppo abusato dai tempi di Modern Warfare. 
Questa volta Treyarch ha deciso di stupirci davvero con gli effetti speciali, realizzando un gioco straripante di contenuti, ma che non riesce ad eguagliare le vette dei precedenti Black Ops.', 
7, 6, 7),
('Depaa', 13, '2018-01-04 19:30:10', 'La Recensione di Assetto Corsa', 
'Il pacchetto che verrà installato sulla vostra console si basa sulla versione PC 1.0, comprensiva dei DLC usciti fino ad oggi tranne il Japanese Pack e, purtroppo, il meraviglioso Red Pack. 
Assenze onestamente pesanti ma, ci assicurano gli sviluppatori, temporanee. Nel giro di qualche settimana verranno infatti rilasciati entrambi e questa sarà solo la prima fase del supporto post-lancio: l''intenzione di Kunos Simulazioni è seguire i progetti (PC e console) in parallelo, pubblicando per quanto possibile gli stessi update e contenuti aggiuntivi. 
A riprova di ciò è arrivata la conferma che il prossimo DLC in programma su PC, il Porsche Pack, arriverà anche su PS4 e Xbox One. Le prospettive in tal senso, quindi, ci sembrano rosee e nutrono ottimismo.
Analizzando il resto dei contenuti, ritroviamo tutto ciò che la platea PC ha già potuto apprezzare, a partire da quattordici circuiti riproposti in ventisei varianti reali. Si spazia dagli immancabili Spa, Silverstone e Monza ai “piccoli” di casa nostra come Magione, fino al ricercato Nurburgring Nordschleife Tourist. 
Denominatore comune di ciascun tracciato è la cura maniacale con il quale è stato riprodotto usufruendo dell’ormai collaudata tecnologia Laser Scan. Il risultato finale è ovviamente eccezionale e non poteva essere altrimenti se pensiamo che è frutto degli sforzi di un team che ha piazzato i suoi studi all''interno dell’Autodromo di Vallelunga.', 
8, 5, 7), 
('Maxutanu', 9, '2018-01-06 19:30:10', 'La Recensione FIFA 18', 
'La modalità che maggiormente ne ha beneficiato in FIFA 18 è Il Viaggio: Il ritorno di Hunter. 
Nel secondo capitolo dell''epopea calcistica di Alex Hunter potremo osservare tutta una serie di miglioramenti davvero notevoli, che elevano l''esperienza al rango di film interattivo. 
Grazie al Frostbite, infatti, non solo ogni filmato di gioco è incredibile nel suo realismo, con i volti delle diverse guest star che si alternano sullo schermo perfettamente riprodotti, ma anche tutto il confezionamento delle scene pre e post partita ha subito un netto balzo in avanti. 
Gli stadi sono riprodotti perfettamente e tutto è girato con un taglio registico che poco ha da invidiare alle produzioni di Sky o Mediaset.
Oltre al lato estetico, in FIFA 18 sono stati introdotti anche altri miglioramenti come la possibilità di modificare il look di Hunter o la possibilità di incidere su alcune piccole decisioni che il giovane dovrà prendere durante la nuova stagione calcistica. 
Decisamente più impattanti saranno la possibilità di giocare a una sorta di FIFA Street in miniatura (invero piuttosto divertente) o quella di giocare nei panni di altre persone oltre ad Alex. Non entriamo più nei dettagli per non rovinare la sorpresa.', 
6, 7, 8);
*/

/*
DROP TABLE IF EXISTS `Notizia`;
CREATE TABLE IF NOT EXISTS `Notizia`
(
	`CodiceNotizia` INT(4) NOT NULL UNIQUE AUTO_INCREMENT,
    `CodiceGioco` INT(4) DEFAULT NULL,
	`AdminNick` VARCHAR(16) NOT NULL,
    `DataPubblicazione` DATETIME NOT NULL,
    `Titolo` VARCHAR(256) NOT NULL,
    `Contenuto` VARCHAR(4096) NOT NULL,
    `CodicePiattaforma` INT(4) DEFAULT NULL,
    
    FOREIGN KEY `Notizia`(`AdminNick`) REFERENCES `Admin`(`Nickname`),
    FOREIGN KEY `Notizia1`(`CodicePiattaforma`) REFERENCES `CodicePiattaforma`(`Piattaforma`),
    FOREIGN KEY `Notizia2`(`CodiceGioco`) REFERENCES `Videogioco`(`CodiceGioco`),
    PRIMARY KEY (`CodiceNotizia`)    
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `Notizia`(`AdminNick`, `CodiceGioco`, `DataPubblicazione`, `Titolo`, `Contenuto`, `CodicePiattaforma`)
VALUES
('Maxutanu', NULL, '2017-11-21 19:30:10', 'Presentata Xbox One X', 
'Xbox One X è, anzitutto, un piccolo miracolo di ingegneria e progettazione. La console se ne esce dalla scatola pronta a stupire l''utente grazie alle dimensioni estremamente contenute, addirittura più ridotte della candida "sorellina minore". Il form factor è simile a quello di Xbox One S: essenziale, pulito, squadrato, ma decisamente più elegante rispetto a quello della versione "fat". Il blocco centrale della macchina ne sovrasta uno più piccolo, mettendo in risalto il vano del disco.
Spariscono le forature della parte superiore, anche per via di una revisione integrale del sistema di raffreddamento (che adesso sfrutta la dissipazione a camera di vapore).
Le superfici nere, leggermente satinate, sono piacevolissime alla vista, e la compattezza dell''assemblaggio rende la macchina un piccolo gioiello da esporre fieramente in salotto.
Che Microsoft sia riuscita ad infilare il suo "mostro di potenza" in uno chassis così piccolo, insomma, è un risultato più che ammirevole, frutto di un processo di ingegnerizzazione veramente incredibile. Qui non si tratta, badate bene, solo di una marcata attenzione per l''ottimizzazione degli spazi e la "miniaturizzazione", bensì di uno studio meticoloso del posizionamento di ogni componente, attento ad ogni aspetto: potenza, gestione termica, riduzione del rumore, stile.
Xbox One X, insomma, si presenta fin da subito come un prodotto premium, ideato per quei giocatori che non vogliono scendere a compromessi su nessun fronte: neppure sul quello estetico e progettuale.',
1),
('Drakex94', 6, '2017-11-29 15:05:08', 'THE LEGEND OF ZELDA BREATH OF THE WILD PREMIATO COME GIOCO DELL''ANNO', 
'Nuovo importante riconoscimento per The Legend of Zelda Breath of the Wild: questa volta è GameSpot USA a premiare l''ultima avventura di Link con il prestigioso premio di Game of the Year, riservato al miglior gioco dell''anno.
Per la redazione di GameSpot USA, Breath of the Wild è il miglior gioco degli ultimi dodici mesi, nonchè uno dei migliori titoli di sempre, grazie a un gameplay di assoluto livello, a una narrazione ineccepibile e ad una direzione artistica di alto profilo.
The Legend of Zelda Breath of the Wild è il videogioco più premiato del 2017, nonchè il titolo con la media più alta dell''anno su Metacritic, a testimonianza dell''ottima accoglienza ricevuta da parte della stampa specializzata. 
Il gioco è stato eletto Game of the Year ai The Game Awards dell''8 dicembre scorso, riconoscimento importante, inoltre anche Polygon ha inserito Zelda Breath of the Wild nella Top 50 dell''anno che sta pr terminare.
Un grande successo per Nintendo e per Eiji Aonuma, il producer della serie ha affermato recentemente che i lavori sul prossimo gioco di Zelda, sono già iniziati, sebbene sia ancora troppo presto per iniziare a parlarne. 
Non ci resta dunque che attendere di saperne di più sul nuovo capitolo della saga.', 
NULL),
('admin', NULL, '2017-12-02 12:30:10', 'admin admin admin admin admin', 
'admin admin admin admin admin admin', 
NULL),
('Depaa', NULL, '2017-12-03 12:00:10', 'THE CREW 2: SONO ORA APERTE LE ISCRIZIONI ALLA FASE BETA', 
'Nelle scorse ore Ubisoft ha ufficialmente aperto le iscrizioni alla fase Beta di The Crew 2 su PlayStation 4, Xbox One e PC.
Per la registrazione è sufficiente recarsi a questo indirizzo, creare un account Ubisoft (o semplicemente effettuare il log in con quello già in vostro possesso), scegliere la piattaforma preferita e premere sul pulsante di conferma. 
I giocatori selezionati riceveranno una mail pochi giorni prima dell''inizio con tutte le informazioni necessarie per ottenere l''accesso.
Purtroppo, Ubisoft non ha ancora annunciato la data d''inizio della fase di testing, né tantomeno quella dell''uscita del gioco. The Crew 2, inizialmente previsto per il 16 marzo 2018, è stato infatti rinviato dalla casa francese a data da destinarsi. 
Il team di sviluppo sfrutterà i prossimi mesi per effettuare sessioni di testing aggiuntive e raccogliere il feedback dei giocatori. Il titolo si è mostrato l''ultima volta nel mese di agosto, in occasione della Gamescom di Colonia.', 
NULL),
('Depaa', NULL, '2017-12-04 06:47:33', 'DUE SVILUPPATORI DI HORIZON: ZERO DAWN LASCIANO GUERRILLA E SI UNISCONO AL TEAM DI MAFIA 3', 
'Due sviluppatori che hanno contribuito alla realizzazione di Horizon: Zero Dawn hanno deciso di lasciare Guerrilla Games per unirsi ad Hangar 13, team di sviluppo autore di Mafia 3.
La conferma ufficiale giunge direttamente da David Ford, che lavorerà in Hangar 13 come Design Director andando a dare manforte al lavoro di Mark Norris, anch''egli congedatosi da Guerrilla da poco tempo. Mafia 3, da molti lodato per il comparto narrativo, è invece stato criticato per altri aspetti riguardanti il gameplay: chissà che con il contributo di questi due nuovi rinforzi la software house non riuscirà a creare un prodotto completo e soddisfacente da tutti i punti di vista con il suo prossimo progetto.
Proprio nei riguardi del nuovo gioco di Hangar 13 sono stati avvistati online alcuni annunci di lavoro che suggerirebbero l''arrivo di un nuovo titolo open world.
"In questo ruolo avrai l''opportunità di creare concept, innovare ed implementare alcuni dei nemici più innovativi per un incredibile gioco open world", si legge nell''annuncio dedicato alla ricerca di un Senior Combat Designer. 
Fra i requisiti dell''incaricato si menziona l''abilità di "creare, implementare e bilanciare ogni elemento dei nemici in un gioco open world tripla A".', 
NULL),
('Maxutanu', NULL, '2017-12-05 16:11:58', 'Level-5 sta lavorando a un grande progetto per il suo 20° anniversario', 
'Il noto sviluppatore Level-5 avrebbe alcuni grandi piani per festeggiare il loro 20° anniversario. Secondo quanto rivelato da Akihiro Hino, CEO di Level-5, la compagnia starebbe lavorando a un "titolo molto importante" come parte della celebrazione. 
Nessun dettaglio sul gioco è ancora emerso online, ma vale la pena sottolineare che le parole di Hino sono apparse nel corso di un''intervista con Dengeki PlayStation, cosa questa che presuppone un progetto destinato alle console Sony (PS4 in testa). 
Vi terremo aggiornati. Ricordiamo che tutte le notizie e le novità circa i titoli in lavorazione presso Level-5 li trovate come di consueto nella nostra scheda dedicata. Che ne pensate? Ditecelo nei commenti in calce alla notizia.', 
NULL),
('Maxutanu', 5, '2017-12-06 05:30:10', 'Doppio aggiornamento per Overwatch: Live e PTR', 
'Ieri sera sono state rilasciate due patch per Overwatch, la prima per il gioco live che corregge alcuni errori e modifica il matchmaking della modalità competitiva in modo che la differenza tra i giocatori della stessa partita sia diminuita.
La seconda patch invece è per il PTR e introduce le correzioni per Doomfist annunciate ieri insieme ad altri bugfix per Mercy, Moira, Sombra e Widowmaker.', 
NULL),
('Depaa', NULL, '2017-12-07 23:18:11', 'Prenota Dragon Ball FighterZ', 
'Prenota Dragon Ball FighterZ su Amazon.it per ottenere interessanti bonus preorder: l''accesso anticipato alla Open Beta, lo sblocco anticipato di Goku e Vegeta Super Saiyan Blue e due avatar esclusivi.
La promozione è valida fino al 26 gennaio 2018 (data di uscita del gioco) effettuando il preordine direttamente da Amazon.it:
Prenota Dragon Ball FighterZ per PS4 ()
Prenota Dragon Ball FighterZ per Xbox One ()
Prenotando il gioco avrete inoltre la certezza di riceverlo a casa il giorno del lancio. Dragon Ball FighterZ sarà disponibile in Italia su PlayStation 4, Xbox One e PC (via Steam) dal 25 gennaio 2018 e dal giorno successivo in formato digitale anche su PlayStation Store e Xbox Store.
La Open Beta di Dragon Ball FighterZ inizierà alle 09:00 del 14 gennaio e terminerà alla stessa ora del 16 gennaio, effettuando il preorder presso un qualsiasi rivenditore sarà possibile invece iniziare a giocare dalel 08:59 del 13 gennaio, godendo quindi di 24 ore di accesso anticipato alla fase di prova.
Ricordiamo che recentemente Bandai Namco ha annunciato l''arrivo di tre nuovi personaggi nel roster di Dragon Ball FighterZ, ovvero Beerus, Hit e Goku Black, trio di eroi provenienti dall''universo di Dragon Ball Super e dai film di Dragon Ball Z.', 
NULL),
('Drakex94', NULL, '2017-12-10 19:30:10', 'Uscità presto il nuovo God of War', 
'Sony Interactive Entertainment ha pubblicato un video di God of War dedicato ad Atreus, il figlio di Kratos, svelando nuovi dettagli e retroscena sulla storia del personaggio. 
Il filmato, della durata di circa 10 minuti, è visionabile in cima alla notizia.
In assenza del padre, Atreus ha continuato a vivere insieme alla madre mentre affinava le proprie abilità con l''arco, preparandosi così a diventare quel piccolo guerriero che avremo modo di conoscere durante la nuova avventura di Kratos. 
Tra le altre cose, apprendiamo che Atreus sarà in grado di ascoltare le voci degli animali nella propria testa, caratteristica che con ogni probabilità troverà diverse applicazioni interessanti anche a livello di gameplay.
Nell''attesa che il nuovo God of War venga pubblicato in esclusiva su PlayStation 4 nel corso del 2018, vi riproponiamo gli ultimi screenshot del gioco mostrati nella giornata di ieri. 
Per tutte le altre novità vi rimandiamo alla nostra rubrica con le notizie più importanti della settimana.', 
2),
('Depaa', NULL, '2018-12-15 15:05:08', 'I servizi online di Nintendo Switch saranno gratuiti fino all''autunno 2018', 
'Si parlava di una partenza dell''abbonamento a pagamento nel 2018, ma sul sito di Nintendo Switch è comparsa un''indicazione che dà i servizi online della console come gratuiti fino all''autunno del prossimo anno.
Sembra insomma che la casa giapponese abbia qualche dubbio o qualche difficoltà circa questo aspetto della propria offerta, i cui prezzi peraltro sono noti da tempo.
È possibile che l''azienda non voglia porre freni all''attuale andamento delle vendite, considerando la gratuità dell''online come un punto di forza di Nintendo Switch, oppure che ci sia ancora incertezza su cosa includere esattamente nell''abbonamento.', 
3), 
('Depaa', NULL, '2017-12-30 07:18:52', 'Auguri di buone feste dalla redazione di GamesGuide', 
'Un altro anno giunge al termine, e noi della redazione di Multiplayer.it vogliamo augurarvi buone feste e qualche giorno di sano relax (magari in compagnia dei vostri videogiochi preferiti) in attesa di un promettente 2018. 
A prescindere da come passerete i prossimi giorni, vi ringraziamo per averci seguito nel corso dell''anno, interagendo con noi attraverso commenti e feedback e aiutandoci a offrirvi contenuti sempre più ricchi e diversificati. 
All''orizzonte ci sono tante nuove idee, rubriche, approfondimenti e contenuti che speriamo apprezzerete. Nel frattempo...Buone feste!', 
NULL), 
('Drakex94', NULL, '2017-12-31 07:18:52', 'Gran Turismo Sport, i server USA tornano online', 
'Nel corso delle vacanze di Natale alcuni problemi ai server hanno precluso dal gioco online tutti i possessori statunitensi del racing game di Sony, Gran Turismo Sport, da poche settimane nei negozi. 
Un lungo periodo di inattività dei server ha infatti colpito gli utenti, aggravato dal fatto che la maggior parte delle funzionalità del gioco si basa proprio su modalità disponibili online. 
Poche ore fa, secondo il produttore Kazunori Yamauchi, il team del PlayStation Network in Nord America ha deciso di mettere una pezza al problema e, fortunatamente, i server sono ora tornati online regolarmente. 
Voi ci state giocando? Ditecelo nei commenti!', 
2),
('Maxutanu', NULL, '2018-01-01 00:00:58', 'Switch: Nintendo ha rimosso NES Golf dal firmware della console', 
'Come già saprete, diverso tempo fa era stata scoperta la presenza di un emulatore NES ed il titolo Golf all''interno del firmware di Switch. 
A quanto pare, tuttavia, Nintendo ha deciso di eliminare il gioco "segreto" con uno degli ultimi aggiornamenti del software di sistema. 
Infatti, la recente versione 4.0.0, pubblicata qualche settimana fa, ha completamente rimosso tutto il codice eseguibile del gioco, rimpiazzandolo con dati casuali, stando a Switchbrew.org. 
Al momento non si conosce ancora il motivo per il quale il titolo era presente all''interno della console (anche se molti lo considerano un tributo a Satoru Iwata, precedente presidente di Nintendo). 
La sua rimozione lascia pensare che si potesse trattare solo di codice di prova lasciato erroneamente dai progettisti del sistema.', 
3),
('Maxutanu', NULL, '2018-01-02 11:08:08', 'AMD Radeon Adrenalin Edition 17.12.2 ora disponibili', 
'AMD ha pubblicato una nuova versione dei driver per le schede video dotate delle sue GPU. 
AMD Radeon Adrenalin Edition 17.12.2 risolvono alcuni problemi riscontrati dagli utenti con alcuni giochi ed applicazioni, in particolare modo ARK Survival Evolved, Star Wars Battlefront 2 e Netflix. 
Trovate il changelog completo al seguente indirizzo insieme ad una lista dei problemi noti che saranno risolti nelle future release del software. Potete scaricare il file seguendo questo link. 
Non ci resta che augurare ai nostri lettori buon download e buon aggiornamento. ', 
NULL),
 ('admin', 3, '2018-01-05 07:15:58', 'Concorso Super Mario Odyssey', 
'Nintendo ha da poco svelato la fotografia vincitrice del concorso fotografico dedicato a Super Mario Odyssey. 
Lo scatto raffigura Mario a testa in giù, mentre il suo compagno d''avventura Cappy lo raggiunge lasciando dietro di sé una suggestiva scia.', 
3),
('Depaa', 4, '2018-01-10 11:08:08', 'Wolfenstein II: Le avventure di Pistolero Joe', 
'Disponibile dal 14 Dicembre il primo di una serie di tre DLC, che ha come  protagonista l''ex giocatore di football professionista Joseph Stallion.', 
NULL);
*/
