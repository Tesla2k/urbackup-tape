-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 06. Mrz 2019 um 10:28
-- Server-Version: 5.7.25-0ubuntu0.18.04.2
-- PHP-Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `tape_backup`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `tar_id` int(11) NOT NULL,
  `file` text NOT NULL,
  `changed` timestamp NULL DEFAULT NULL,
  `backuped` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hosts`
--

CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `host` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tapes`
--

CREATE TABLE `tapes` (
  `id` int(11) NOT NULL,
  `SerialNumber` varchar(255) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blocked_till` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tars`
--

CREATE TABLE `tars` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `tape_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tar_id` (`tar_id`);

--
-- Indizes für die Tabelle `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tapes`
--
ALTER TABLE `tapes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tars`
--
ALTER TABLE `tars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tape_id` (`tape_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10037;
--
-- AUTO_INCREMENT für Tabelle `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `tapes`
--
ALTER TABLE `tapes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT für Tabelle `tars`
--
ALTER TABLE `tars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`tar_id`) REFERENCES `tars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tars`
--
ALTER TABLE `tars`
  ADD CONSTRAINT `tars_ibfk_1` FOREIGN KEY (`tape_id`) REFERENCES `tapes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
