

create table `Genere` (
	`CodGenere` int (20) primary key,
	`NomeGen` varchar (20) not null,
)

Insert into `Genere` (`CodGenere`, `NomeGen`)
	values (0001, `Action`),
			(0002, `FPS`),
			(0003, `RPG`),
			(0004, `Adventure`),
			(0005, `Fighting`),
			(0006, `Platform`),
			(0007, `Horror`),
			(0008, `Simulatore`),
			(0009, `Sport`),
			(0010, `Race`);
			(0011, `Strategia`);



create table `Giochi` (
	`Nome` varchar (100) not null,
	`DataPub` date not null,
	`Genere1` varchar (20) not null,
	`Genere2` varchar (20),
	`Genere3` varchar (20),
	`PEGI` int (5),
	`Valutazione` double not null,
	`Descrizone` varchar (10000),
	`Scheda Tecnica` varchar (1000)
	`Playstation3` tinyint (1),
	`Playstation4` tinyint (1),
	`Xbox360` tinyint (1),
	`XboxOne` tinyint (1),
	`NintendoDS` tinyint (1),
	`NintendoSwitch` tinyint (1),
	`PC` tinyint (1),
	`iOS` tinyint (1),
	`Android` tinyint (1),
	foreign key `Giochi` (`Genere1`, `Genere2`, `Genere3`) references `Genere` (`CodGenere`)
)
ENGINE=MyISAM DEFAULT CHARSET=latin1;
insert into `Giochi` (`Nome`, `DataPub`, `Genere1`, `Genere2`, `Genere3`, `PEGI`,`Valutazione`, `Playstation3`, `Playstation4`, `Xbox360`,`XboxOne`, `NintendoDS`, `NintendoSwitch`, `PC`, `iOS`, `Android`)
       values 
       		
       		('Need for Speed: Payback', '2017-11-10', 'Race', 'Action', null, 12, null, 'Sullo sfondo della corruzione di Fortune Valley, il desiderio di vendetta porta la tua banda
			a riunirsi per sconfiggere la Loggia, una spietata organizzazione che esercita il suo controllo sui casinò, i criminali e i poliziotti della città. In questo paradiso del gioco d''azzardo, la posta in palio è alta e la Loggia ha sempre le carte vincenti in mano. Affronta diversi eventi nei panni di Tyler, Mac e Jess. Guadagnati il
			rispetto del sottobosco della Valley e gareggia nella sfida finale per sconfiggere la Loggia una volta per
			tutte.', 
			'Minimo: 
			OS: 64-bit Windows 7 or later; 
			CPU: Intel i3 6300 @ 3.8GHz or AMD FX 8150 @ 3.6GHz with 4 hardware threads; 
			RAM: 6GB; DISC DRIVE: DVD ROM drive required for installation only; 
			HARD DRIVE: 30GB; 
			VIDEO: NVIDIA GeForce® GTX 750 Ti or AMD Radeon™ HD 7850 or equivalent DX11 compatible GPU with 2GB of memory; 
			DirectX: 11 Compatible video card or equivalent; 
			Raccomandato:
			OS: 64-bit Windows 10 or later; 
			CPU: Intel i5 4690K @ 3.5GHz or AMD FX 8350 @ 4.0GHz with 4 hardware threads;
			RAM: 8GB;
			DISC DRIVE: DVD ROM drive required for installation only;
			HARD DRIVE: 30GB;
			VIDEO: AMD Radeon™ RX 480 4GB, NVIDIA GeForce® GTX 1060 6GB or equivalent DX11 compatible;
			GPU with 4GB of memory;
			DirectX: 11 Compatible video card or equivalent',  
			0,1,0,1,0,0,1,0,0),
			
			('Assassin''s Creed: Brotherhood', '2010-11-16', 'RPG', 'Adventure', null, 18, null, 'Vivi e respira come Ezio, un leggendario Maestro Assassino, nella sua continua lotta contro il potente Ordine Templare. Dovrà viaggiare nella più grande città d''Italia, Roma, centro di potere, avidità e corruzione per colpire il cuore del nemico. 
			Sconfiggere i tiranni corrotti richiederà non solo la forza, ma la leadership, poiché Ezio comanda un''intera Fratellanza che si radunerà al suo fianco. 
			Solo lavorando insieme gli Assassini possono sconfiggere i loro nemici mortali. E per la prima volta, tramite il multigiocatore pluripremiato ti consentirà di scegliere tra una vasta gamma di personaggi unici, ognuno con le proprie armi e tecniche di assassinio! È ora di unirsi alla Fratellanza.',
			'Minimo:
			OS: Windows® XP (32-64 bits) /Windows Vista®(32-64 bits)/Windows 7® (32-64 bits);
			Processor: Intel Core® 2 Duo 1.8 GHZ or AMD Athlon X2 64 2.4GHZ;
			Memory: 1.5 GB Windows® XP / 2 GB Windows Vista® - Windows 7®;
			Graphics: 256 MB DirectX® 9.0–compliant card with Shader Model 3.0 or higher;
			DirectX®: 9.0;
			Hard Drive: 8 GB;
			Sound: DirectX 9.0;
			Supported Video Cards: ATI® RADEON® HD 2000/3000/4000/5000/6000 series, NVIDIA GeForce® 8/9/100/200/300/400/500 series;
			Raccomandato:
			OS: Windows® XP (32-64 bits) /Windows Vista®(32-64 bits)/Windows 7® (32-64 bits);
			Processor: Intel Core® 2 Duo E6700 2.6 GHz or AMD Athlon 64 X2 6000+ or better;
			Memory: 1.5 GB Windows® XP / 2 GB Windows Vista® - Windows 7®;
			Graphics: GeForce 8800 GT or ATI Radeon HD 4700 or better;
			DirectX®: 9.0;
			Hard Drive: 8 GB;
			Sound: 5.1 sound card.',
			1,1,1,1,0,0,1,0,0),
			
			('Call of Duty: World War II', '2017-11-03', 'FPS', 'Action', null, 18, null,'Un''esperienza mozzafiato che porterà una nuova generazione nella Seconda Guerra Mondiale. Sbarca in Normandia durante il fatidico D-Day e combatti in tutta Europa rivivendo leggendarie battaglie che hanno segnato il conflitto più sanguinoso della storia. 
			Scopri il classico combattimento di Call of Duty, i legami del cameratismo e il cuore crudele della guerra.', 
			'Minimo:
			Sistema operativo: Windows 7 64-Bit or later;
			Processore: CPU: Intel® Core™ i3 3225 3.3 GHz or AMD Ryzen™ 5 1400;
			Memoria: 8 GB di RAM;
			Scheda video: NVIDIA® GeForce® GTX 660 @ 2 GB / GTX 1050 or ATI® Radeon™ HD 7850 @ 2GB / AMD RX 550;
			DirectX: Versione 11;
			Memoria: 90 GB di spazio disponibile;
			Scheda audio: DirectX Compatible.',
			0,1,0,1,0,0,1,0,0),
			
			('The Legend of Zelda: A Link between worlds', '2013-11-22', 'Adventure','RPG', null, 12, null, 'The Legend of Zelda: A Link Between Worlds introduce un set completamente nuovo di rompicapi e dungeon! Questa volta Link può anche muoversi sui muri come se fosse un dipinto. 
			Questa possibilità cambia completamente la tua prospettiva, permettendoti di pensare in una nuova dimensione e risolvere rompicapi prima impensabili. 
			L''ordine e il modo in cui ti cimenti con ciascun labirinto dipenderà completamente da te. Incontrerai anche un nuovo personaggio, Lavio, che rappresenta la chiave verso il successo: nella sua bottega potrai affittare o acquistare oggetti, come l''arpione, l''arco e il martello, che ti saranno utili nel corso dell''avventura. 
			Molti di questi oggetti saranno disponibili all''inizio del gioco e starà a te decidere quali affittare o acquistare, a seconda del labirinto che desideri affrontare!', 0,0,0,0,1,0,0,0,0),

			('Outlast II', '2017-04-25', 'Horror', 'Action', null, 18, null, 'In Outlast 2 fai la conoscenza di Sullivan Knoth e dei suoi seguaci, che si sono lasciati alle spalle il nostro mondo corrotto per fondare la cittadina di Temple Gate, nel cuore del deserto, lontana da qualsiasi segno di civiltà. 
			Knoth si sta preparando insieme al suo gregge alle tribolazioni della fine dei tempi e tu ti ci ritrovi dentro fino al collo.
			Tu sei Blake Langermann, un cameraman che lavora con sua moglie Lynn. Siete dei giornalisti investigativi disposti a correre qualsiasi rischio e a scavare a fondo per svelare le storie che nessuno si azzarda a toccare.
			Stai seguendo una scia di indizi iniziata con l''omicidio apparentemente impossibile di una donna incinta sconosciuta ed identificata semplicemente come Jane Doe. L''indagine ti ha condotto nel cuore del deserto dell''Arizona, in un''oscurità così profonda che nessuno potrebbe illuminare e in una corruzione così intensa che impazzire potrebbe essere l''unica cosa sensata da fare.',
			'Minimo:
			Sistema operativo: Windows Vista / 7 / 8 / 10, 64-bits;
			Processore: Intel Core i3-530;
			Memoria: 4 GB di RAM;
			Scheda video: 1GB VRAM, NVIDIA Geforce GTX 260 / ATI Radeon HD 4870;
			DirectX: Versione 10;
			Memoria: 30 GB di spazio disponibile;
			Scheda audio: DirectX Compatible;
			Raccomandato:
			Sistema operativo: Windows Vista / 7 / 8 / 10, 64-bits;
			Processore: Intel Core i5;
			Memoria: 8 GB di RAM;
			Scheda video: 1.5GB VRAM, NVIDIA Geforce GTX 660 / ATI Radeon HD 7850;
			DirectX: Versione 11;
			Memoria: 30 GB di spazio disponibile;
			Scheda audio: DirectX Compatible.',
			0,1,0,1,0,0,1,0,0),

			('Clash of Clans', '2012-08-02', 'Strategia', null, null,9, null, 'Unisciti a milioni di giocatori in tutto il mondo! Costruisci il tuo villaggio, fai crescere il clan e combatti in epiche guerre tra clan! Barbari baffuti, stregoni piromani e altre truppe incredibili ti aspettano!', 0,0,0,0,0,0,0,1,1),

			('The Sims 3', '2009-06-02', 'Simulatore', null, null,13, null, 'The Sims 3 è un capolavoro di simulazione che ti dà la possibilità di ipotizzare e vivere tutte le vite che ti pare. Crea tutti i personaggi che vuoi, ognuno diverso dall''altro in quanto a caratteristiche fisiche e psicologiche, regalagli una casa e un mondo in cui vivere. 
			E poi stai a vedere che succede. Con The Sims 3 non c''è nulla di prevedibile e nulla di impossibile.', 
			'Minimo:
			OS: Windows XP (Service Pack 2) or Windows Vista (Service Pack 1);
			Processor: (XP) 2.0 GHz P4 processor or equivalent; (Vista) 2.4 GHz P4 processor or equivalent;
			Memory: (XP) 1 GB; (Vista) 1.5 GB;
			Graphics: 128 MB Video Card with support for Pixel Shader 2.0;
			Hard Drive: At least 6.5 GB of hard drive space with at least 1 GB additional space for custom content;
			Built-in Graphics: Intel Integrated Chipset, GMA X3000 or above.
			2.6 GHz Pentium D CPU, or 1.8 GHz Core 2 Duo, or equivalent
			0.5 GB additional RAM
			Supported Video Cards: Nvidia GeForce series: FX5900 or greater, G100, GT 120, GT 130, GTS 150, GTS
			250, GTX 260, GTX 275, GTX 280, GTX 285, GTX 295; ATI Radeon™ series: ATI Radeon 9500 series of
			greater, X300, X600, X700, X800, X850, X1300, X1600, X1800, X1900, X1950, 2400, 2600, 2900, 3450,
			3650, 3850, 3870, 4850, 4870 series or greater; Intel® Graphics Media Accelerator (GMA): GMA 3-Series,
			GMA 4-Series', 1,0,1,1,1,0,1,1,1),

			('Mortal Kombat X', '2015-04-07', 'Horror', 'Fighting', null,18, null, 'Mortal Kombat X combina animazioni cinematografiche uniche a un nuovo stile di gioco.
			Per la prima volta, potrai scegliere tra diverse varianti di ogni personaggio, che influenzeranno strategie e stili di combattimento.',
			'Minimo:
			Sistema operativo: 64-bit: Vista, Win 7, Win 8, Win 10;
			Processore: Intel Core i5-750, 2.67 GHz | AMD Phenom II X4 965, 3.4 GHz;
			Memoria: 3 GB di RAM;
			Scheda video: NVIDIA GeForce GTX 460 | AMD Radeon HD 5850;
			DirectX: Versione 11;
			Memoria: 36 GB di spazio disponibile;
			Raccomandato:
			Sistema operativo: 64-bit: Win 7, Win 8, Win 10;
			Processore: Intel Core i7-3770, 3.4 GHz | AMD FX-8350, 4.0 GHz;
			Memoria: 8 GB di RAM;
			Scheda video: NVIDIA GeForce GTX 660 | AMD Radeon HD 7950;
			DirectX: Versione 11;
			Rete: Connessione Internet a banda larga;
			Memoria: 44 GB di spazio disponibile;',
			0,1,0,1,0,0,1,1,1),

			('FIFA 18', '2017-09-29', 'Sport', null, null, 3, null, 'Sei pronto per la più grande stagione di sempre? Grazie al motore Frostbite™, FIFA 18 attenua il confine tra il mondo reale e quello virtuale dando vita a eroi, squadre e atmosfere del gioco più bello del mondo. 
			Crea il tuo Ultimate Team nella modalità più giocata di FIFA scegliendo tra migliaia di calciatori. Scopri i nuovi obiettivi giornalieri, affronta la modalità Squad Battles per ricevere premi settimanali e osserva i migliori giocatori al mondo su Champions Channel!',
			'Minimo:
			SO: Windows 10 - 64-Bit;
			CPU: Intel i3 6300T o equivalente (5,199) - Intel i3 4340 (5,226) e Intel i3 4350 (5,302) in alternativa;
			RAM: 8 GB;
			Spazio libero su disco rigido: 50,0 GB;
			Schede video minime supportate: NVidia GeForce GTX 660 (4,116) 2 GB o equivalente;
			DirectX: 12;
			Raccomandato:
			SO: Windows 10 - 64-Bit;
			CPU: Intel i3 6300T o equivalente (5,199) - Intel i3 4340 (5,226) e Intel i3 4350 (5,302) in alternativa;
			RAM: 8 GB;
			Spazio libero su disco rigido: 50,0 GB;
			Schede video minime supportate: NVIDIA GeForce GTX 670 o AMD Radeon R9 270X;
			DirectX: 12,0.', 1,1,1,1,0,1,1,0,0),

			'Crash Bandicoot: N.Sane Trilogy', '2017-06-30', 'Platform', 'Action', 'Adventure', 7, null, 'Il tuo marsupiale preferito, Crash Bandicoot, è tornato! Più forte e pronto a scatenarsi con N. Sane Trilogy game collection. Ora potrai provare Crash Bandicoot come mai prima d’ora in HD.
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
			Nuovi nemici da sconfiggere, come Big Boss, Uka Uka, N. Tropy, il minaccioso Dingodile e il ritorno di alcuni super famosi come N. Gin and Tiny. Più Azione. Più Divertimento. Più puzzle e livelli segreti.',  0,1,0,0,0,0,0,0,0),

			('Super Mario Odyssey', '2017-10-27', 'Adventure','Action', null, 10, null,'Mario approda su Nintendo Switch con un’avventura 3D senza precedenti! 
			Questo fantastico gioco in stile sandbox – il primo dai tempi degli amatissimi Super Mario 64 del 1996 e Super Mario Sunshine del 2002 – è pieno zeppo di segreti e sorprese! Mario può ora contare su tutta una serie di nuove mosse e abilità, come lanci o salti che sfruttano il cappello. Può persino impossessarsi di personaggi e oggetti, per possibilità di gameplay incredibili e mai sperimentate prima. 
			Questo titolo è il biglietto ufficiale per un’emozionante viaggio, tra mondi incredibili e lontani dal classico Regno dei Funghi!',0,0,0,0,0,1,0,0,0);



















