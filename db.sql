CREATE TABLE Osztalyok(
	id INT PRIMARY KEY AUTO_INCREMENT,
	evfolyam INT NOT NULL,
	jeloles VARCHAR(10) NOT NULL,
	letszam INT NOT NULL,
	kep varchar(255) NOT NULL
);

CREATE TABLE Tantargyak(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nev VARCHAR(255) NOT NULL
);

CREATE TABLE Termek(
	id INT PRIMARY KEY AUTO_INCREMENT,
	epulet VARCHAR(255) NOT NULL,
	szam INT NOT NULL,
	nev VARCHAR(255)
);

CREATE TABLE Tanulok(
	id INT PRIMARY KEY AUTO_INCREMENT,
	osztaly_id INT,
	vezeteknev VARCHAR(255) NOT NULL,
	keresztnev VARCHAR(255) NOT NULL,
	telefonszam VARCHAR(255) NOT NULL,
	szulido DATE NOT NULL,
	CONSTRAINT osztalyid 
		FOREIGN KEY (osztaly_id) 
		REFERENCES Osztalyok(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tanarok(
	id INT PRIMARY KEY AUTO_INCREMENT,
	vezeteknev VARCHAR(255) NOT NULL,
	keresztnev VARCHAR(255) NOT NULL,
	telefonszam VARCHAR(255) NOT NULL,
	szulido DATE NOT NULL
);

CREATE TABLE TanarokOrai(
	id INT PRIMARY KEY AUTO_INCREMENT,
	tanar_id INT,
	tantargy_id INT,
	CONSTRAINT tanarid 
		FOREIGN KEY (tanar_id) 
		REFERENCES Tanarok(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT tantargyid 
		FOREIGN KEY (tantargy_id) 
		REFERENCES Tantargyak(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Orarend(
	id INT PRIMARY KEY AUTO_INCREMENT,
	osztaly_id INT,
	terem_id INT,
	tantargy_id INT,
	nap VARCHAR(255),
	kezdes Time NOT NULL,
	vege Time NOT NULL,
	CONSTRAINT Oosztalyid 
		FOREIGN KEY (osztaly_id) 
		REFERENCES Osztalyok(id) 
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT teremid 
		FOREIGN KEY (terem_id) 
		REFERENCES Termek(id) 
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT Otantargyid 
		FOREIGN KEY (tantargy_id) 
		REFERENCES TanarokOrai(id) 
		ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '1', 'a', '2', '1a.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '1', 'b', '2', '1b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '2', 'a', '2', '2a.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '2', 'b', '2', '2b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '3', 'a', '2', '3a.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '3', 'b', '2', '3b.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '4', 'a', '2', '4a.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '4', 'b', '2', '4b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '5', 'a', '2', '5a.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '5', 'b', '2', '5b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '6', 'a', '2', '6a.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '6', 'b', '2', '6b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '7', 'a', '2', '7a.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '7', 'b', '2', '7b.jpg');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '8', 'a', '2', '8a.png');
INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES (NULL, '8', 'b', '2', '8b.png');



INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Kecsk??s', 'M??rton', '06309876543', '1979.11.04');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'R??zsa', 'Elem??r', '06201873523', '1969.05.04');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Szerencs??tlen', 'Attila', '06701773323', '1965.03.14');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Gazdag', 'Erzs??bet', '06301713323', '1967.04.22');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Gerencs??r', 'M??rk', '06301379123', '1980.06.23');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Ker??kgy??rt??', 'Vanessza', '06309938123', '1972.12.12');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Huan', 'Than', '06202748393', '1984.10.11');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'B??n', 'J??nos', '06202849393', '1980.10.11');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Mercs??', 'G??rk', '06306666666', '1960.04.29');
INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, 'Kecskem??ti', 'J??zsef', '06309999999', '1971.09.09');


INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '1', 'Feh??r', 'Erik', '06304050601', '2001.12.19');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '1', 'Horv??th-Czinger', 'Bernadett', '06209998833', '2002.03.25');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '2', 'Patai', 'Zsolt', '06701234567', '2001.08.10');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '2', 'Szerencs??s', 'Attila', '06307654321', '2001.06.01');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '3', 'Vincze', '??d??m', '06301234321', '2000.03.12');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '3', 'Simon', 'P??ter', '06304321123', '2000.08.03');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '4', 'Lesk??', 'P??ter', '06301234123', '2000.04.13');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '4', 'Szentgy??rgyhegyi', 'Roland', '06201231234', '2000.05.12');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '5', 'Wolf', 'Levente', '06709877895', '1999.02.28');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '5', 'Kreidli', '??d??m', '06301234528', '1999.03.30');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '6', 'Mityk??', 'Norbi', '06206765474', '1999.03.12');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '6', 'Martincsek', 'Levente', '06301346134', '1999.05.19');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '7', 'Sajti', 'Martin', '06202134124', '1998.02.13');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '7', 'Moln??r', '??d??m', '06303763573', '1998.01.14');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '8', 'Gaty??s', 'D??niel', '06303456346', '1998.06.06');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '8', 'Gedai', 'Csan??d', '06301235652', '1998.01.01');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '9', 'T??th', 'Gy??rgy', '06203467887', '1997.09.17');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '9', '??rd??g', 'Csaba', '06706348464', '1997.02.02');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '10', 'Ecsegi', 'P??ter', '06207252839', '1997.02.02');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '10', 'Berta', 'Vir??g', '06308236523', '1997.01.02');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '11', 'Farag??', '??kos', '06203655363', '1996.05.12');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '11', 'H??r??mp??', 'M??rk', '06308758456', '1996.03.21');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '12', 'Oncsik', 'J??nos', '06701234531', '1996.08.29');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '12', 'H??r??mp??', 'M??rk', '06201247689', '1996.11.02');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '13', 'G??l', 'Erzs??bet', '06201324686', '1995.11.24');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '13', 'Plesa', 'Tam??s', '06305982253', '1995.12.31');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '14', 'Bogd??n', 'Luca', '06704522563', '1995.12.07');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '14', 'M??sz??ros', 'Andr??s', '06205243167', '1995.12.24');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '15', 'P??szti', 'Zsolt', '06201354453', '1994.01.23');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '15', 'F', 'Misi', '06307442345', '1994.03.12');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '16', 'Kardos', 'P??ter', '06206354317', '1994.04.03');
INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES (NULL, '16', 'K??si', 'Liza', '06306537834', '1994.07.21');


INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Matematika');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Magyar nyelv ??s irodalom');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'T??rt??nelem');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'K??mia');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Fizika');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Biol??gia');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Term??szet isemeret');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Testnevel??s');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Informatika');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Rajz ??s kult??ra');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, '??nek');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Technika');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'F??ldrajz');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, 'Hit- ??s erk??lcstan');
INSERT INTO `tantargyak` (`id`, `nev`) VALUES (NULL, '??sz??s');


INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '110', 'A terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '111', 'Az terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '112', 'Erika n??ni terme');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '120', 'Olcsi b??csi legeltet??je');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '121', 'Kemence');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '122', 'Katolikus terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '123', 'Rajz terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '124', 'Kem??ny terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'A', '124', 'Udvar');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '210', 'F??lv??r terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '211', 'Sekresty??s terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '212', 'Hmm terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '213', 'Tudoood terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '214', 'Helo terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '220', 'B??di terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '221', 'K??mked?? terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '222', 'Tesi terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '223', 'B??rt??n terem');
INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES (NULL, 'B', '224', 'Uszoda');


INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '1', '6');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '2', '1');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '2', '2');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '3', '3');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '3', '4');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '4', '5');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '4', '7');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '5', '9');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '5', '10');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '6', '11');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '6', '12');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '7', '13');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '7', '14');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '8', '15');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '8', '1');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '9', '2');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '9', '3');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '10', '4');
INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES (NULL, '10', '5');


INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '17', '2', 'H??tf??', '8:00:00', '9:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '1', '3', 'H??tf??', '9:00:00', '10:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '2', '4', 'H??tf??', '10:00:00', '11:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '3', '14', 'H??tf??', '11:00:00', '12:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '19', '15', 'Kedd', '8:00:00', '9:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '4', '8', 'Kedd', '9:00:00', '10:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '5', '11', 'Kedd', '10:00:00', '11:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '6', '7', 'Kedd', '11:00:00', '12:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '7', '3', 'Szerda', '8:00:00', '9:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '8', '12', 'Szerda', '9:00:00', '10:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '17', '2', 'Szerda', '10:00:00', '11:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '1', '9', '4', 'Szerda', '11:00:00', '12:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '7', '3', 'Cs??t??rt??k', '8:00:00', '9:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '8', '12', 'Cs??t??rt??k', '9:00:00', '10:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '17', '2', 'Cs??t??rt??k', '10:00:00', '11:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '9', '4', 'Cs??t??rt??k', '11:00:00', '12:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '19', '15', 'P??ntek', '8:00:00', '9:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '4', '8', 'P??ntek', '9:00:00', '10:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '5', '11', 'P??ntek', '10:00:00', '11:00:00');
INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES (NULL, '2', '6', '7', 'P??ntek', '11:00:00', '12:00:00');