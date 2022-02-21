-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Nov 28. 19:58
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `orarend`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orarend`
--

CREATE TABLE `orarend` (
  `id` int(11) NOT NULL,
  `osztaly_id` int(11) DEFAULT NULL,
  `terem_id` int(11) DEFAULT NULL,
  `tantargy_id` int(11) DEFAULT NULL,
  `nap` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `kezdes` time NOT NULL,
  `vege` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orarend`
--

INSERT INTO `orarend` (`id`, `osztaly_id`, `terem_id`, `tantargy_id`, `nap`, `kezdes`, `vege`) VALUES
(1, 1, 17, 2, 'Hétfő', '08:00:00', '09:00:00'),
(2, 1, 1, 3, 'Hétfő', '09:00:00', '10:00:00'),
(3, 1, 2, 4, 'Hétfő', '10:00:00', '11:00:00'),
(4, 1, 3, 14, 'Hétfő', '11:00:00', '12:00:00'),
(5, 1, 19, 15, 'Kedd', '08:00:00', '09:00:00'),
(6, 1, 4, 8, 'Kedd', '09:00:00', '10:00:00'),
(7, 1, 5, 11, 'Kedd', '10:00:00', '11:00:00'),
(8, 1, 6, 7, 'Kedd', '11:00:00', '12:00:00'),
(9, 1, 7, 3, 'Szerda', '08:00:00', '09:00:00'),
(10, 1, 8, 12, 'Szerda', '09:00:00', '10:00:00'),
(11, 1, 17, 2, 'Szerda', '10:00:00', '11:00:00'),
(12, 1, 9, 4, 'Szerda', '11:00:00', '12:00:00'),
(13, 2, 7, 3, 'Csütörtök', '08:00:00', '09:00:00'),
(14, 2, 8, 12, 'Csütörtök', '09:00:00', '10:00:00'),
(15, 2, 17, 2, 'Csütörtök', '10:00:00', '11:00:00'),
(16, 2, 9, 4, 'Csütörtök', '11:00:00', '12:00:00'),
(17, 2, 19, 15, 'Péntek', '08:00:00', '09:00:00'),
(18, 2, 4, 8, 'Péntek', '09:00:00', '10:00:00'),
(19, 2, 5, 11, 'Péntek', '10:00:00', '11:00:00'),
(20, 2, 6, 7, 'Péntek', '11:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztalyok`
--

CREATE TABLE `osztalyok` (
  `id` int(11) NOT NULL,
  `evfolyam` int(11) NOT NULL,
  `jeloles` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `letszam` int(11) NOT NULL,
  `kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `osztalyok`
--

INSERT INTO `osztalyok` (`id`, `evfolyam`, `jeloles`, `letszam`, `kep`) VALUES
(1, 1, 'a', 2, '1a.jpg'),
(2, 1, 'b', 2, '1b.jpg'),
(3, 2, 'a', 2, '2a.jpg'),
(4, 2, 'b', 2, '2b.jpg'),
(5, 3, 'a', 2, '3a.png'),
(6, 3, 'b', 2, '3b.png'),
(7, 4, 'a', 2, '4a.png'),
(8, 4, 'b', 2, '4b.jpg'),
(9, 5, 'a', 2, '5a.png'),
(10, 5, 'b', 2, '5b.jpg'),
(11, 6, 'a', 2, '6a.jpg'),
(12, 6, 'b', 2, '6b.jpg'),
(13, 7, 'a', 2, '7a.png'),
(14, 7, 'b', 2, '7b.jpg'),
(15, 8, 'a', 2, '8a.png'),
(16, 8, 'b', 2, '8b.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanarok`
--

CREATE TABLE `tanarok` (
  `id` int(11) NOT NULL,
  `vezeteknev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `keresztnev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `telefonszam` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szulido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanarok`
--

INSERT INTO `tanarok` (`id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES
(1, 'Kecskés', 'Márton', '06309876543', '1979-11-04'),
(2, 'Rózsa', 'Elemér', '06201873523', '1969-05-04'),
(3, 'Szerencsétlen', 'Attila', '06701773323', '1965-03-14'),
(4, 'Gazdag', 'Erzsébet', '06301713323', '1967-04-22'),
(5, 'Gerencsér', 'Márk', '06301379123', '1980-06-23'),
(6, 'Kerékgyártó', 'Vanessza', '06309938123', '1972-12-12'),
(7, 'Huan', 'Than', '06202748393', '1984-10-11'),
(8, 'Bán', 'János', '06202849393', '1980-10-11'),
(9, 'Mercsó', 'Gárk', '06306666666', '1960-04-29'),
(10, 'Kecskeméti', 'József', '06309999999', '1971-09-09');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanarokorai`
--

CREATE TABLE `tanarokorai` (
  `id` int(11) NOT NULL,
  `tanar_id` int(11) DEFAULT NULL,
  `tantargy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanarokorai`
--

INSERT INTO `tanarokorai` (`id`, `tanar_id`, `tantargy_id`) VALUES
(1, 1, 6),
(2, 2, 1),
(3, 2, 2),
(4, 3, 3),
(5, 3, 4),
(6, 4, 5),
(7, 4, 7),
(8, 5, 9),
(9, 5, 10),
(10, 6, 11),
(11, 6, 12),
(12, 7, 13),
(13, 7, 14),
(14, 8, 15),
(15, 8, 1),
(16, 9, 2),
(17, 9, 3),
(18, 10, 4),
(19, 10, 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tantargyak`
--

CREATE TABLE `tantargyak` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tantargyak`
--

INSERT INTO `tantargyak` (`id`, `nev`) VALUES
(1, 'Matematika'),
(2, 'Magyar nyelv és irodalom'),
(3, 'Történelem'),
(4, 'Kémia'),
(5, 'Fizika'),
(6, 'Biológia'),
(7, 'Természet isemeret'),
(8, 'Testnevelés'),
(9, 'Informatika'),
(10, 'Rajz és kultúra'),
(11, 'Ének'),
(12, 'Technika'),
(13, 'Földrajz'),
(14, 'Hit- és erkölcstan'),
(15, 'Úszás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanulok`
--

CREATE TABLE `tanulok` (
  `id` int(11) NOT NULL,
  `osztaly_id` int(11) DEFAULT NULL,
  `vezeteknev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `keresztnev` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `telefonszam` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szulido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanulok`
--

INSERT INTO `tanulok` (`id`, `osztaly_id`, `vezeteknev`, `keresztnev`, `telefonszam`, `szulido`) VALUES
(1, 1, 'Fehér', 'Erik', '06304050601', '2001-12-19'),
(2, 1, 'Horváth-Czinger', 'Bernadett', '06209998833', '2002-03-25'),
(3, 2, 'Patai', 'Zsolt', '06701234567', '2001-08-10'),
(4, 2, 'Szerencsés', 'Attila', '06307654321', '2001-06-01'),
(5, 3, 'Vincze', 'Ádám', '06301234321', '2000-03-12'),
(6, 3, 'Simon', 'Péter', '06304321123', '2000-08-03'),
(7, 4, 'Leskó', 'Péter', '06301234123', '2000-04-13'),
(8, 4, 'Szentgyörgyhegyi', 'Roland', '06201231234', '2000-05-12'),
(9, 5, 'Wolf', 'Levente', '06709877895', '1999-02-28'),
(10, 5, 'Kreidli', 'Ádám', '06301234528', '1999-03-30'),
(11, 6, 'Mitykó', 'Norbi', '06206765474', '1999-03-12'),
(12, 6, 'Martincsek', 'Levente', '06301346134', '1999-05-19'),
(13, 7, 'Sajti', 'Martin', '06202134124', '1998-02-13'),
(14, 7, 'Molnár', 'Ádám', '06303763573', '1998-01-14'),
(15, 8, 'Gatyás', 'Dániel', '06303456346', '1998-06-06'),
(16, 8, 'Gedai', 'Csanád', '06301235652', '1998-01-01'),
(17, 9, 'Tóth', 'György', '06203467887', '1997-09-17'),
(18, 9, 'Ördög', 'Csaba', '06706348464', '1997-02-02'),
(19, 10, 'Ecsegi', 'Péter', '06207252839', '1997-02-02'),
(20, 10, 'Berta', 'Virág', '06308236523', '1997-01-02'),
(21, 11, 'Faragó', 'Ákos', '06203655363', '1996-05-12'),
(22, 11, 'Hörömpő', 'Márk', '06308758456', '1996-03-21'),
(23, 12, 'Oncsik', 'János', '06701234531', '1996-08-29'),
(24, 12, 'Hörömpő', 'Márk', '06201247689', '1996-11-02'),
(25, 13, 'Gál', 'Erzsébet', '06201324686', '1995-11-24'),
(26, 13, 'Plesa', 'Tamás', '06305982253', '1995-12-31'),
(27, 14, 'Bogdán', 'Luca', '06704522563', '1995-12-07'),
(28, 14, 'Mészáros', 'András', '06205243167', '1995-12-24'),
(29, 15, 'Pászti', 'Zsolt', '06201354453', '1994-01-23'),
(30, 15, 'F', 'Misi', '06307442345', '1994-03-12'),
(31, 16, 'Kardos', 'Péter', '06206354317', '1994-04-03'),
(32, 16, 'Kósi', 'Liza', '06306537834', '1994-07-21');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `id` int(11) NOT NULL,
  `epulet` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `szam` int(11) NOT NULL,
  `nev` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`id`, `epulet`, `szam`, `nev`) VALUES
(1, 'A', 110, 'A terem'),
(2, 'A', 111, 'Az terem'),
(3, 'A', 112, 'Erika néni terme'),
(4, 'A', 120, 'Olcsi bácsi legeltetője'),
(5, 'A', 121, 'Kemence'),
(6, 'A', 122, 'Katolikus terem'),
(7, 'A', 123, 'Rajz terem'),
(8, 'A', 124, 'Kemény terem'),
(9, 'A', 124, 'Udvar'),
(10, 'B', 210, 'Félvér terem'),
(11, 'B', 211, 'Sekrestyés terem'),
(12, 'B', 212, 'Hmm terem'),
(13, 'B', 213, 'Tudoood terem'),
(14, 'B', 214, 'Helo terem'),
(15, 'B', 220, 'Büdi terem'),
(16, 'B', 221, 'Kémkedő terem'),
(17, 'B', 222, 'Tesi terem'),
(18, 'B', 223, 'Börtön terem'),
(19, 'B', 224, 'Uszoda');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `orarend`
--
ALTER TABLE `orarend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Oosztalyid` (`osztaly_id`),
  ADD KEY `teremid` (`terem_id`),
  ADD KEY `Otantargyid` (`tantargy_id`);

--
-- A tábla indexei `osztalyok`
--
ALTER TABLE `osztalyok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tanarok`
--
ALTER TABLE `tanarok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tanarokorai`
--
ALTER TABLE `tanarokorai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanarid` (`tanar_id`),
  ADD KEY `tantargyid` (`tantargy_id`);

--
-- A tábla indexei `tantargyak`
--
ALTER TABLE `tantargyak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tanulok`
--
ALTER TABLE `tanulok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `osztalyid` (`osztaly_id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `orarend`
--
ALTER TABLE `orarend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `osztalyok`
--
ALTER TABLE `osztalyok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT a táblához `tanarok`
--
ALTER TABLE `tanarok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `tanarokorai`
--
ALTER TABLE `tanarokorai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `tantargyak`
--
ALTER TABLE `tantargyak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `tanulok`
--
ALTER TABLE `tanulok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `orarend`
--
ALTER TABLE `orarend`
  ADD CONSTRAINT `Oosztalyid` FOREIGN KEY (`osztaly_id`) REFERENCES `osztalyok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Otantargyid` FOREIGN KEY (`tantargy_id`) REFERENCES `tanarokorai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teremid` FOREIGN KEY (`terem_id`) REFERENCES `termek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `tanarokorai`
--
ALTER TABLE `tanarokorai`
  ADD CONSTRAINT `tanarid` FOREIGN KEY (`tanar_id`) REFERENCES `tanarok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tantargyid` FOREIGN KEY (`tantargy_id`) REFERENCES `tantargyak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `tanulok`
--
ALTER TABLE `tanulok`
  ADD CONSTRAINT `osztalyid` FOREIGN KEY (`osztaly_id`) REFERENCES `osztalyok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
