-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 05 mai 2026 à 06:53
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `beaunimis1`
--

-- --------------------------------------------------------

--
-- Structure de la table `SAE203_Category`
--

CREATE TABLE `SAE203_Category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `SAE203_Category`
--

INSERT INTO `SAE203_Category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame'),
(4, 'Science-fiction'),
(5, 'Animation'),
(6, 'Thriller'),
(7, 'Horreur'),
(8, 'Aventure'),
(9, 'Fantaisie'),
(10, 'Documentaire'),
(11, 'Séries');

-- --------------------------------------------------------

--
-- Structure de la table `SAE203_Favorite`
--

CREATE TABLE `SAE203_Favorite` (
  `id_profile` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `SAE203_Favorite`
--

INSERT INTO `SAE203_Favorite` (`id_profile`, `id_movie`) VALUES
(2, 12),
(2, 17),
(2, 27),
(2, 38),
(2, 41),
(7, 17),
(7, 38),
(9, 36),
(9, 37),
(9, 38);

-- --------------------------------------------------------

--
-- Structure de la table `SAE203_Movie`
--

CREATE TABLE `SAE203_Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `SAE203_Movie`
--

INSERT INTO `SAE203_Movie` (`id`, `name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`, `featured`) VALUES
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12, 0),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16, 0),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10, 0),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12, 0),
(36, 'Lol', 2008, 107, 'LOL ? C\'est comme ça que les amis de Lola l\'appellent. Pourtant, le jour de sa rentrée au lycée, Lola n\'a pas le cœur à rire. Arthur, son copain, la provoque en lui disant qu\'il l\'a trompée pendant l\'été. Et sa bande de potes a le don pour tout compliquer.', 'Lisa Azuelos', 2, 'lol-affiche.jpeg', 'https://www.youtube.com/watch?v=pcqeBT0493A', 1, 1),
(37, 'Un petit truc en plus', 2024, 99, 'Un p’tit truc en plus raconte l’histoire d’un homme et de son fils en fuite, qui trouvent refuge dans une colonie de vacances pour jeunes adultes en situation de handicap. Pourse fondre dans le groupe, ils vont devoir jouer un rôle… au risque de créer des liens aussi inattendus que bouleversants.', 'Arthus', 2, 'Un-petit-truc-en-plus.jpg', 'https://www.youtube.com/embed/AgzoDtfiS_U', 1, 0),
(38, 'Zootopia', 2016, 108, 'Zootopie est une ville qui ne ressemble à aucune autre : seuls les animaux y habitent ! On y trouve des quartiers résidentiels élégants comme le très chic Sahara Square, et d’autres moins hospitaliers comme le glacial Tundratown. Dans cette incroyable métropole, chaque espèce animale cohabite avec les autres. Qu’on soit un immense éléphant ou une minuscule souris, tout le monde a sa place à Zootopia !\r\n\r\nLorsque Judy Hopps fait son entrée dans la police, elle découvre qu’il est bien difficile de s’imposer chez les gros durs en uniforme, surtout quand on est une adorable lapine. Bien décidée à faire ses preuves, Judy s’attaque à une épineuse affaire, même si cela l’oblige à faire équipe avec Nick Wilde, un renard à la langue bien pendue et véritable virtuose de l’arnaque…', 'Byron Howard, Riche Moore, Jared Bush', 5, 'Zootopia.jpg.avif', 'https://www.youtube.com/embed/RTZlzdHuIQQ', 1, 0),
(40, 'Ça', 2017, 135, 'À Derry, dans le Maine, sept gamins ayant du mal à s\'intégrer se sont regroupés au sein du \"Club des Ratés\". Rejetés par leurs camarades, ils sont les cibles favorites des gros durs de l\'école. Ils ont aussi en commun d\'avoir éprouvé leur plus grande terreur face à un terrible prédateur métamorphe qu\'ils appellent \"Ça\"… Car depuis toujours, Derry est en proie à une créature qui émerge des égouts tous les 27 ans pour se nourrir des terreurs de ses victimes de choix : les enfants. Bien décidés à rester soudés, les Ratés tentent de surmonter leurs peurs pour enrayer un nouveau cycle meurtrier. Un cycle qui a commencé un jour de pluie lorsqu\'un petit garçon poursuivant son bateau en papier s\'est retrouvé face-à-face avec le Clown Grippe-Sou …', 'Andy Muschietti', 7, 'ca.jpg', 'https://www.youtube.com/embed/Tw3yT-qAbvc', 12, 0),
(41, 'La ligne rouge', 1998, 170, 'Pendant la Guerre du Pacifique, alors que l’armée américaine veut reprendre l’île de Guadalcanal aux Japonais, un déserteur installé dans un village mélanésien doit réintégrer sa Compagnie. Les soldats débarquent sans rencontrer de résistance mais en pénétrant dans les territoires intérieurs de l’île, ils subissent sur la Colline 210 un feu nourri provenant d’un bunker lourdement armé…', 'Terrence Malick', 8, 'ligne-rouge.jpg', 'https://www.youtube.com/embed/Yl1asr6pM_4', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `SAE203_Profile`
--

CREATE TABLE `SAE203_Profile` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `SAE203_Profile`
--

INSERT INTO `SAE203_Profile` (`id`, `name`, `image`, `age`) VALUES
(2, 'Léonie', 'leonie.jpg', 19),
(7, 'Yanis', 'Yanis.jpg', 19),
(8, 'Laly', 'laly.jpg', 14),
(9, 'Charline', 'charline.jpg', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `SAE203_Category`
--
ALTER TABLE `SAE203_Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `SAE203_Favorite`
--
ALTER TABLE `SAE203_Favorite`
  ADD PRIMARY KEY (`id_profile`,`id_movie`);

--
-- Index pour la table `SAE203_Movie`
--
ALTER TABLE `SAE203_Movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `SAE203_Profile`
--
ALTER TABLE `SAE203_Profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `SAE203_Category`
--
ALTER TABLE `SAE203_Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `SAE203_Movie`
--
ALTER TABLE `SAE203_Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `SAE203_Profile`
--
ALTER TABLE `SAE203_Profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `SAE203_Movie`
--
ALTER TABLE `SAE203_Movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `SAE203_Category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
