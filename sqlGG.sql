create table `Admin`
(
	`Nickname` varchar(16) not null unique,
    `Password` varchar(16) not null,
    `CodFiscale` varchar(16) not null unique,
    `DataNascita` date not null,
    `Email` varchar(20) not null unique,
    
    primary key(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Admin` (`Nickname`, `Password`, `CodFiscale`, `DataNascita`, `Email`)
values ('admin', 'admin', 'DMNDMN95R01C743Q', '1995-10-01', 'admin@admin.admin'),
('Peachka', 'ciaone', 'FNELCU95H70B745B', '1995-06-30', 'lucia.fenu95@gmail.com'),
('Aiolos', '123qwerty789', 'PTTGMR95M20C743Y', '1995-08-20', 'gian82095@gmail.com'),
('Gionny-Atlas', '0987654321', 'BTTFRC94R01C743T', '1994-10-01', 'frabat@icloud.com'),
('Depaa', 'asdfghjkl', 'DPSMTT95M20C743A', '1995-08-20', 'depascale.matteo@gmail.com');

create table `Notizia`
(
	`DataPubblicazione` date not null,
	`Titolo` varchar(144) not null unique,
    `AdminNick` varchar(16) not null,
    `Testo` varchar(5000) not null,
    `XboxOne` int(1),
    `Xbox360` int(1),
    `NintendoDS` int(1),
    `NintendoSwitch` int(1),
    `PC` int(1),
    `Android` int(1),
    `iOS` int(1),
    `Playstation3` int(1),
    `Playstation4` int(1),
		
    primary key(`Titolo`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Notizie` (`DataPubblicazione`, `AdminNick`, `Titolo`, `Testo`, `XboxOne`, `Xbox360`, `NintendoDS`, `NintendoSwitch`, `PC`, `Android`, `iOS`, `Playstation3`, `Playstation4`)
values('2017-11-30', 'Depaa','XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', 
'Nel corso di un'' intervista concessa a GamesGuide.com, Piers Harding-Rolls, Director of Research and Analysis Games presso IHS Markit, ha confermato che la compagnia di ricerche di mercato ha quasi raddoppiato le proprie previsioni di vendita di Xbox One X nel 2017.
"Il feedback sui pre-order per Xbox One X standard e la Project Scorpio Edition ci ha spinti a rivedere le nostre previsioni di vendita di Xbox One X nel 2017. La edizione limitata di Xbox One X si è rivelata una mossa vincente, riuscendo a veicolare una robusta quantità di macchine durante la settimana di lancio, nelle Regioni chiave. IHS Markit ha quindi incrementato le proprie previsioni da 500.000 a 900.000 unità".
Allo stesso modo, la compagnia crede che, al netto di questo possibile successo commerciale, non basterà Xbox One X per colmare il gap presente tra Microsoft e Sony, specialmente prendendo in considerazione lo andamento del mercato in Europa continentale.',
1, 0, 0, 0, 0, 0, 0, 0, 0);

create table `CommentiNotizie` (
  `TitoloNot` varchar (144) not null,
  `Data` date not null,
  `Ora` time not null,
  `Commento` varchar (512) not null,
  `UserNick` varchar (16) not null,
  primary key (`TitoloNot`, `Data`, `Ora`, `Commento`, `Nickname`),	/*da rivedere `Commento` dentro qua*/
  foreign key `CommentiNotizie`(`TitoloNot`) references `Notizia`(`Titolo`),
  foreign key `CommentiNotizie`(`UserNick`) references `User`(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `CommentiNotizie` (`TitoloNot`, `Data`, `Ora`, `UserNick`, `Commento`)
values('XBOX ONE X: IHS MARKIT HA QUASI RADDOPPIATO LE SUE PREVISIONI DI VENDITA', '2017-11-30', '10:30:00', 'Nikocister',
'La nuova Xbox One X spacca, è molto più performante di tutte le console Sony, sommate tra loro ovviamente ;) e poi, 
diciamoci la verità, le esclusive della sony non sono nemmeno così carine :sad: '
);


create table `User`
(
	`Nickname` varchar(16) not null unique,
    `Nome` varchar(20) not null,
    `Cognome` varchar(20) not null,
    `Password` varchar(10) not null,
    `DataNascita` date not null,
    `Email` varchar(20) not null unique,
    
    primary key (`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `User` (`Nickname`, `Nome`, `Cognome`, `Password`, `DataNascita`, `Email`)
values ('user', 'user', 'user', 'user', '01-10-1995', 'user@user.user'),
('Nikocister', 'Nicola', 'Cisternino', 'Sassari', '1995-01-12', 'nicocister95@gmail.com'), 
('Mmasier', 'Marco', 'Masiero', 'Chubby', '1996-09-09','marcmasi@icloud.com'),
('Snordio', 'Stefano', 'Nordio', 'Chioggia4ever', '1995-06-15', 'steno996@gmail.com'),
('Drakex94', 'Francesco', 'Sacchetto', 'helpme', '1994-12-19', 'frasack94@gmail.com'),
('DarkWarrior', 'Francesco', 'Pecile', 'pecpecpec', '1996-12-09', 'frapec96@gmail.com');

create table `Valutazione`
(
	`Voto` int not null,
    `NomeGioco` varchar(100) not null,
    `UserNick` varchar(16) not null unique,
    
    primary key (`NomeGioco`, `UserNick`),
    foreign key `Valutazione` (`NomeGioco`) references `Gioco` (`Nome`),
    foreign key `Valutazione` (`UserNick`) references `User` (`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Valutazione` (`UserNick`, `NomeGioco`, `Voto`)
values ('Nikocister', 'Outlast II' , 4), 
('Mmasier', 'FIFA18' , 3), 
('Snordio', 'The Legend Of Zelda - Link Between World' , 5), 
('Drakex94', 'Mario Odissey' , 4), 
('DarkWarrior', 'Call of Duty - World War II' , 1),
('Nikocister', 'Need For Speed - Payback' , 4), 
('Mmasier', 'Assassin''s Creed - Brotherhood' , 3), 
('Snordio', 'Clash Of Clans' , 5), 
('Drakex94', 'The Sims III' , 4), 
('DarkWarrior', 'Crash - Trilogy', 1),
('DarkWarrior', 'Mortal Combat V', 5);

create table `Recensione` 
(
  `NomeGioco` varchar (144) not null unique,
  `AdminNick` varchar (16) not null unique,
  `Titolo` varchar (144) not null unique,
  `Testo` varchar (8192) not null,
  `Data` date not null,
  primary key (`Titolo`),
  foreign key `Recensione`(`AdminNick`) references `Admin`(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;

insert into `Recensione`(`NomeGioco`, `AdminNick`, `Titolo`, `Testo`, `Data`)
values ('Need For Speed - Payback', 'Aiolos', 'Need For Speed Payback – La vendetta è servita', 'Si parte subito con il prologo in cui si provano alcuni mezzi e viene narrata la storia che apre la modalità carriera. Con grande sorpresa, il sistema di guida adottato è abbastanza realistico e l''aspetto visivo non è per niente male – il tutto è sostenuto dal frostbite, il famoso motore grafico di DICE. La modalità di guida somiglia a "Forza Horizon" di Playground Games, che fa del realismo il proprio cavallo di battaglia, con una grande differenza: il controllo del veicolo. Quest''ultimo forse risulta un po'' troppo eccessivo: è impensabile fare una curva a gomito, a 140, di freno a mano, con una Buick del ''64.
Tuttavia è un gioco con obiettivi completamente diversi (Qualcuno ha detto Fast & Furious?), quindi sotto questo punto di vista Need for Speed: Payback è giustificato. In modalità Carriera si trovano in mezzo alla strada degli archi azzurro/verdi,che danno il via ad alcune come Autovelox e Salto, dove si deve rispettivamente passare dal varco ad una velocità maggiore di quella indicata oppure  superare i metri richiesti con un salto. La Gara di velocità, dove quello che conta è la media tra il primo e l''ultimo varco – non la velocità istantanea raggiunta nei check point – costa qualche tentativo prima di capire come funzioni. 
Oltre le nuove modalità, forse un po'' macchinose, ci son le gare "classiche", disponibili nelle categorie corsa, fuoristrada, derapata, accelerazione e fuga (con relative auto di categoria) ed alla fine di ogni gara vengono consegnati dei crediti e delle Speed Card. Le gare hanno una struttura classica, ovvero si deve attraversare i vari checkpoint e concludere primi. Sembra facile detta così. L''intelligenza artificiale dei piloti contro cui si gareggia è talvolta un po'' troppo competitiva: non mancano situazioni in cui si ricevono e si danno sportellate, cambia solo il modo in cui le si danno. Nella modalità corsa è sufficiente spingere un veicolo nemico fuori dalla carreggiata per vedere la sua velocità scendere, lo stesso giochetto però non si riesce ad applicare nelle gare fuoristrada, dove appunto le auto sono pensate per tutti i tipi di terreni. 
Parlando di differenze, questi sono i principali tipi di gare: Corsa: Gara classica su asfalto, il primo a tagliare il traguardo vince. Fuoristrada: Gara classica con tratti offroad, il primo arrivato vince. Derapata: Gara di derapate, il cambio di terreno non va ad intaccare i punti che vengono dati, il punteggio più alto vince. Accelerazione: l''erede di "sparo" dei capitoli Underground della saga. Rettilineo, cambio manuale, il più veloce vince. Fuga: scappare dai poliziotti e farne fuori il più possibile, non penso necessiti di ulteriori spiegazioni. Le Speed Card rappresentano le modifiche che potete fare al vostro veicolo, di diversi livelli e diverse marche, combinandone tre dello stesso marchio otterrete un bonus diverso in base al brand. 
Le Speed Card si ricevono alla fine di una gara, si comprano in officina oppure si trovano in una "consegna", una specie di pacchetto ricompense che viene assegnato o ottenibile accumulando stelle delle varie attività. Da segnalare si possono ottenere pacchetti anche comprandoli – realmente però, non con crediti di gioco! Insomma, sono riusciti a microtransazioni perfino in Need For Speed. Non c''è da dannarsi, però: con un po'' di grinding selvaggio si risolvono tutti i problemi di crediti. Se con le Speed Card si perde un punto, lo si riguadagna quando si parla di modifiche estetiche: cofano, cerchi, dischi dei freni e alette sul paraurti anteriore, insomma ogni singolo aspetto della macchina è personalizzabile, soprattutto per quanto riguarda le aerografie. Il gioco utilizza un sistema che ricorda molto i livelli di photoshop, posizionabili e scalabili liberamente, su ogni punto della carrozzeria. 
Sta solo alla creatività del giocatore! Su PS4 si ha un ottima resa visiva. Need For Speed: Payback, grazie all''ottimo motore grafico, offre delle viste mozzafiato. Non ci sono frame drop da segnalare, il gioco mantiene i 30 Frame al Secondo praticamente sempre, anche in gare fuoristrada dove gli effetti sono tanti. Il tutto senza casi di aliasing eclatanti. Le uniche situazioni in cui una PS4 standard si affanna sono le gare notturne in fuoristrada. Con l''illuminazione e il terreno ricco di particolari, la GPU sembra un po'' sotto stress. Il mondo aperto ed esplorabile nel gioco è una delle introduzioni più gradite: la mappa è molto vasta, con ogni tipo di pista – questo causa qualche piccolo glitch – ma nulla di esagerato. Le piste in cui si svolgono le gare sono pezzi della mappa in cui si guida liberamente, dai deserti, in grande numero, alle montagne, per finire anche città. 
Ovviamente, ma c''è qualcosa che manca, un qualcosa che per i fan delle corse fa la differenza: la visuale interna del veicolo. Inoltre, i danni al veicolo sono solo estetici, non influiscono sulle prestazioni del mezzo e per di più basta passare da un benzinaio per far sparire tutto. Ci sono alcuni dettagli che bisogna valorizzare, come lo sporco sull''auto – dopo un po'' di offroad il veicolo è così sporco che vi vien la voglia di scriverci "Lavami" sul lunotto posteriore –  oppure la modalità foto, dove potrete fermare il tempo per scattare una foto del vostro gioiellino da una qualsiasi angolazione, in qualsiasi situazione. Inoltre la radio ha diversi generi, che spaziano dal hip hop al rock, con diversi bei brani. Peccato, però, che la radio non si possa spegnere per godersi il rombo del motore. È un ottimo gioco, molto divertente. Siamo di fronte ad un erede dei cari e vecchi Need For Speed Undergound. Ci sono delle differenze, come ovvio che sia, ma rimane comunque un titolo che vi terrà impegnati per del tempo.',
'30-11-2017');

create table `CommentiRecensione` (
  `TitoloRec` varchar (144) not null unique,
  `Data` date not null,
  `Ora` time not null,
  `Commento` varchar (512) not null,
  `UserNick` varchar (16) not null unique,
  primary key (`TitoloRec`, `Data`, `Ora`, `Commento`, `Nickname`),
  foreign key `CommentiRecensione`(`TitoloRec`) references `Recensione`(`Titolo`),
  foreign key `CommentiRecensione`(`UserNick`) references `User`(`Nickname`)
)

ENGINE=MyISAM DEFAULT CHARSET=latin1;
