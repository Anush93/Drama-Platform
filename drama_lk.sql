-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2017 at 07:30 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drama.lk`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `personId` varchar(50) NOT NULL,
  `actorId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actor_has_drama`
--

CREATE TABLE `actor_has_drama` (
  `personId` varchar(50) NOT NULL,
  `dramaId` varchar(20) NOT NULL,
  `role` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `creation_itemId` varchar(50) NOT NULL,
  `newTrend_itemId` varchar(50) NOT NULL,
  `personId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `costumedesigner`
--

CREATE TABLE `costumedesigner` (
  `personId` varchar(50) NOT NULL,
  `costumeDesignerId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `creation`
--

CREATE TABLE `creation` (
  `itemId` varchar(50) NOT NULL,
  `personId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `personId` varchar(50) NOT NULL,
  `directorId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drama`
--

CREATE TABLE `drama` (
  `dramaId` varchar(20) NOT NULL,
  `dramaName` varchar(255) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `director_personId` varchar(50) DEFAULT NULL,
  `lightningDirector_personId` varchar(50) DEFAULT NULL,
  `scriptWriter_personId` varchar(50) DEFAULT NULL,
  `makeupArtist_personId` varchar(50) DEFAULT NULL,
  `stageManager_personId` varchar(50) DEFAULT NULL,
  `costumeDesigner_personId` varchar(50) DEFAULT NULL,
  `musicDirector_personId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drama_has_venue`
--

CREATE TABLE `drama_has_venue` (
  `dramaId` varchar(20) NOT NULL,
  `venueId` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `organiser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_has_venue`
--

CREATE TABLE `event_has_venue` (
  `eventId` varchar(20) NOT NULL,
  `venueId` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imagegallery`
--

CREATE TABLE `imagegallery` (
  `imageId` varchar(20) NOT NULL,
  `venueId` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemId` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lightningdirector`
--

CREATE TABLE `lightningdirector` (
  `personId` varchar(50) NOT NULL,
  `lightningDirectorId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `makeupartist`
--

CREATE TABLE `makeupartist` (
  `personId` varchar(50) NOT NULL,
  `makeupArtistId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musicdirector`
--

CREATE TABLE `musicdirector` (
  `personId` varchar(50) NOT NULL,
  `musicDirectorId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `itemId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newtrend`
--

CREATE TABLE `newtrend` (
  `itemId` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personId` varchar(50) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personcontact`
--

CREATE TABLE `personcontact` (
  `personId` varchar(50) NOT NULL,
  `contactNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_rate_tutorial`
--

CREATE TABLE `person_rate_tutorial` (
  `itemId` varchar(50) NOT NULL,
  `personId` varchar(50) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `personId` varchar(50) NOT NULL,
  `producerId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `producer_has_drama`
--

CREATE TABLE `producer_has_drama` (
  `personId` varchar(50) NOT NULL,
  `dramaId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rentitem`
--

CREATE TABLE `rentitem` (
  `rentId` varchar(20) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scriptwriter`
--

CREATE TABLE `scriptwriter` (
  `personId` varchar(50) NOT NULL,
  `scriptWriterId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stagemanager`
--

CREATE TABLE `stagemanager` (
  `personId` varchar(50) NOT NULL,
  `stageManagerId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE `tutorial` (
  `itemId` varchar(50) NOT NULL,
  `rateAverage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutorship`
--

CREATE TABLE `tutorship` (
  `tutorshipId` varchar(20) NOT NULL,
  `requestPersonId` varchar(50) NOT NULL,
  `acceptPersonId` varchar(50) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `requestDate` date NOT NULL,
  `requestTime` time NOT NULL,
  `grantDate` date DEFAULT NULL,
  `grantTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venueId` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venuecontacts`
--

CREATE TABLE `venuecontacts` (
  `venueId` varchar(20) NOT NULL,
  `contactNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `actorId_UNIQUE` (`actorId`);

--
-- Indexes for table `actor_has_drama`
--
ALTER TABLE `actor_has_drama`
  ADD PRIMARY KEY (`personId`,`dramaId`),
  ADD KEY `fk_actor_has_drama_drama1` (`dramaId`),
  ADD KEY `fk_actor_has_drama_actor1` (`personId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentId`),
  ADD UNIQUE KEY `creation_itemId_UNIQUE` (`creation_itemId`),
  ADD UNIQUE KEY `newTrend_itemId_UNIQUE` (`newTrend_itemId`),
  ADD UNIQUE KEY `person_personId_UNIQUE` (`personId`),
  ADD KEY `fk_comment_creation1` (`creation_itemId`),
  ADD KEY `fk_comment_newTrend1` (`newTrend_itemId`),
  ADD KEY `fk_comment_person1` (`personId`);

--
-- Indexes for table `costumedesigner`
--
ALTER TABLE `costumedesigner`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `costumeDesignerId_UNIQUE` (`costumeDesignerId`);

--
-- Indexes for table `creation`
--
ALTER TABLE `creation`
  ADD PRIMARY KEY (`itemId`),
  ADD UNIQUE KEY `personId_UNIQUE` (`personId`),
  ADD KEY `fk_creation_item1` (`itemId`),
  ADD KEY `fk_creation_person1` (`personId`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `directorId_UNIQUE` (`directorId`),
  ADD KEY `fk_Director_person` (`personId`);

--
-- Indexes for table `drama`
--
ALTER TABLE `drama`
  ADD PRIMARY KEY (`dramaId`),
  ADD UNIQUE KEY `director_personId_UNIQUE` (`director_personId`),
  ADD UNIQUE KEY `lightningDirector_personId_UNIQUE` (`lightningDirector_personId`),
  ADD UNIQUE KEY `scriptWriter_personId_UNIQUE` (`scriptWriter_personId`),
  ADD UNIQUE KEY `makeupArtist_personId_UNIQUE` (`makeupArtist_personId`),
  ADD UNIQUE KEY `stageManager_personId_UNIQUE` (`stageManager_personId`),
  ADD UNIQUE KEY `costumeDesigner_personId_UNIQUE` (`costumeDesigner_personId`),
  ADD UNIQUE KEY `musicDirector_personId_UNIQUE` (`musicDirector_personId`),
  ADD KEY `fk_drama_director1` (`director_personId`),
  ADD KEY `fk_drama_lightningDirector1` (`lightningDirector_personId`),
  ADD KEY `fk_drama_scriptWriter1` (`scriptWriter_personId`),
  ADD KEY `fk_drama_makeupArtist1` (`makeupArtist_personId`),
  ADD KEY `fk_drama_stageManager1` (`stageManager_personId`),
  ADD KEY `fk_drama_costumeDesigner1` (`costumeDesigner_personId`),
  ADD KEY `fk_drama_musicDirector1` (`musicDirector_personId`);

--
-- Indexes for table `drama_has_venue`
--
ALTER TABLE `drama_has_venue`
  ADD PRIMARY KEY (`dramaId`,`venueId`),
  ADD KEY `fk_drama_has_venue_venue1` (`venueId`),
  ADD KEY `fk_drama_has_venue_drama1` (`dramaId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventId`);

--
-- Indexes for table `event_has_venue`
--
ALTER TABLE `event_has_venue`
  ADD PRIMARY KEY (`eventId`,`venueId`),
  ADD KEY `fk_event_has_venue_venue1` (`venueId`),
  ADD KEY `fk_event_has_venue_event1` (`eventId`);

--
-- Indexes for table `imagegallery`
--
ALTER TABLE `imagegallery`
  ADD PRIMARY KEY (`imageId`),
  ADD UNIQUE KEY `venueId_UNIQUE` (`venueId`),
  ADD KEY `fk_imageGallery_venue1` (`venueId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `lightningdirector`
--
ALTER TABLE `lightningdirector`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `lightningDirectorId_UNIQUE` (`lightningDirectorId`);

--
-- Indexes for table `makeupartist`
--
ALTER TABLE `makeupartist`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `makeupArtistId_UNIQUE` (`makeupArtistId`);

--
-- Indexes for table `musicdirector`
--
ALTER TABLE `musicdirector`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `musicDirectorId_UNIQUE` (`musicDirectorId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `newtrend`
--
ALTER TABLE `newtrend`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `personcontact`
--
ALTER TABLE `personcontact`
  ADD PRIMARY KEY (`personId`,`contactNumber`),
  ADD KEY `fk_personContact_person1` (`personId`);

--
-- Indexes for table `person_rate_tutorial`
--
ALTER TABLE `person_rate_tutorial`
  ADD PRIMARY KEY (`itemId`,`personId`),
  ADD KEY `fk_tutorial_has_person_person1` (`personId`),
  ADD KEY `fk_tutorial_has_person_tutorial1` (`itemId`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `producerId_UNIQUE` (`producerId`);

--
-- Indexes for table `producer_has_drama`
--
ALTER TABLE `producer_has_drama`
  ADD PRIMARY KEY (`personId`,`dramaId`),
  ADD KEY `fk_producer_has_drama_drama1` (`dramaId`),
  ADD KEY `fk_producer_has_drama_producer1` (`personId`);

--
-- Indexes for table `rentitem`
--
ALTER TABLE `rentitem`
  ADD PRIMARY KEY (`rentId`);

--
-- Indexes for table `scriptwriter`
--
ALTER TABLE `scriptwriter`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `scriptWriterId_UNIQUE` (`scriptWriterId`);

--
-- Indexes for table `stagemanager`
--
ALTER TABLE `stagemanager`
  ADD PRIMARY KEY (`personId`),
  ADD UNIQUE KEY `stageManagerId_UNIQUE` (`stageManagerId`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `tutorship`
--
ALTER TABLE `tutorship`
  ADD PRIMARY KEY (`tutorshipId`),
  ADD UNIQUE KEY `personId_UNIQUE` (`requestPersonId`),
  ADD UNIQUE KEY `acceptPersonId_UNIQUE` (`acceptPersonId`),
  ADD KEY `fk_tutorship_person1` (`requestPersonId`),
  ADD KEY `fk_tutorship_person2` (`acceptPersonId`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venueId`);

--
-- Indexes for table `venuecontacts`
--
ALTER TABLE `venuecontacts`
  ADD PRIMARY KEY (`venueId`,`contactNumber`),
  ADD KEY `fk_venueContacts_venue1` (`venueId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `fk_actor_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actor_has_drama`
--
ALTER TABLE `actor_has_drama`
  ADD CONSTRAINT `fk_actor_has_drama_actor1` FOREIGN KEY (`personId`) REFERENCES `actor` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_actor_has_drama_drama1` FOREIGN KEY (`dramaId`) REFERENCES `drama` (`dramaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_creation1` FOREIGN KEY (`creation_itemId`) REFERENCES `creation` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_newTrend1` FOREIGN KEY (`newTrend_itemId`) REFERENCES `newtrend` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `costumedesigner`
--
ALTER TABLE `costumedesigner`
  ADD CONSTRAINT `fk_costumeDesigner_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creation`
--
ALTER TABLE `creation`
  ADD CONSTRAINT `fk_creation_item1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_creation_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `fk_Director_person` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drama`
--
ALTER TABLE `drama`
  ADD CONSTRAINT `fk_drama_costumeDesigner1` FOREIGN KEY (`costumeDesigner_personId`) REFERENCES `costumedesigner` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_director1` FOREIGN KEY (`director_personId`) REFERENCES `director` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_lightningDirector1` FOREIGN KEY (`lightningDirector_personId`) REFERENCES `lightningdirector` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_makeupArtist1` FOREIGN KEY (`makeupArtist_personId`) REFERENCES `makeupartist` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_musicDirector1` FOREIGN KEY (`musicDirector_personId`) REFERENCES `musicdirector` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_scriptWriter1` FOREIGN KEY (`scriptWriter_personId`) REFERENCES `scriptwriter` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_stageManager1` FOREIGN KEY (`stageManager_personId`) REFERENCES `stagemanager` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `drama_has_venue`
--
ALTER TABLE `drama_has_venue`
  ADD CONSTRAINT `fk_drama_has_venue_drama1` FOREIGN KEY (`dramaId`) REFERENCES `drama` (`dramaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drama_has_venue_venue1` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_has_venue`
--
ALTER TABLE `event_has_venue`
  ADD CONSTRAINT `fk_event_has_venue_event1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_has_venue_venue1` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imagegallery`
--
ALTER TABLE `imagegallery`
  ADD CONSTRAINT `fk_imageGallery_venue1` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lightningdirector`
--
ALTER TABLE `lightningdirector`
  ADD CONSTRAINT `fk_lightningDirector_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `makeupartist`
--
ALTER TABLE `makeupartist`
  ADD CONSTRAINT `fk_makeupArtist_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `musicdirector`
--
ALTER TABLE `musicdirector`
  ADD CONSTRAINT `fk_musicDirector_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_item1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newtrend`
--
ALTER TABLE `newtrend`
  ADD CONSTRAINT `fk_table3_item1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personcontact`
--
ALTER TABLE `personcontact`
  ADD CONSTRAINT `fk_personContact_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person_rate_tutorial`
--
ALTER TABLE `person_rate_tutorial`
  ADD CONSTRAINT `fk_tutorial_has_person_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tutorial_has_person_tutorial1` FOREIGN KEY (`itemId`) REFERENCES `tutorial` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `fk_producer_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `producer_has_drama`
--
ALTER TABLE `producer_has_drama`
  ADD CONSTRAINT `fk_producer_has_drama_drama1` FOREIGN KEY (`dramaId`) REFERENCES `drama` (`dramaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producer_has_drama_producer1` FOREIGN KEY (`personId`) REFERENCES `producer` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scriptwriter`
--
ALTER TABLE `scriptwriter`
  ADD CONSTRAINT `fk_scriptWriter_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stagemanager`
--
ALTER TABLE `stagemanager`
  ADD CONSTRAINT `fk_stageManager_person1` FOREIGN KEY (`personId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `fk_tutorial_item1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutorship`
--
ALTER TABLE `tutorship`
  ADD CONSTRAINT `fk_tutorship_person1` FOREIGN KEY (`requestPersonId`) REFERENCES `person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tutorship_person2` FOREIGN KEY (`acceptPersonId`) REFERENCES `person` (`personId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `venuecontacts`
--
ALTER TABLE `venuecontacts`
  ADD CONSTRAINT `fk_venueContacts_venue1` FOREIGN KEY (`venueId`) REFERENCES `venue` (`venueId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
