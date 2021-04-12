-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 12 avr. 2021 à 22:44
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP : 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `reservapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('0e6fcf0e-a72d-4cf9-8d19-e0f8a17b0a08', 'Admin', 'ADMIN', '6493b278-1e8a-40d2-9d5a-68a678bdde34'),
('4e6f3d09-6950-4e1d-9976-a053c3cb403f', 'Staff', 'STAFF', '81e92ec3-89a5-4a96-8207-285d793ed938'),
('c6fa56d8-557b-4ff6-967f-9b0266abd56d', 'Apprenant', 'APPRENANT', 'b85c2970-95e5-437b-a224-97d082e7a013');

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('4c38c1b1-2ab8-4e41-bfb3-e73a14897a2e', '0e6fcf0e-a72d-4cf9-8d19-e0f8a17b0a08'),
('4d923d1e-44ef-4708-ae81-c868d95b38b2', '0e6fcf0e-a72d-4cf9-8d19-e0f8a17b0a08'),
('4d923d1e-44ef-4708-ae81-c868d95b38b2', '4e6f3d09-6950-4e1d-9976-a053c3cb403f'),
('4d923d1e-44ef-4708-ae81-c868d95b38b2', 'c6fa56d8-557b-4ff6-967f-9b0266abd56d'),
('9f1678c1-6c5d-4954-afdb-bf1f43e548f7', 'c6fa56d8-557b-4ff6-967f-9b0266abd56d'),
('a093e542-bffd-48cd-92f5-fbcac2964d5d', '0e6fcf0e-a72d-4cf9-8d19-e0f8a17b0a08'),
('a093e542-bffd-48cd-92f5-fbcac2964d5d', '4e6f3d09-6950-4e1d-9976-a053c3cb403f'),
('a093e542-bffd-48cd-92f5-fbcac2964d5d', 'c6fa56d8-557b-4ff6-967f-9b0266abd56d');

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `Discriminator` longtext NOT NULL,
  `nom` longtext DEFAULT NULL,
  `prenom` longtext DEFAULT NULL,
  `classe` longtext DEFAULT NULL,
  `reservCount` int(11) DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `FullName` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `Discriminator`, `nom`, `prenom`, `classe`, `reservCount`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, `FullName`) VALUES
('38f48018-f3a8-4081-be84-e386540e4ddf', 'Apprenant', 'Anas', 'Marhoum', 'Classe 1', 0, 'Anas Marhoum', 'ANAS.M@HOTMAIL.COM', 'anas.m@hotmail.com', 'ANAS.M@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEPSlE3yZPhMaWdRZC2EyOFGpV/isnRPTF88fEbtNyhjXq+8q2UfbsKRr9Jt6nnU2lA==', '7VHW4OEZT6CEB3VLHU3HARBUJBVZKXFH', '6a6d532f-c465-448d-a3d1-51dd6528bf93', NULL, 0, 0, NULL, 1, 0, NULL),
('4c38c1b1-2ab8-4e41-bfb3-e73a14897a2e', 'Apprenant', 'Asri', 'Loubna', 'FEBE', 0, 'Loubna_Asri', 'LOUBNA_ASRI', 'Loubna_a@hotmail.com', 'LOUBNA_A@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEIpptHGNb03DtKUlGDYmAKvLcDmVffNulU11yhpxJDg+D9TVLlzUI1dY6gu4+h1mLw==', '33NC77ADPEPLXIPK3M3TL37ANBPLVOQZ', 'ffdcc1c9-8a4a-4736-96b3-7f3ca66e36da', NULL, 0, 0, NULL, 1, 0, 'Loubna Asri'),
('4d923d1e-44ef-4708-ae81-c868d95b38b2', 'Apprenant', 'Marhoum', 'Sara', 'C#', 0, 'Sara_Marhoum', 'SARA_MARHOUM', 'sara_maroum@hotmail.com', 'SARA_MAROUM@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEN4Bh6otZIKbmMej58sImuGLAWN9OToRO0xEiEmKn9cCeVejqbBdjIU9tS0YoD0wGw==', 'CBD67HRL4MO36O7NZ4WKZVINN5FAFO5U', '907b2efa-8c4d-44e4-a58a-03af5b25b428', NULL, 0, 0, NULL, 1, 0, NULL),
('9f1678c1-6c5d-4954-afdb-bf1f43e548f7', 'Apprenant', 'Fannan', 'Majda', 'C#', 0, 'Majda_Fannan', 'MAJDA_FANNAN', 'majda_f@hotmail.com', 'MAJDA_F@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEF7Ez9BwHjbx6e8qm/CRnc151dNt+DHPy1/D9wiDUZqWlFt00L2Ij1AYWAQ6Vum/fg==', 'U3LFXEOLGLD5PHTXTVRKEIG5VZESMOGL', '3d11f21b-758e-4cf7-9827-b406c2258f21', NULL, 0, 0, NULL, 1, 0, 'Majda Fannan'),
('a093e542-bffd-48cd-92f5-fbcac2964d5d', 'Apprenant', 'Najjar', 'Naima', 'FEBE', 0, 'naima_n@hotmail.com', 'NAIMA_N@HOTMAIL.COM', 'naima_n@hotmail.com', 'NAIMA_N@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEOBPXoWHvvUBSQcy8a1gJ19ZJgH/1xVsXG2Ys7W2ohDP8m6imkjcJDorn8Ud81u35A==', 'ECQZDDBSXYDVPIYHD62NI4OGWRGA3EUE', '7c7ed8a0-d34a-4e8d-8349-99f6522efb01', NULL, 0, 0, NULL, 1, 0, NULL),
('f65e3e77-9d1a-401c-9258-53e2f254ab56', 'Apprenant', 'Jean', 'Mélina', 'JEE', 0, 'Mélina Jean', 'JEAN_M@HOTMAIL.COM', 'jean_m@hotmail.com', 'JEAN_M@HOTMAIL.COM', 1, 'AQAAAAEAACcQAAAAEDNG8vRNzcDJ7a4ny9YR5XOZ3UcrJftrkKtRmozJhuvuxwDrnmyUWP8Tl0S5ILFzEg==', 'LIHKUL2CC2VDUR7ASASERNJL4LXMNQJN', '571bd310-b08d-4cf1-826f-2c2230ef6147', NULL, 0, 0, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `réservations`
--

CREATE TABLE `réservations` (
  `ID` int(11) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `Type` longtext DEFAULT NULL,
  `Status` varchar(250) NOT NULL DEFAULT 'En attente',
  `Cause` longtext DEFAULT NULL,
  `ApprenantsId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `réservations`
--

INSERT INTO `réservations` (`ID`, `Date`, `Type`, `Status`, `Cause`, `ApprenantsId`) VALUES
(5, '2021-03-25 12:05:00.000000', 'Journée', 'Confirmée', 'Travail', 'f65e3e77-9d1a-401c-9258-53e2f254ab56'),
(6, '2021-03-28 12:12:00.000000', 'Après-midi', 'Refusée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(7, '2021-03-26 12:36:00.000000', 'Weekend', 'Refusée', 'Travail', '38f48018-f3a8-4081-be84-e386540e4ddf'),
(9, '2021-03-17 16:36:00.000000', 'Après-midi', 'Confirmée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(17, '2021-03-26 10:42:05.000000', '9h à 17h', 'Confirmée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(18, '2021-03-26 10:42:25.000000', '17h à 20h', 'Confirmée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(21, '2021-03-29 22:41:51.000000', 'Week-End', 'Refusée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(22, '2021-03-29 22:43:20.000000', 'Week-End', 'Confirmée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(23, '2021-03-29 22:49:19.000000', '17h à 20h', 'Refusée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(24, '2021-04-02 16:57:12.000000', '17h à 20h', 'Confirmée', 'Travail', 'a093e542-bffd-48cd-92f5-fbcac2964d5d'),
(31, '2021-04-03 20:43:29.888935', '17h à 20h', 'Refusée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(32, '2021-04-03 20:45:34.882735', '17h à 20h', 'Confirmée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(33, '2021-04-03 20:47:34.513714', 'Week-End', 'Refusée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(44, '2021-04-03 22:03:28.000000', '9h à 17h', 'Confirmée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(45, '2021-04-06 16:09:20.000000', '9h à 17h', 'Confirmée', 'Games and work', '9f1678c1-6c5d-4954-afdb-bf1f43e548f7'),
(46, '2021-04-06 16:39:16.000000', '9h à 17h', 'Confirmée', 'Travail', 'a093e542-bffd-48cd-92f5-fbcac2964d5d'),
(47, '2021-04-06 16:40:22.000000', '9h à 17h', 'Refusée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(48, '2021-04-06 10:27:29.676100', '17h à 20h', 'Confirmée', 'Games', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(49, '2021-04-07 10:28:38.000000', '9h à 17h', 'Refusée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2'),
(50, '2021-04-08 09:40:26.000000', '9h à 17h', 'Refusée', 'Travail', '4d923d1e-44ef-4708-ae81-c868d95b38b2');

-- --------------------------------------------------------

--
-- Structure de la table `réservationviewmodel`
--

CREATE TABLE `réservationviewmodel` (
  `ID` int(11) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `nom` longtext DEFAULT NULL,
  `prenom` longtext DEFAULT NULL,
  `classe` longtext DEFAULT NULL,
  `Type` longtext DEFAULT NULL,
  `Status` longtext DEFAULT NULL,
  `Cause` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20210313155230_Init', '5.0.4'),
('20210316110539_deleteRVMfromDBc', '5.0.4'),
('20210316153946_revFoKeyApp', '5.0.4'),
('20210329111558_addFullName', '5.0.4');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Index pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Index pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Index pour la table `réservations`
--
ALTER TABLE `réservations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_Réservations_ApprenantsId` (`ApprenantsId`);

--
-- Index pour la table `réservationviewmodel`
--
ALTER TABLE `réservationviewmodel`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `réservations`
--
ALTER TABLE `réservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `réservationviewmodel`
--
ALTER TABLE `réservationviewmodel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `réservations`
--
ALTER TABLE `réservations`
  ADD CONSTRAINT `FK_Réservations_AspNetUsers_ApprenantsId` FOREIGN KEY (`ApprenantsId`) REFERENCES `aspnetusers` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
