#!/bin/bash

BASEDIR=`eval basename $(dirname $PWD)`

if [[ $BASEDIR == 'DB2-123456789' ]] || [[ $BASEDIR == 'DB2-XXXXXXXXX' ]]
then
	echo "Fatal error !! Please rename your directory $BASEDIR to include your student id as per the instructions given with the assignment!"
	exit 1
fi

if ! [[ $BASEDIR =~ DB2-[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] ]]
then
	echo "Fatal error !! Please rename your directory $BASEDIR to include your student id as per the instructions given with the assignment!"
	exit 1
fi

db2 -t -v <<-END 2>&1 | tee setup.log
CONNECT TO cs421;

CREATE TABLE person
(
  pid INTEGER NOT NULL
  ,pname VARCHAR(30) NOT NULL
  ,PRIMARY KEY (pid)
);

CREATE TABLE organization
(
  oid INTEGER NOT NULL
  ,oname VARCHAR(30) NOT NULL
  ,PRIMARY KEY (oid)
);

CREATE TABLE venue
(
  vid INTEGER NOT NULL
  ,area CHAR(1) NOT NULL
  ,capacity INTEGER NOT NULL
  ,PRIMARY KEY (vid)
);

CREATE TABLE calendar
(
  vid INTEGER NOT NULL
  ,date DATE NOT NULL
  ,price NUMERIC(6,2) NOT NULL
  ,PRIMARY KEY(vid,date)
  ,FOREIGN KEY(vid) REFERENCES venue(vid)
);

CREATE TABLE event
(
  eid INTEGER NOT NULL
  ,type VARCHAR(15) NOT NULL
  ,PRIMARY KEY (eid)
);

CREATE TABLE schedule
(
  vid INTEGER NOT NULL
  ,date DATE NOT NULL
  ,eid INTEGER NOT NULL
  ,note VARCHAR(30)
  ,PRIMARY KEY(vid,date)
  ,FOREIGN KEY(eid) REFERENCES event(eid)
  ,FOREIGN KEY(vid,date) REFERENCES calendar(vid,date)
);

CREATE TABLE participate
(
  pid INTEGER NOT NULL
  ,eid INTEGER NOT NULL
  ,PRIMARY KEY (pid,eid)
  ,FOREIGN KEY(pid) REFERENCES person(pid)
  ,FOREIGN KEY(eid) REFERENCES event(eid)
);

CREATE TABLE host
(
  oid INTEGER NOT NULL
  ,eid INTEGER NOT NULL
  ,PRIMARY KEY (oid,eid)
  ,FOREIGN KEY(oid) REFERENCES organization(oid)
  ,FOREIGN KEY(eid) REFERENCES event(eid)
);


INSERT INTO person VALUES(12345678,'Sona Kirk');
INSERT INTO person VALUES(12345679,'Amy Forbes');
INSERT INTO person VALUES(11111111,'Ernest Lawson');
INSERT INTO person VALUES(11111112,'Mary Salazar');
INSERT INTO person VALUES(11111113,'William Park');
INSERT INTO person VALUES(11111114,'Douglas Nam');
INSERT INTO person VALUES(11111115,'Dorothy Nguyen');
INSERT INTO person VALUES(11111116,'Jane Dibbles');
INSERT INTO person VALUES(11111117,'Ronald Mendenhall');
INSERT INTO person VALUES(11111118,'George Hedrick');
INSERT INTO person VALUES(11111119,'David Scott');
INSERT INTO person VALUES(11111120,'Florinda Seltzer');
INSERT INTO person VALUES(11111121,'Anne Cuevas');
INSERT INTO person VALUES(11111122,'Christopher Paradis');
INSERT INTO person VALUES(11111123,'Joseph Almodovar');
INSERT INTO person VALUES(11111124,'Beulah Cocco');
INSERT INTO person VALUES(11111125,'Emma Isbell');
INSERT INTO person VALUES(11111126,'Betty Lynch');
INSERT INTO person VALUES(11111127,'Noemi Johnson');
INSERT INTO person VALUES(11111128,'Stephen Cho');
INSERT INTO person VALUES(11111129,'Curtis Laborde');
INSERT INTO person VALUES(11111130,'Eric Shaw');
INSERT INTO person VALUES(11111131,'Eric Varghese');
INSERT INTO person VALUES(11111132,'Rose Hodgins');
INSERT INTO person VALUES(11111133,'Barbara Sanders');
INSERT INTO person VALUES(11111134,'Virgina Cain');
INSERT INTO person VALUES(11111135,'Martha Byers');
INSERT INTO person VALUES(11111136,'Kurt Sayers');
INSERT INTO person VALUES(11111137,'Carol Crockette');
INSERT INTO person VALUES(11111138,'Thomas Nunez');
INSERT INTO person VALUES(11111139,'Velma Smith');
INSERT INTO person VALUES(11111140,'Bruce Mccoy');
INSERT INTO person VALUES(11111141,'Martha Burton');
INSERT INTO person VALUES(11111142,'Marcia Hudson');
INSERT INTO person VALUES(11111143,'Billie Howard');
INSERT INTO person VALUES(11111144,'Ola Barnes');
INSERT INTO person VALUES(11111145,'Tammie Fackler');
INSERT INTO person VALUES(11111146,'Robert Schaefer');
INSERT INTO person VALUES(11111147,'Helen Cole');
INSERT INTO person VALUES(11111148,'Amy Taylor');
INSERT INTO person VALUES(11111149,'Theresa Ziadie');
INSERT INTO person VALUES(11111150,'Richard Trujillo');
INSERT INTO person VALUES(11111151,'Darlene Botts');
INSERT INTO person VALUES(11111152,'Reva Ragland');
INSERT INTO person VALUES(11111153,'Louis Mcnabb');
INSERT INTO person VALUES(11111154,'Guadalupe Craft');
INSERT INTO person VALUES(11111155,'Miriam Ashley');
INSERT INTO person VALUES(11111156,'Joanne Henson');
INSERT INTO person VALUES(11111157,'Lori Bridges');
INSERT INTO person VALUES(11111158,'Paige Thompson');
INSERT INTO person VALUES(11111159,'Dorothy Tavolario');
INSERT INTO person VALUES(11111160,'Lisa Canada');
INSERT INTO person VALUES(11111161,'Jack Morgan');
INSERT INTO person VALUES(11111162,'Rebecca Scott');
INSERT INTO person VALUES(11111163,'Amanda Hammer');
INSERT INTO person VALUES(11111164,'Alvin Gutierrez');
INSERT INTO person VALUES(11111165,'Diane Cotten');
INSERT INTO person VALUES(11111166,'Serena Huey');
INSERT INTO person VALUES(11111167,'Mary Kelly');
INSERT INTO person VALUES(11111168,'David Donaldson');
INSERT INTO person VALUES(11111169,'Evalyn Lairmore');
INSERT INTO person VALUES(11111170,'Jason Simmons');
INSERT INTO person VALUES(11111171,'Patricia Schaedler');
INSERT INTO person VALUES(11111172,'John Choat');
INSERT INTO person VALUES(11111173,'Diego Magana');
INSERT INTO person VALUES(11111174,'Jessie Pierson');
INSERT INTO person VALUES(11111175,'Calvin Edwards');
INSERT INTO person VALUES(11111176,'Elaine Mosby');
INSERT INTO person VALUES(11111177,'Rebecca Faught');
INSERT INTO person VALUES(11111178,'Barbara Magee');
INSERT INTO person VALUES(11111179,'Kaye Nichols');
INSERT INTO person VALUES(11111180,'Renee Jamieson');
INSERT INTO person VALUES(11111181,'Lino Decaro');
INSERT INTO person VALUES(11111182,'Johnny Horton');
INSERT INTO person VALUES(11111183,'Joel Taylor');
INSERT INTO person VALUES(11111184,'Richard Torres');
INSERT INTO person VALUES(11111185,'Jeffrey Wilenkin');
INSERT INTO person VALUES(11111186,'Deborah Melcher');
INSERT INTO person VALUES(11111187,'Tricia Robinson');
INSERT INTO person VALUES(11111188,'John Clemente');
INSERT INTO person VALUES(11111189,'Teresa Axtell');
INSERT INTO person VALUES(11111190,'Billy Martindale');
INSERT INTO person VALUES(11111191,'Kelvin Baker');
INSERT INTO person VALUES(11111192,'Darren West');
INSERT INTO person VALUES(11111193,'Lorraine Stigers');
INSERT INTO person VALUES(11111194,'Abraham Gow');
INSERT INTO person VALUES(11111195,'John Johnson');
INSERT INTO person VALUES(11111196,'Elvira Schmidtke');
INSERT INTO person VALUES(11111197,'Robert Day');
INSERT INTO person VALUES(11111198,'Maria Anderson');
INSERT INTO person VALUES(11111199,'Dale Sloan');
INSERT INTO person VALUES(11111200,'Jackie Wolfe');
INSERT INTO person VALUES(11111201,'John Smith');
INSERT INTO person VALUES(11111202,'Tom Glover');
INSERT INTO person VALUES(11111203,'Lucius Mayer');
INSERT INTO person VALUES(11111204,'Emma Gilliam');
INSERT INTO person VALUES(11111205,'Barry Warren');
INSERT INTO person VALUES(11111206,'Anne Taylor');
INSERT INTO person VALUES(11111207,'Abel Park');
INSERT INTO person VALUES(11111208,'Sara Klein');
INSERT INTO person VALUES(11111209,'Molly Scart');
INSERT INTO person VALUES(11111210,'Finn Lee');
INSERT INTO person VALUES(11111211,'Francis Siller');
INSERT INTO person VALUES(11111212,'Franklin Diller');
INSERT INTO person VALUES(11111213,'Mira Barham');
INSERT INTO person VALUES(11111214,'Robert Clayton');
INSERT INTO person VALUES(11111215,'Karen Dominion');
INSERT INTO person VALUES(11111216,'Thelma Carter');
INSERT INTO person VALUES(11111217,'Linda Brock');
INSERT INTO person VALUES(11111218,'Staci Heuck');
INSERT INTO person VALUES(11111219,'Marc Mcgee');
INSERT INTO person VALUES(11111220,'Verona Haynes');
INSERT INTO person VALUES(11111221,'Margherita Fries');
INSERT INTO person VALUES(11111222,'Charles Smith');
INSERT INTO person VALUES(11111223,'Donald Saunders');
INSERT INTO person VALUES(11111224,'Richard Haley');
INSERT INTO person VALUES(11111225,'Raymond Morris');
INSERT INTO person VALUES(11111226,'Richard Butler');
INSERT INTO person VALUES(11111227,'Eugene Wolfe');
INSERT INTO person VALUES(11111228,'Christine Weckerly');
INSERT INTO person VALUES(11111229,'Joanne Gonzalez');
INSERT INTO person VALUES(11111230,'Erica Bishop');
INSERT INTO person VALUES(11111231,'Barbara Davila');
INSERT INTO person VALUES(11111232,'Bernard Estrada');
INSERT INTO person VALUES(11111233,'Eric Rios');
INSERT INTO person VALUES(11111234,'Richard Barber');
INSERT INTO person VALUES(11111235,'Annie Petrik');
INSERT INTO person VALUES(11111236,'Elizabeth Hospelhorn');
INSERT INTO person VALUES(11111237,'Peter Montelongo');
INSERT INTO person VALUES(11111238,'Thomas Garcia');
INSERT INTO person VALUES(11111239,'Meredith Shaffer');
INSERT INTO person VALUES(11111240,'Judith Taylor');
INSERT INTO person VALUES(11111241,'Michael Chumley');
INSERT INTO person VALUES(11111242,'Sarah Riccio');
INSERT INTO person VALUES(11111243,'Margaret Swain');
INSERT INTO person VALUES(11111244,'James Hilton');
INSERT INTO person VALUES(11111245,'Trinh Morrow');
INSERT INTO person VALUES(11111246,'Juanita Block');
INSERT INTO person VALUES(11111247,'Roosevelt Moy');
INSERT INTO person VALUES(11111248,'Sandra Ries');
INSERT INTO person VALUES(11111249,'Melvin Brown');



INSERT INTO organization VALUES(1,'A Better Tomorrow');
INSERT INTO organization VALUES(2,'Horizon Entertainment');
INSERT INTO organization VALUES(3,'Stand-up Comedy Club');
INSERT INTO organization VALUES(4,'ABC Inc.');
INSERT INTO organization VALUES(5,'Coding Arts');
INSERT INTO organization VALUES(6,'Red Cross');
INSERT INTO organization VALUES(7,'Photography Club');
INSERT INTO organization VALUES(8,'Student Helpdesk');


INSERT INTO venue VALUES(1,'A',100);
INSERT INTO venue VALUES(2,'A',150);
INSERT INTO venue VALUES(3,'B',50);
INSERT INTO venue VALUES(4,'A',500);
INSERT INTO venue VALUES(5,'B',700);
INSERT INTO venue VALUES(6,'C',50);
INSERT INTO venue VALUES(7,'C',120);
INSERT INTO venue VALUES(8,'C',60);
INSERT INTO venue VALUES(9,'C',50);
INSERT INTO venue VALUES(10,'A',140);
INSERT INTO venue VALUES(11,'B',3000);
INSERT INTO venue VALUES(12,'A',120);
INSERT INTO venue VALUES(13,'B',2800);


INSERT INTO calendar VALUES(1,'2020-01-15',150.00);
INSERT INTO calendar VALUES(1,'2020-01-16',155.00);
INSERT INTO calendar VALUES(1,'2020-01-17',152.50);
INSERT INTO calendar VALUES(1,'2020-01-18',145.00);
INSERT INTO calendar VALUES(1,'2020-01-19',155.00);
INSERT INTO calendar VALUES(2,'2020-01-15',165.00);
INSERT INTO calendar VALUES(2,'2020-01-16',170.00);
INSERT INTO calendar VALUES(2,'2020-01-17',170.00);
INSERT INTO calendar VALUES(2,'2020-01-18',170.50);
INSERT INTO calendar VALUES(2,'2020-01-19',175.50);
INSERT INTO calendar VALUES(3,'2020-01-15',80.00);
INSERT INTO calendar VALUES(3,'2020-01-16',90.00);
INSERT INTO calendar VALUES(3,'2020-01-17',85.25);
INSERT INTO calendar VALUES(3,'2020-01-18',100.70);
INSERT INTO calendar VALUES(3,'2020-01-19',99.99);
INSERT INTO calendar VALUES(4,'2020-01-15',500.00);
INSERT INTO calendar VALUES(4,'2020-01-16',495.75);
INSERT INTO calendar VALUES(4,'2020-01-17',612.00);
INSERT INTO calendar VALUES(4,'2020-01-18',523.00);
INSERT INTO calendar VALUES(4,'2020-01-19',623.00);
INSERT INTO calendar VALUES(5,'2020-01-15',782.99);
INSERT INTO calendar VALUES(5,'2020-01-16',699.99);
INSERT INTO calendar VALUES(5,'2020-01-17',734.99);
INSERT INTO calendar VALUES(5,'2020-01-18',749.99);
INSERT INTO calendar VALUES(5,'2020-01-19',725.99);
INSERT INTO calendar VALUES(6,'2020-01-15',60.00);
INSERT INTO calendar VALUES(6,'2020-01-16',55.75);
INSERT INTO calendar VALUES(6,'2020-01-17',62.15);
INSERT INTO calendar VALUES(6,'2020-01-18',59.99);
INSERT INTO calendar VALUES(6,'2020-01-19',60.00);
INSERT INTO calendar VALUES(7,'2020-01-15',170.23);
INSERT INTO calendar VALUES(7,'2020-01-16',150.00);
INSERT INTO calendar VALUES(7,'2020-01-17',182.25);
INSERT INTO calendar VALUES(7,'2020-01-18',165.30);
INSERT INTO calendar VALUES(7,'2020-01-19',170.00);
INSERT INTO calendar VALUES(8,'2020-01-15',70.00);
INSERT INTO calendar VALUES(8,'2020-01-16',59.25);
INSERT INTO calendar VALUES(8,'2020-01-17',72.25);
INSERT INTO calendar VALUES(8,'2020-01-18',65.00);
INSERT INTO calendar VALUES(8,'2020-01-19',69.99);
INSERT INTO calendar VALUES(9,'2020-01-15',69.99);
INSERT INTO calendar VALUES(9,'2020-01-16',59.99);
INSERT INTO calendar VALUES(9,'2020-01-17',64.99);
INSERT INTO calendar VALUES(9,'2020-01-18',59.99);
INSERT INTO calendar VALUES(9,'2020-01-19',55.25);
INSERT INTO calendar VALUES(10,'2020-01-15',147.34);
INSERT INTO calendar VALUES(10,'2020-01-16',156.25);
INSERT INTO calendar VALUES(10,'2020-01-17',169.99);
INSERT INTO calendar VALUES(10,'2020-01-18',185.00);
INSERT INTO calendar VALUES(10,'2020-01-19',149.99);
INSERT INTO calendar VALUES(11,'2020-01-15',4000.00);
INSERT INTO calendar VALUES(11,'2020-01-16',3950.75);
INSERT INTO calendar VALUES(11,'2020-01-17',5120.00);
INSERT INTO calendar VALUES(11,'2020-01-18',4730.00);
INSERT INTO calendar VALUES(11,'2020-01-19',5190.00);
INSERT INTO calendar VALUES(12,'2020-01-15',179.99);
INSERT INTO calendar VALUES(12,'2020-01-16',188.45);
INSERT INTO calendar VALUES(12,'2020-01-17',156.78);
INSERT INTO calendar VALUES(12,'2020-01-18',187.34);
INSERT INTO calendar VALUES(12,'2020-01-19',180.00);
INSERT INTO calendar VALUES(13,'2020-01-15',4000.00);
INSERT INTO calendar VALUES(13,'2020-01-16',3700.75);
INSERT INTO calendar VALUES(13,'2020-01-17',4519.00);
INSERT INTO calendar VALUES(13,'2020-01-18',4238.50);
INSERT INTO calendar VALUES(13,'2020-01-19',4867.00);


INSERT INTO event VALUES(1,'music');  
INSERT INTO event VALUES(2,'music');         
INSERT INTO event VALUES(3,'fundraising');   
INSERT INTO event VALUES(4,'product launch');  
INSERT INTO event VALUES(5,'fundraising');  
INSERT INTO event VALUES(6,'fundraising');  
INSERT INTO event VALUES(7,'music');  
INSERT INTO event VALUES(8,'contest');         
INSERT INTO event VALUES(9,'comedy show');     
INSERT INTO event VALUES(10,'tutorial');        
INSERT INTO event VALUES(11,'interview');          
INSERT INTO event VALUES(12,'info session');       
INSERT INTO event VALUES(13,'contest');                  
INSERT INTO event VALUES(14,'info session');     
INSERT INTO event VALUES(15,'tutorial');      
INSERT INTO event VALUES(16,'fundraising');         
INSERT INTO event VALUES(17,'info session');                             
INSERT INTO event VALUES(18,'info session');         
INSERT INTO event VALUES(19,'music');              
INSERT INTO event VALUES(20,'comedy show');

INSERT INTO schedule VALUES(11,'2020-01-15',1,NULL);
INSERT INTO schedule VALUES(11,'2020-01-17',2,'Jazz Festival Day 1');
INSERT INTO schedule VALUES(11,'2020-01-18',2,'Jazz Festival Day 2'); 
INSERT INTO schedule VALUES(11,'2020-01-19',2,'Jazz Festival Day 3'); 
INSERT INTO schedule VALUES(6,'2020-01-15',3,'Day 1 Dress code: semi formal');
INSERT INTO schedule VALUES(6,'2020-01-16',3,'Day 2');
INSERT INTO schedule VALUES(8,'2020-01-16',4,'Press conference');
INSERT INTO schedule VALUES(9,'2020-01-17',4,'Open for industry partners');
INSERT INTO schedule VALUES(9,'2020-01-16',5,NULL);
INSERT INTO schedule VALUES(3,'2020-01-17',6,'Red Cross fundraising');
INSERT INTO schedule VALUES(13,'2020-01-15',7,'Country music Day 1');
INSERT INTO schedule VALUES(13,'2020-01-16',7,'Country music Day 2');
INSERT INTO schedule VALUES(6,'2020-01-17',8,'Hackathon Day 1');
INSERT INTO schedule VALUES(6,'2020-01-18',8,'Hackathon Day 2');
INSERT INTO schedule VALUES(6,'2020-01-19',8,'Hackathon Day 3');
INSERT INTO schedule VALUES(1,'2020-01-15',9,'First show');
INSERT INTO schedule VALUES(8,'2020-01-19',10,'C for beginners');
INSERT INTO schedule VALUES(9,'2020-01-19',10,'Advanced C programming');
INSERT INTO schedule VALUES(3,'2020-01-18',11,NULL);        
INSERT INTO schedule VALUES(3,'2020-01-15',12,'Recruit new members');
INSERT INTO schedule VALUES(1,'2020-01-17',13,'Photography contest Day 1');      
INSERT INTO schedule VALUES(1,'2020-01-18',13,'Photography contest Day 2');
INSERT INTO schedule VALUES(1,'2020-01-16',14,NULL); 
INSERT INTO schedule VALUES(9,'2020-01-18',15,'CPR tutorial');  
INSERT INTO schedule VALUES(1,'2020-01-19',16,'Charity auction');       
INSERT INTO schedule VALUES(7,'2020-01-18',17,NULL);               
INSERT INTO schedule VALUES(3,'2020-01-19',18,NULL);           
INSERT INTO schedule VALUES(13,'2020-01-19',19,'Pop music');      
INSERT INTO schedule VALUES(4,'2020-01-18',20,'First night');    
INSERT INTO schedule VALUES(4,'2020-01-19',20,'Second night');    


INSERT INTO participate VALUES(12345678,3);
INSERT INTO participate VALUES(12345678,5);
INSERT INTO participate VALUES(12345678,6);
INSERT INTO participate VALUES(12345678,16);
INSERT INTO participate VALUES(12345679,3);
INSERT INTO participate VALUES(12345679,16);
INSERT INTO participate VALUES(12345678,1);
INSERT INTO participate VALUES(12345678,2);
INSERT INTO participate VALUES(12345678,19);
INSERT INTO participate VALUES(12345679,19);
INSERT INTO participate VALUES(11111111,1);
INSERT INTO participate VALUES(11111112,1);
INSERT INTO participate VALUES(11111113,1);
INSERT INTO participate VALUES(11111114,1);
INSERT INTO participate VALUES(11111116,2);
INSERT INTO participate VALUES(11111117,2);
INSERT INTO participate VALUES(11111118,2);
INSERT INTO participate VALUES(11111119,2);
INSERT INTO participate VALUES(11111120,2);
INSERT INTO participate VALUES(11111121,3);
INSERT INTO participate VALUES(11111122,3);
INSERT INTO participate VALUES(11111123,3);
INSERT INTO participate VALUES(11111126,4);
INSERT INTO participate VALUES(11111127,4);
INSERT INTO participate VALUES(11111128,4);
INSERT INTO participate VALUES(11111129,4);
INSERT INTO participate VALUES(11111130,4);
INSERT INTO participate VALUES(11111132,5);
INSERT INTO participate VALUES(11111133,5);
INSERT INTO participate VALUES(11111135,5);
INSERT INTO participate VALUES(11111136,5);
INSERT INTO participate VALUES(11111137,6);
INSERT INTO participate VALUES(11111138,6);
INSERT INTO participate VALUES(11111139,6);
INSERT INTO participate VALUES(11111142,7);
INSERT INTO participate VALUES(11111143,7);
INSERT INTO participate VALUES(11111144,7);
INSERT INTO participate VALUES(11111145,7);
INSERT INTO participate VALUES(11111146,7);
INSERT INTO participate VALUES(11111147,8);
INSERT INTO participate VALUES(11111148,8);
INSERT INTO participate VALUES(11111149,8);
INSERT INTO participate VALUES(11111150,8);
INSERT INTO participate VALUES(11111151,8);
INSERT INTO participate VALUES(11111152,8);
INSERT INTO participate VALUES(11111153,9);
INSERT INTO participate VALUES(11111154,9);
INSERT INTO participate VALUES(11111155,9);
INSERT INTO participate VALUES(11111156,9);
INSERT INTO participate VALUES(11111157,9);
INSERT INTO participate VALUES(11111158,10);
INSERT INTO participate VALUES(11111159,10);
INSERT INTO participate VALUES(11111160,10);
INSERT INTO participate VALUES(11111161,10);
INSERT INTO participate VALUES(11111162,10);
INSERT INTO participate VALUES(11111163,10);
INSERT INTO participate VALUES(11111164,11);
INSERT INTO participate VALUES(11111165,11);
INSERT INTO participate VALUES(11111166,11);
INSERT INTO participate VALUES(11111167,11);
INSERT INTO participate VALUES(11111168,11);
INSERT INTO participate VALUES(11111169,11);
INSERT INTO participate VALUES(11111170,12);
INSERT INTO participate VALUES(11111171,12);
INSERT INTO participate VALUES(11111172,12);
INSERT INTO participate VALUES(11111173,12);
INSERT INTO participate VALUES(11111174,12);
INSERT INTO participate VALUES(11111175,13);
INSERT INTO participate VALUES(11111176,13);
INSERT INTO participate VALUES(11111177,13);
INSERT INTO participate VALUES(11111178,13);
INSERT INTO participate VALUES(11111179,13);
INSERT INTO participate VALUES(11111180,14);
INSERT INTO participate VALUES(11111181,14);
INSERT INTO participate VALUES(11111182,14);
INSERT INTO participate VALUES(11111183,14);
INSERT INTO participate VALUES(11111184,14);
INSERT INTO participate VALUES(11111185,14);
INSERT INTO participate VALUES(11111186,15);
INSERT INTO participate VALUES(11111187,15);
INSERT INTO participate VALUES(11111188,15);
INSERT INTO participate VALUES(11111189,15);
INSERT INTO participate VALUES(11111190,15);
INSERT INTO participate VALUES(11111191,16);
INSERT INTO participate VALUES(11111192,16);
INSERT INTO participate VALUES(11111193,16);
INSERT INTO participate VALUES(11111194,16);
INSERT INTO participate VALUES(11111195,16);
INSERT INTO participate VALUES(11111196,17);
INSERT INTO participate VALUES(11111197,17);
INSERT INTO participate VALUES(11111198,17);
INSERT INTO participate VALUES(11111199,17);
INSERT INTO participate VALUES(11111200,17);
INSERT INTO participate VALUES(11111201,17);
INSERT INTO participate VALUES(11111202,18);
INSERT INTO participate VALUES(11111203,18);
INSERT INTO participate VALUES(11111204,18);
INSERT INTO participate VALUES(11111205,18);
INSERT INTO participate VALUES(11111206,18);
INSERT INTO participate VALUES(11111207,18);
INSERT INTO participate VALUES(11111208,19);
INSERT INTO participate VALUES(11111210,19);
INSERT INTO participate VALUES(11111211,19);
INSERT INTO participate VALUES(11111213,20);
INSERT INTO participate VALUES(11111214,20);
INSERT INTO participate VALUES(11111215,20);
INSERT INTO participate VALUES(11111216,20);
INSERT INTO participate VALUES(11111217,20);
INSERT INTO participate VALUES(11111220,3);
INSERT INTO participate VALUES(11111221,3);
INSERT INTO participate VALUES(11111222,3);
INSERT INTO participate VALUES(11111223,3);
INSERT INTO participate VALUES(11111224,3);
INSERT INTO participate VALUES(11111225,5);
INSERT INTO participate VALUES(11111228,6);
INSERT INTO participate VALUES(11111229,6);
INSERT INTO participate VALUES(11111230,6);
INSERT INTO participate VALUES(11111231,16);


INSERT INTO host VALUES(2,1);
INSERT INTO host VALUES(2,2);
INSERT INTO host VALUES(1,3);
INSERT INTO host VALUES(6,3);
INSERT INTO host VALUES(4,4);
INSERT INTO host VALUES(6,5);
INSERT INTO host VALUES(1,6);  
INSERT INTO host VALUES(2,7);
INSERT INTO host VALUES(5,8);
INSERT INTO host VALUES(3,9);
INSERT INTO host VALUES(5,10);
INSERT INTO host VALUES(4,11);
INSERT INTO host VALUES(7,12);
INSERT INTO host VALUES(7,13);           
INSERT INTO host VALUES(1,14);
INSERT INTO host VALUES(6,15);
INSERT INTO host VALUES(6,16);
INSERT INTO host VALUES(7,16);
INSERT INTO host VALUES(8,17); 
INSERT INTO host VALUES(1,18); 
INSERT INTO host VALUES(2,19);
INSERT INTO host VALUES(4,19);  
INSERT INTO host VALUES(3,20);

QUIT;
END
