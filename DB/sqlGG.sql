
DROP TABLE IF EXISTS `Account`;
create table IF NOT EXISTS `Account`
(
	`Nickname` varchar(16) not null unique,
    `Password` varchar(16) not null,
    `Nome` varchar(20) not null,
    `Cognome` varchar(20) not null,
    `DataNascita` date not null,
    `Email` varchar(32) not null unique,
    `Admin` tinyint(1) not null default '0',
    
    primary key(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Account` (`Nickname`, `Password`, `Nome`, `Cognome`, `DataNascita`, `Email`, `Admin`) values 
('admin', 'admin', 'admin', 'admin',  '1995-10-01', 'admin@admin.admin', 1),
('Peachka', 'ciaone', 'Lucia', 'Fenu', '1995-06-30', 'lucia.fenu95@gmail.com', 1),
('Aiolos', '123qwerty789', 'Gianmarco', 'Pettenuzzo', '1995-08-20', 'gian82095@gmail.com', 1),
('Gionny-Atlas', '0987654321', 'Francesco', 'Battistella', '1994-10-01', 'frabat@icloud.com', 1),
('Depaa', 'asdfghjkl', 'Matteo', 'Depascale', '1995-08-20', 'depascale.matteo@gmail.com', 1),
('user', 'user', 'user', 'user', '1995-01-01', 'user@user.user', 0),
('Nikocister','Sassari', 'Nicola', 'Cisternino', '1995-01-12', 'nicocister95@gmail.com', 0), 
('Mmasier', 'Chubby', 'Marco', 'Masiero',  '1996-09-09','marcmasi@icloud.com', 0),
('Snordio', 'Chioggia4ever','Stefano', 'Nordio', '1995-06-15', 'steno996@gmail.com', 0),
('Drakex94', 'helpme', 'Francesco', 'Sacchetto',  '1994-12-19', 'frasack94@gmail.com', 0),
('DarkWarrior', 'pecpecpec', 'Francesco', 'Pecile', '1996-12-09', 'frapec96@gmail.com', 0);

DROP TABLE IF EXISTS `Notizie`;
create table IF NOT EXISTS `Notizie`
(
	`DataPubblicazione` date not null,
	`Titolo` varchar(144) not null unique,
    `AdminNick` varchar(16) not null,
    `Testo` varchar(8192) not null,
    `XboxOne` tinyint(1),
    `Xbox360` tinyint(1),
    `NintendoDS` tinyint(1),
    `NintendoSwitch` tinyint(1),
    `Windows` tinyint(1),
    `Mac` tinyint(1),
    `Playstation3` tinyint(1),
    `Playstation4` tinyint(1),
		
    primary key(`Titolo`),
    foreign key `Notizie`(`AdminNick`) references `Account`(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Notizie` (`DataPubblicazione`, `AdminNick`, `Titolo`, `Testo`, `XboxOne`, `Xbox360`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Playstation3`, `Playstation4`)
values
('2017-11-30', 'Depaa','XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', 
'Nel corso di un'' intervista concessa a GamesGuide.com, Piers Harding-Rolls, Director of Research and Analysis Games presso IHS Markit, ha confermato che la compagnia di ricerche di mercato ha quasi raddoppiato le proprie previsioni di vendita di Xbox One X nel 2017.
"Il feedback sui pre-order per Xbox One X standard e la Project Scorpio Edition ci ha spinti a rivedere le nostre previsioni di vendita di Xbox One X nel 2017. La edizione limitata di Xbox One X si è rivelata una mossa vincente, riuscendo a veicolare una robusta quantità di macchine durante la settimana di lancio, nelle Regioni chiave. IHS Markit ha quindi incrementato le proprie previsioni da 500.000 a 900.000 unità".
Allo stesso modo, la compagnia crede che, al netto di questo possibile successo commerciale, non basterà Xbox One X per colmare il gap presente tra Microsoft e Sony, specialmente prendendo in considerazione lo andamento del mercato in Europa continentale.',
1, 0, 0, 0, 0, 0, 0, 0);

DROP TABLE IF EXISTS `Recensione`;
create table IF NOT EXISTS `Recensione` 
(
	`NomeGioco` varchar (144) not null unique,
	`AdminNick` varchar (16) not null unique,
	`Titolo` varchar (144) not null unique,
	`Testo` varchar (8192) not null,
	`Data` date not null,
	`Playstation3` tinyint (1),
	`Playstation4` tinyint (1),
	`Xbox360` tinyint (1),
	`XboxOne` tinyint (1),
	`NintendoDS` tinyint (1),
	`NintendoSwitch` tinyint (1),
	`Windows` tinyint (1),
	`Mac` tinyint (1),
	primary key (`Titolo`),
	foreign key `Recensione`(`AdminNick`) references `Account`(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Recensione`(`NomeGioco`, `AdminNick`, `Titolo`, `Testo`, `Data`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`,`Mac`)
values 
('Need For Speed: Payback', 'Aiolos', 'NEED FOR SPEED PAYBACK: LA VENDETTA E'' SERVITA', 'Si parte subito con il prologo in cui si provano alcuni mezzi e viene narrata la storia che apre la modalità carriera. Con grande sorpresa, il sistema di guida adottato è abbastanza realistico e l''aspetto visivo non è per niente male – il tutto è sostenuto dal frostbite, il famoso motore grafico di DICE. La modalità di guida somiglia a "Forza Horizon" di Playground Games, che fa del realismo il proprio cavallo di battaglia, con una grande differenza: il controllo del veicolo. Quest''ultimo forse risulta un po'' troppo eccessivo: è impensabile fare una curva a gomito, a 140, di freno a mano, con una Buick del ''64.
Tuttavia è un gioco con obiettivi completamente diversi (Qualcuno ha detto Fast & Furious?), quindi sotto questo punto di vista Need for Speed: Payback è giustificato. In modalità Carriera si trovano in mezzo alla strada degli archi azzurro/verdi,che danno il via ad alcune come Autovelox e Salto, dove si deve rispettivamente passare dal varco ad una velocità maggiore di quella indicata oppure  superare i metri richiesti con un salto. La Gara di velocità, dove quello che conta è la media tra il primo e l''ultimo varco – non la velocità istantanea raggiunta nei check point – costa qualche tentativo prima di capire come funzioni. 
Oltre le nuove modalità, forse un po'' macchinose, ci son le gare "classiche", disponibili nelle categorie corsa, fuoristrada, derapata, accelerazione e fuga (con relative auto di categoria) ed alla fine di ogni gara vengono consegnati dei crediti e delle Speed Card. Le gare hanno una struttura classica, ovvero si deve attraversare i vari checkpoint e concludere primi. Sembra facile detta così. L''intelligenza artificiale dei piloti contro cui si gareggia è talvolta un po'' troppo competitiva: non mancano situazioni in cui si ricevono e si danno sportellate, cambia solo il modo in cui le si danno. Nella modalità corsa è sufficiente spingere un veicolo nemico fuori dalla carreggiata per vedere la sua velocità scendere, lo stesso giochetto però non si riesce ad applicare nelle gare fuoristrada, dove appunto le auto sono pensate per tutti i tipi di terreni. 
Parlando di differenze, questi sono i principali tipi di gare: Corsa: Gara classica su asfalto, il primo a tagliare il traguardo vince. Fuoristrada: Gara classica con tratti offroad, il primo arrivato vince. Derapata: Gara di derapate, il cambio di terreno non va ad intaccare i punti che vengono dati, il punteggio più alto vince. Accelerazione: l''erede di "sparo" dei capitoli Underground della saga. Rettilineo, cambio manuale, il più veloce vince. Fuga: scappare dai poliziotti e farne fuori il più possibile, non penso necessiti di ulteriori spiegazioni. Le Speed Card rappresentano le modifiche che potete fare al vostro veicolo, di diversi livelli e diverse marche, combinandone tre dello stesso marchio otterrete un bonus diverso in base al brand. 
Le Speed Card si ricevono alla fine di una gara, si comprano in officina oppure si trovano in una "consegna", una specie di pacchetto ricompense che viene assegnato o ottenibile accumulando stelle delle varie attività. Da segnalare si possono ottenere pacchetti anche comprandoli – realmente però, non con crediti di gioco! Insomma, sono riusciti a microtransazioni perfino in Need For Speed. Non c''è da dannarsi, però: con un po'' di grinding selvaggio si risolvono tutti i problemi di crediti. Se con le Speed Card si perde un punto, lo si riguadagna quando si parla di modifiche estetiche: cofano, cerchi, dischi dei freni e alette sul paraurti anteriore, insomma ogni singolo aspetto della macchina è personalizzabile, soprattutto per quanto riguarda le aerografie. Il gioco utilizza un sistema che ricorda molto i livelli di photoshop, posizionabili e scalabili liberamente, su ogni punto della carrozzeria. 
Sta solo alla creatività del giocatore! Su PS4 si ha un ottima resa visiva. Need For Speed: Payback, grazie all''ottimo motore grafico, offre delle viste mozzafiato. Non ci sono frame drop da segnalare, il gioco mantiene i 30 Frame al Secondo praticamente sempre, anche in gare fuoristrada dove gli effetti sono tanti. Il tutto senza casi di aliasing eclatanti. Le uniche situazioni in cui una PS4 standard si affanna sono le gare notturne in fuoristrada. Con l''illuminazione e il terreno ricco di particolari, la GPU sembra un po'' sotto stress. Il mondo aperto ed esplorabile nel gioco è una delle introduzioni più gradite: la mappa è molto vasta, con ogni tipo di pista – questo causa qualche piccolo glitch – ma nulla di esagerato. Le piste in cui si svolgono le gare sono pezzi della mappa in cui si guida liberamente, dai deserti, in grande numero, alle montagne, per finire anche città. 
Ovviamente, ma c''è qualcosa che manca, un qualcosa che per i fan delle corse fa la differenza: la visuale interna del veicolo. Inoltre, i danni al veicolo sono solo estetici, non influiscono sulle prestazioni del mezzo e per di più basta passare da un benzinaio per far sparire tutto. Ci sono alcuni dettagli che bisogna valorizzare, come lo sporco sull''auto – dopo un po'' di offroad il veicolo è così sporco che vi vien la voglia di scriverci "Lavami" sul lunotto posteriore –  oppure la modalità foto, dove potrete fermare il tempo per scattare una foto del vostro gioiellino da una qualsiasi angolazione, in qualsiasi situazione. Inoltre la radio ha diversi generi, che spaziano dal hip hop al rock, con diversi bei brani. Peccato, però, che la radio non si possa spegnere per godersi il rombo del motore. È un ottimo gioco, molto divertente. Siamo di fronte ad un erede dei cari e vecchi Need For Speed Undergound. Ci sono delle differenze, come ovvio che sia, ma rimane comunque un titolo che vi terrà impegnati per del tempo.',
'2017-11-30',  0,1,0,1,0,0,1,0);

DROP TABLE IF EXISTS `Valutazione`;
create table IF NOT EXISTS `Valutazione`
(
	`Voto` int not null,
    `NomeGioco` varchar(144) not null,
    `UserNick` varchar(16) not null,
    
    primary key (`NomeGioco`, `UserNick`),
    foreign key `Valutazione` (`NomeGioco`) references `Gioco` (`Nome`),
    foreign key `Valutazione` (`UserNick`) references `Account` (`Nickname`)
)
ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Valutazione` (`UserNick`, `NomeGioco`, `Voto`) values 
('Nikocister', 'Outlast II' , 4), 
('Mmasier', 'FIFA 18' , 3), 
('Snordio', 'The Legend of Zelda: A Link between worlds' , 5), 
('Drakex94', 'Super Mario Odissey' , 4), 
('DarkWarrior', 'Call of Duty: World War II' , 1),
('Nikocister', 'Need For Speed: Payback' , 4), 
('Mmasier', 'Assassin''s Creed: Brotherhood' , 4),
('Snordio', 'Clash of Clans' , 5), 
('Drakex94', 'The Sims 3' , 4), 
('DarkWarrior', 'Crash Bandicoot: N.Sane Trilogy', 1),
('DarkWarrior', 'Mortal Combat X', 5);

DROP TABLE IF EXISTS `Giochi`;
create table IF NOT EXISTS `Giochi` (
	`Nome` varchar (100) not null unique,
	`DataPub` date not null,
	`Genere1` varchar (20) not null,
	`Genere2` varchar (20),
	`Genere3` varchar (20),
	`PEGI` int (5),
	`Valutazione` double,
    `Disponibilita` varchar(144),
    `Playstation3` tinyint (1),
	`Playstation4` tinyint (1),
	`Xbox360` tinyint (1),
	`XboxOne` tinyint (1),
	`NintendoDS` tinyint (1),
	`NintendoSwitch` tinyint (1),
	`Windows` tinyint (1),
	`Mac` tinyint (1),
    `Descrizione` varchar(5000),
	primary key ( `Nome`),
	foreign key `Giochi1` (`Genere1`)  references `Genere` (`CodGenere`),
	foreign key `Giochi2` (`Genere2`)  references `Genere` (`CodGenere`),
	foreign key `Giochi3` (`Genere3`)  references `Genere` (`CodGenere`)
)
ENGINE=MyISAM DEFAULT CHARSET=latin1;
insert into `Giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`,`Valutazione`, `Disponibilita`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `Windows`, `Mac`, `Descrizione`)
       values 
       		
       		('Need for Speed: Payback', '2017-11-10', 'Corse', 'Azione', null, 12, null,	'Ps4, XboxOne, Windows', 0,1,0,1,0,0,1,0, 'Sullo sfondo della corruzione di Fortune Valley, il desiderio di vendetta porta la tua banda
            a riunirsi per sconfiggere la Loggia, una spietata organizzazione che esercita il suo controllo sui casinò, i criminali e i poliziotti della città. In questo paradiso del gioco d''azzardo, la posta in palio è alta e la Loggia ha sempre le carte vincenti in mano. Affronta diversi eventi nei panni di Tyler, Mac e Jess. Guadagnati il
            rispetto del sottobosco della Valley e gareggia nella sfida finale per sconfiggere la Loggia una volta per
            tutte.'),
			
			('Assassin''s Creed: Brotherhood', '2010-11-16', 'RPG', 'Avventura', null, 18, null, 'Ps3, Ps4, Xbox360, XboxOne, Windows',1,1,1,1,0,0,1,0, 'Vivi e respira come Ezio, un leggendario Maestro Assassino, nella sua continua lotta contro il potente Ordine Templare. Dovrà viaggiare nella più grande città d''Italia, Roma, centro di potere, avidità e corruzione per colpire il cuore del nemico.
            Sconfiggere i tiranni corrotti richiederà non solo la forza, ma la leadership, poiché Ezio comanda un''intera Fratellanza che si radunerà al suo fianco.
            Solo lavorando insieme gli Assassini possono sconfiggere i loro nemici mortali. E per la prima volta, tramite il multigiocatore pluripremiato ti consentirà di scegliere tra una vasta gamma di personaggi unici, ognuno con le proprie armi e tecniche di assassinio! È ora di unirsi alla Fratellanza.'),
			
			('Call of Duty: World War II', '2017-11-03', 'FPS', 'Azione', null, 18, null,'Ps4, XboxOne, Windows',0,1,0,1,0,0,1,0, 'Un''esperienza mozzafiato che porterà una nuova generazione nella Seconda Guerra Mondiale. Sbarca in Normandia durante il fatidico D-Day e combatti in tutta Europa rivivendo leggendarie battaglie che hanno segnato il conflitto più sanguinoso della storia.
            Scopri il classico combattimento di Call of Duty, i legami del cameratismo e il cuore crudele della guerra.'),
			
			('The Legend of Zelda: A Link between worlds', '2013-11-22', 'Avventura','RPG', null, 12, null, 'NDS',0,0,0,0,1,0,0,0, 'The Legend of Zelda: A Link Between Worlds introduce un set completamente nuovo di rompicapi e dungeon! Questa volta Link può anche muoversi sui muri come se fosse un dipinto.
            Questa possibilità cambia completamente la tua prospettiva, permettendoti di pensare in una nuova dimensione e risolvere rompicapi prima impensabili.
            L''ordine e il modo in cui ti cimenti con ciascun labirinto dipenderà completamente da te. Incontrerai anche un nuovo personaggio, Lavio, che rappresenta la chiave verso il successo: nella sua bottega potrai affittare o acquistare oggetti, come l''arpione, l''arco e il martello, che ti saranno utili nel corso dell''avventura.
            Molti di questi oggetti saranno disponibili all''inizio del gioco e starà a te decidere quali affittare o acquistare, a seconda del labirinto che desideri affrontare!'),
			
			('Outlast II', '2017-04-25', 'Horror', 'Azione', null, 18, null,'Ps4, XboxOne, Windows, Mac',0,1,0,1,0,0,1,1, 'In Outlast 2 fai la conoscenza di Sullivan Knoth e dei suoi seguaci, che si sono lasciati alle spalle il nostro mondo corrotto per fondare la cittadina di Temple Gate, nel cuore del deserto, lontana da qualsiasi segno di civiltà.
            Knoth si sta preparando insieme al suo gregge alle tribolazioni della fine dei tempi e tu ti ci ritrovi dentro fino al collo.
            Tu sei Blake Langermann, un cameraman che lavora con sua moglie Lynn. Siete dei giornalisti investigativi disposti a correre qualsiasi rischio e a scavare a fondo per svelare le storie che nessuno si azzarda a toccare.
            Stai seguendo una scia di indizi iniziata con l''omicidio apparentemente impossibile di una donna incinta sconosciuta ed identificata semplicemente come Jane Doe. L''indagine ti ha condotto nel cuore del deserto dell''Arizona, in un''oscurità così profonda che nessuno potrebbe illuminare e in una corruzione così intensa che impazzire potrebbe essere l''unica cosa sensata da fare.'),
			
			('The Sims 3', '2009-06-02', 'Simulatore', null, null,13, null,'Ps3, Xbox360, XboxOne, NDS, Windows, Mac',1,0,1,1,1,0,1,1, 'The Sims 3 è un capolavoro di simulazione che ti dà la possibilità di ipotizzare e vivere tutte le vite che ti pare. Crea tutti i personaggi che vuoi, ognuno diverso dall''altro in quanto a caratteristiche fisiche e psicologiche, regalagli una casa e un mondo in cui vivere.
            E poi stai a vedere che succede. Con The Sims 3 non c''è nulla di prevedibile e nulla di impossibile.'),
			
			('Mortal Kombat X', '2015-04-07', 'Horror', 'Picchiaduro', null,18, null,'Ps4, XboxOne, Windows',0,1,0,1,0,0,1,0, 'Mortal Kombat X combina animazioni cinematografiche uniche a un nuovo stile di gioco.
            Per la prima volta, potrai scegliere tra diverse varianti di ogni personaggio, che influenzeranno strategie e stili di combattimento.'),
			
			('FIFA 18', '2017-09-29', 'Sport', null, null, 3, null, 'Ps3, Ps4, Xbox360, XboxOne, NSwitch, Windows',1,1,1,1,0,1,1,0, 'Sei pronto per la più grande stagione di sempre? Grazie al motore Frostbite™, FIFA 18 attenua il confine tra il mondo reale e quello virtuale dando vita a eroi, squadre e atmosfere del gioco più bello del mondo.
            Crea il tuo Ultimate Team nella modalità più giocata di FIFA scegliendo tra migliaia di calciatori. Scopri i nuovi obiettivi giornalieri, affronta la modalità Squad Battles per ricevere premi settimanali e osserva i migliori giocatori al mondo su Champions Channel!'),
			
			('Crash Bandicoot: N.Sane Trilogy', '2017-06-30', 'Platform', 'Azione', 'Avventura', 7, null, 'Ps4',0,1,0,0,0,0,0,0,'Il tuo marsupiale preferito, Crash Bandicoot, è tornato! Più forte e pronto a scatenarsi con N. Sane Trilogy game collection. Ora potrai provare Crash Bandicoot come mai prima d’ora in HD.
            Ruota, salta, scatta e divertiti atttraverso le sfide e le avventure dei tre giochi da dove tutto è iniziato, Crash Bandicoot®, Crash Bandicoot® 2: Cortex Strikes Back e Crash Bandicoot®: Warped.
            Rivivi i migliori "Momenti Crash" con la grafica completamente rimasterizzata in HD!
            Crash Bandicoot: Dr. Neo Cortex ha in piano di conquistare il mondo, e vuole creare una stirpe di animali geneticamente modificati per raggiungere il suo obiettivo. Per creare il suo esercito in miniatura dovrà rapire più animali possibile.
            La fidanzata di Crash Bandicoot fa parte delle sue vittime! Prendi il controllo di Crash, corri, salta e attraverso 30 livelli di azione intensa in 3 meravigliose isole Australiane.
            Solo tu potrai aiutare Crash a salvare gli animali, la sua fidanzata e impedire a Dr. Cortex di portare a termine il suo piano malefico.
            Crash Bandicoot 2, Cortex Strikes Back: Il malvagio Dr. Neo Cortex è tornato… ma questa volta a salvare il mondo? E per farlo dovrà chiedere l’aiuto del suo arci nemico Crash Bandicoot®?
            Sarà questa una messinscena per attirare Crash nel prossimo folle esperimento di Cortex? Riuscirà Crash a difendersi da questa insidia?
            Ambiente 3D free roaming molto più vasto, nuove animazioni e un roster di personaggi coloratissimi – pattina sul ghiaccio, cavalca orsi polari e guida jet-packs a gravità zero con Crash, nella nuova avventura.
            Crash Bandicoot Warped: Eh si… è proprio tornato…. ed è prontissimo all’azione! In una nuova avventura a spasso nel tempo! Gameplay innovativo per la serie – vai sottacqua, nuota, guida motociclette, un piccolo T-Rex, e gira in free-roaming pilotando un aereo!
            Gioca come Coco! Cavalcauna tigre sulla Grande Muraglia Cinese, esegui straordinarie acrobaziesu jetski! Metti alla prova le tue abilità con nuove mosse straordinarie, come Super-charge Body Slam, Super Slide, Salto doppio, Death-Tornado Spin e un Bazooka teleguidato.
            Nuovi nemici da sconfiggere, come Big Boss, Uka Uka, N. Tropy, il minaccioso Dingodile e il ritorno di alcuni super famosi come N. Gin and Tiny. Più Azione. Più Divertimento. Più puzzle e livelli segreti.'),
			
			('Super Mario Odyssey', '2017-10-27', 'Avventura','Azione', null, 10, null, 'NSwitch',0,0,0,0,0,1,0,0,'Mario approda su Nintendo Switch con un’avventura 3D senza precedenti!
            Questo fantastico gioco in stile sandbox – il primo dai tempi degli amatissimi Super Mario 64 del 1996 e Super Mario Sunshine del 2002 – è pieno zeppo di segreti e sorprese! Mario può ora contare su tutta una serie di nuove mosse e abilità, come lanci o salti che sfruttano il cappello. Può persino impossessarsi di personaggi e oggetti, per possibilità di gameplay incredibili e mai sperimentate prima.
            Questo titolo è il biglietto ufficiale per un’emozionante viaggio, tra mondi incredibili e lontani dal classico Regno dei Funghi!');
            
            
DROP TABLE IF EXISTS `Immagini`;
create table IF NOT EXISTS `Immagini` (
	`NomeGioco` varchar (100) not null unique,
    `MenuImg` varchar(20) not null,
    `GiocoImg` varchar(20) not null,
    primary key ( `NomeGioco`),
    foreign key `Immagine` (`NomeGioco`)  references `Giochi` (`Nome`)
)
ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Immagini` (`NomeGioco`, `MenuImg`, `GiocoImg`)
	values
    ('Need for Speed: Payback', 'NFSPayback.jpg', 'NFSPayback0.jpg'),
    ('Assassin''s Creed: Brotherhood', 'ACB.jpg', 'ACB0.jpg'),
    ('Call of Duty: World War II', 'CODWWII.jpg', 'CODWWII0.jpg'),
    ('The Legend of Zelda: A Link between worlds', 'Zelda.jpg', 'Zelda0.jpg'),
    ('Outlast II', 'outlast2.jpg', 'outlast20.jpg'),
    ('The Sims 3', 'Thesims3.jpg', 'Thesims30.jpg'),
    ('Mortal Kombat X', 'MKX.jpg', 'MKX0.jpg'),
    ('FIFA 18','FIFA18.jpg', 'FIFA180.jpg'),
    ('Crash Bandicoot: N.Sane Trilogy', 'CBT.jpg', 'CBT0.jpg'),
    ('Super Mario Odyssey', 'SMO.jpg', 'SMO0.jpg');
    
    
DROP TABLE IF EXISTS `CommentiRecensione`;
create table IF NOT EXISTS `CommentiRecensione` (
  `TitoloRec` varchar (144) not null unique,
  `Data` date not null,
  `Ora` time not null,
  `Commento` varchar (512) not null,
  `Nick` varchar (16) not null unique,
  primary key (`TitoloRec`, `Data`, `Ora`, `Commento`, `Nick`),
  foreign key `CommentiRecensione`(`TitoloRec`) references `Recensione`(`Titolo`),
  foreign key `CommentiRecensione`(`Nick`) references `Account`(`Nickname`)
)
 
ENGINE=MyISAM DEFAULT CHARSET=latin1;
 
insert into `CommentiRecensione` (`TitoloRec`, `Data`, `Ora`, `Nick`, `Commento`)
values('Need For Speed Payback – La vendetta è servita', '2017-11-30', '10:30:00', 'Nikocister',
'molto bella la grafica, ho perso un semestre a causa di questo gioco');
 
 
DROP TABLE IF EXISTS `CommentiNotizie`; 
create table IF NOT EXISTS `CommentiNotizie` (
  `TitoloNot` varchar (144) not null,
  `Data` date not null,
  `Ora` time not null,
  `Commento` varchar (512) not null,
  `Nick` varchar (16) not null,
  primary key (`TitoloNot`, `Data`, `Ora`, `Commento`, `Nick`), /*da rivedere `Commento` dentro qua*/
  foreign key `CommentiNotizie`(`TitoloNot`) references `Notizia`(`Titolo`),
  foreign key `CommentiNotizie`(`Nick`) references `Account`(`Nickname`)
)
 
ENGINE=MyISAM DEFAULT CHARSET=latin1;
 
insert into `CommentiNotizie` (`TitoloNot`, `Data`, `Ora`, `Nick`, `Commento`)
values('XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', '2017-11-30', '10:30:00', 'Nikocister',
'La nuova Xbox One X spacca, è molto più performante di tutte le console Sony, sommate tra loro ovviamente ;) e poi,
diciamoci la verità, le esclusive della sony non sono nemmeno così carine :sad:');
    
/*

query:
- mostrare in ordine di data & ora i commenti di un utente
- mostrare in ordine di data le news
- mostrare in ordine di data le recensioni
- mostrare giochi scelti per piattaforma
- mostrare news scelte per piattaforma
- mostrare giochi scelti per genere
- mostrare giochi scelti per valutazione


trigger:
- dopo ogni valutazione, aggiornare la valutazione del gioco
- aggiornare database dopo ogni registrazione al sito
- aggiornare database dopo ogni commento inserito dall'utente

*/
