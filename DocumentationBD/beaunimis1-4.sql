-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 07 mai 2026 à 11:05
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
(7, 45),
(8, 7),
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
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12, 1),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16, 0),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10, 0),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12, 0),
(36, 'Lol', 2008, 107, 'LOL ? C\'est comme ça que les amis de Lola l\'appellent. Pourtant, le jour de sa rentrée au lycée, Lola n\'a pas le cœur à rire. Arthur, son copain, la provoque en lui disant qu\'il l\'a trompée pendant l\'été. Et sa bande de potes a le don pour tout compliquer.', 'Lisa Azuelos', 2, 'lol-affiche.jpeg', 'https://www.youtube.com/watch?v=pcqeBT0493A', 1, 1),
(37, 'Un petit truc en plus', 2024, 99, 'Un p’tit truc en plus raconte l’histoire d’un homme et de son fils en fuite, qui trouvent refuge dans une colonie de vacances pour jeunes adultes en situation de handicap. Pourse fondre dans le groupe, ils vont devoir jouer un rôle… au risque de créer des liens aussi inattendus que bouleversants.', 'Arthus', 2, 'Un-petit-truc-en-plus.jpg', 'https://www.youtube.com/embed/AgzoDtfiS_U', 1, 1),
(38, 'Zootopia', 2016, 108, 'Zootopie est une ville qui ne ressemble à aucune autre : seuls les animaux y habitent ! On y trouve des quartiers résidentiels élégants comme le très chic Sahara Square, et d’autres moins hospitaliers comme le glacial Tundratown. Dans cette incroyable métropole, chaque espèce animale cohabite avec les autres. Qu’on soit un immense éléphant ou une minuscule souris, tout le monde a sa place à Zootopia !\r\n\r\nLorsque Judy Hopps fait son entrée dans la police, elle découvre qu’il est bien difficile de s’imposer chez les gros durs en uniforme, surtout quand on est une adorable lapine. Bien décidée à faire ses preuves, Judy s’attaque à une épineuse affaire, même si cela l’oblige à faire équipe avec Nick Wilde, un renard à la langue bien pendue et véritable virtuose de l’arnaque…', 'Byron Howard, Riche Moore, Jared Bush', 5, 'Zootopia.jpg.avif', 'https://www.youtube.com/embed/RTZlzdHuIQQ', 1, 1),
(40, 'Ça', 2017, 135, 'À Derry, dans le Maine, sept gamins ayant du mal à s\'intégrer se sont regroupés au sein du \"Club des Ratés\". Rejetés par leurs camarades, ils sont les cibles favorites des gros durs de l\'école. Ils ont aussi en commun d\'avoir éprouvé leur plus grande terreur face à un terrible prédateur métamorphe qu\'ils appellent \"Ça\"… Car depuis toujours, Derry est en proie à une créature qui émerge des égouts tous les 27 ans pour se nourrir des terreurs de ses victimes de choix : les enfants. Bien décidés à rester soudés, les Ratés tentent de surmonter leurs peurs pour enrayer un nouveau cycle meurtrier. Un cycle qui a commencé un jour de pluie lorsqu\'un petit garçon poursuivant son bateau en papier s\'est retrouvé face-à-face avec le Clown Grippe-Sou …', 'Andy Muschietti', 7, 'ca.jpg', 'https://www.youtube.com/embed/Tw3yT-qAbvc', 12, 0),
(41, 'La ligne rouge', 1998, 170, 'Pendant la Guerre du Pacifique, alors que l’armée américaine veut reprendre l’île de Guadalcanal aux Japonais, un déserteur installé dans un village mélanésien doit réintégrer sa Compagnie. Les soldats débarquent sans rencontrer de résistance mais en pénétrant dans les territoires intérieurs de l’île, ils subissent sur la Colline 210 un feu nourri provenant d’un bunker lourdement armé…', 'Terrence Malick', 8, 'ligne-rouge.jpg', 'https://www.youtube.com/embed/Yl1asr6pM_4', 1, 0),
(42, 'Mais où est donc passée la septième compagnie?', 1973, 91, 'Pendant la débâcle française de 1940, la 7ème compagnie se réfugie dans les bois. Mais, elle est prise en embuscade par l\'armée allemande. Seuls trois hommes partis en éclaireur en réchappent. Ils se retrouvent livrés à eux-mêmes dans une France occupée.', 'Robert Lamoureux', 1, 'compagnie.webp', 'https://www.youtube.com/embed/3Ob1XwvGC1A', 10, 1),
(43, 'Alibi.com', 2017, 87, 'Greg a fondé une entreprise nommée Alibi.com qui crée tout type d\'alibi. Avec Augustin son associé, et Medhi son nouvel employé, ils élaborent des stratagèmes et mises en scène imparables pour couvrir leurs clients. Mais la rencontre de Flo, une jolie blonde qui déteste les hommes qui mentent, va compliquer la vie de Greg, qui commence par lui cacher la vraie nature de son activité. Lors de la présentation aux parents, Greg comprend que Gérard, le père de Flo, est aussi un de leurs clients...', 'Philippe Lacheau', 2, 'alibi.jpg', 'https://www.youtube.com/embed/5gYCov0Q0qo', 1, 1),
(44, 'Ravage', 2025, 107, 'Un détective meurtri doit se frayer un chemin dans la clandestinité criminelle après une affaire de drogue qui a mal tourné pour sauver le fils d\'un politicien, tout en démêlant un réseau de corruption et de conspiration qui prend au piège toute la ville.', 'Gareth Evans ', 1, 'ravage.jpg', 'https://www.youtube.com/embed/MQByfeqI7_8', 1, 0),
(45, 'Avatar', 2009, 162, '', 'James Cameron', 1, 'avatar.jpg', 'https://www.youtube.com/embed/MJ3Up7By5cw', 1, 0),
(46, 'Une bataille après l\'autre', 2025, 162, 'Ancien révolutionnaire désabusé et paranoïaque, Bob vit en marge de la société, avec sa fille Willa, indépendante et pleine de ressources. Quand son ennemi juré refait surface après 16 ans et que Willa disparaît, Bob remue ciel et terre pour la retrouver, affrontant pour la première fois les conséquences de son passé…', 'Paul Thomas Anderson', 1, 'bataille.jpg', 'https://www.youtube.com/embed/nhmenv9hPf8', 1, 0),
(47, 'San Andreas', 2015, 114, 'Lorsque la tristement célèbre Faille de San Andreas finit par s\'ouvrir, et par provoquer un séisme de magnitude 9 en Californie, un pilote d\'hélicoptère de secours en montagne et la femme dont il s\'est séparé quittent Los Angeles pour San Francisco dans l\'espoir de sauver leur fille unique. Alors qu\'ils s\'engagent dans ce dangereux périple vers le nord de l\'État, pensant que le pire est bientôt derrière eux, ils ne tardent pas à comprendre que la réalité est bien plus effroyable encore…', 'Brad Peyton', 1, 'andreas.jpg', 'https://www.youtube.com/embed/PywcT_wdlNU', 1, 0),
(48, 'A working Man', 2025, 116, 'Levon Cade a quitté son métier pour travailler dans la construction. Mais lorsqu\'une jeune fille de la région disparaît, on lui demande de reprendre les compétences qui ont fait de lui une figure mythique de la lutte contre le terrorisme.', 'David Ayer', 1, 'working.jpg', 'https://www.youtube.com/embed/5K1YEcypgBA', 1, 0),
(49, 'War machine', 2026, 106, 'Après la mort de son frère au combat, un ingénieur militaire rejoint les Rangers de l\'armée américaine et participe à un exercice d\'entraînement de routine au cours duquel son platoon et lui-même rencontrent une gigantesque machine meurtrière venue d\'un autre monde', 'Patrick Hughes', 1, 'war.jpg', 'https://www.youtube.com/embed/nWX_CO2ElUg', 1, 0),
(50, 'Jumpers', 2026, 105, 'Mabel, une adolescente passionnée par les animaux, saute (littéralement !) sur l’occasion d’essayer une nouvelle technologie révolutionnaire permettant de communiquer avec eux d’une manière totalement inédite… en se glissant dans la peau d’une adorable femelle castor. Conçu par des scientifiques visionnaires, ce dispositif permet de transférer la conscience humaine dans le corps de robots-animaux plus vrais que nature. Mabel se lance alors dans une aventure unique et riche en découvertes au cœur du règne animal.', 'Daniel Chong', 5, 'jumpers.jpg', 'https://www.youtube.com/embed/c7AHjWkF5IA', 1, 0),
(51, 'Amélie et la métaphysique des tubes', 2025, 78, 'Amélie est une petite fille belge née au Japon. Grâce à son amie Nishio-san, le monde n’est qu’aventures et découvertes. Mais le jour de ses trois ans, un événement change le cours de sa vie. Car à cet âge-là pour Amélie tout se joue : le bonheur comme la tragédie.', 'Mailys Vallade, Liane-Cho Han', 5, 'amelie.jpg', 'https://www.youtube.com/embed/4Xy6KHhytCI', 1, 0),
(53, 'Ma vie de courgette', 2016, 66, 'Courgette n’a rien d’un légume, c’est un vaillant petit garçon. Il croit qu’il est seul au monde quand il perd sa mère. Mais c’est sans compter sur les rencontres qu’il va faire dans sa nouvelle vie au foyer pour enfants. Simon, Ahmed, Jujube, Alice et Béatrice : ils ont tous leurs histoires et elles sont aussi dures qu’ils sont tendres. Et puis il y a cette fille, Camille. Quand on a 10 ans, avoir une bande de copains, tomber amoureux, il y en a des choses à découvrir et à apprendre. Et pourquoi pas même, être heureux.', 'Claude Barras', 5, 'courgette.jpg', 'https://www.youtube.com/embed/kY6sftI-orE', 1, 0),
(54, 'Le sommet des dieux', 2021, 95, 'A Katmandou, le reporter japonais Fukamachi croit reconnaître Habu Jôji, cet alpiniste que l\'on pensait disparu depuis des années. Il semble tenir entre ses mains un appareil photo qui pourrait changer l’histoire de l’alpinisme. Et si George Mallory et Andrew Irvine étaient les premiers hommes à avoir atteint le sommet de l’Everest, le 8 juin 1924 ? Seul le petit Kodak Vest Pocket avec lequel ils devaient se photographier sur le toit du monde pourrait livrer la vérité. 70 ans plus tard, pour tenter de résoudre ce mystère, Fukamachi se lance sur les traces de Habu. Il découvre un monde de passionnés assoiffés de conquêtes impossibles et décide de l’accompagner jusqu’au voyage ultime vers le sommet des dieux.', 'Patrick Imbert', 5, 'sommet.jpg', 'https://www.youtube.com/embed/sM_KmxpEaJU', 1, 0),
(55, 'Le voyage extraordinaire de Samy', 2010, 85, 'Alors qu\'il se hisse hors de son nid sur une plage de Californie, Samy, petite tortue des mers, trouve et perd dans la foulée l\'amour de sa vie : la jeune Shelly. Au cours de son périple à travers les océans qu\'accomplissent toutes les tortues de mer avant de retrouver la plage qui les a vus naitre, Samy n\'a de cesse de faire face à tous les dangers afin de retrouver Shelly. Accompagné de son meilleur ami Ray, ils sont des observateurs privilégiés de la façon dont l\'homme affecte la planète. Mais il est alors secouru par ces mêmes humains. Il combat des piranhas, échappe à un aigle et part à la recherche d\'un mystérieux passage secret. Un jour, enfin, après toutes ces aventures, Samy retrouve Shelly. Elle non plus ne l\'a pas oublié...', 'Ben  Stassen', 5, 'samy.jpg', 'https://www.youtube.com/embed/VJdnPh5Gt28', 1, 0),
(56, 'Le comte de Monte-Cristo', 2024, 178, 'Victime d’un complot, le jeune Edmond Dantès est arrêté le jour de son mariage pour un crime qu’il n’a pas commis. Après quatorze ans de détention au château d’If, il parvient à s’évader. Devenu immensément riche, il revient sous l’identité du comte de Monte-Cristo pour se venger des trois hommes qui l’ont trahi.', 'Matthieu Delaporte, Alexandre De La Patellière', 8, 'comte.jpg', 'https://www.youtube.com/embed/u0YnbsyvGS0', 1, 0),
(57, 'Jurassic  Park', 1993, 122, 'Ne pas réveiller le chat qui dort... C\'est ce que le milliardaire John Hammond aurait dû se rappeler avant de se lancer dans le \"clonage\" de dinosaures. C\'est à partir d\'une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d\'espèces de dinosaures. Il s\'apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde. Mais c\'était sans compter la cupidité et la malveillance de l\'informaticien Dennis Nedry, et éventuellement des dinosaures, seuls maîtres sur l\'île...', 'Steven Spielberg', 8, 'jurassic.jpg', 'https://www.youtube.com/embed/mh-SypeeitA', 1, 0),
(58, 'Le Seigneur des anneaux : la communauté de l\'anneau ', 2001, 176, 'Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d\'un anneau. Bien loin d\'être une simple babiole, il s\'agit de l\'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. À moins que Frodon, aidé d\'une Compagnie constituée de Hobbits, d\'Hommes, d\'un Magicien, d\'un Nain, et d\'un Elfe, ne parvienne à emporter l\'Anneau à travers la Terre du Milieu jusqu\'à la Crevasse du Destin, lieu où il a été forgé, et à le détruire pour toujours. Un tel périple signifie s\'aventurer très loin en Mordor, les terres du Seigneur des ténèbres, où est rassemblée son armée d\'Orques maléfiques... La Compagnie doit non seulement combattre les forces extérieures du mal mais aussi les dissensions internes et l\'influence corruptrice qu\'exerce l\'Anneau lui-même.', 'Peter Jackson', 8, 'anneau.jpg', 'https://www.youtube.com/embed/KCYr5PpGOvk', 1, 0),
(59, 'Retour vers le futur', 1985, 116, '1985. Le jeune Marty McFly mène une existence anonyme auprès de sa petite amie Jennifer, seulement troublée par sa famille en crise et un proviseur qui serait ravi de l\'expulser du lycée. Ami de l\'excentrique professeur Emmett Brown, il l\'accompagne un soir tester sa nouvelle expérience : le voyage dans le temps via une DeLorean modifiée. La démonstration tourne mal : des trafiquants d\'armes débarquent et assassinent le scientifique. Marty se réfugie dans la voiture et se retrouve transporté en 1955. Là, il empêche malgré lui la rencontre de ses parents, et doit tout faire pour les remettre ensemble, sous peine de ne pouvoir exister...', 'Robert Zemeckis', 8, 'retour.jpg', 'https://www.youtube.com/embed/cU5BREZ9ke0', 1, 0),
(60, 'Qu\'est-ce qu\'on a fait au Bon Dieu ?', 2014, 97, 'Claude et Marie Verneuil, issus de la grande bourgeoisie catholique provinciale sont des parents plutôt \"vieille France\". Mais ils se sont toujours obligés à faire preuve d\'ouverture d\'esprit...Les pilules furent cependant bien difficiles à avaler quand leur première fille épousa un musulman, leur seconde un juif et leur troisième un chinois.\r\n\r\nLeurs espoirs de voir enfin l\'une d\'elles se marier à l\'église se cristallisent donc sur la cadette, qui, alléluia, vient de rencontrer un bon catholique.', 'Philippe de Chauveron', 2, 'bon.jpg', 'https://www.youtube.com/embed/UkXUfWFiiao', 1, 0),
(61, 'Les municipaux, ces héros', 2018, 88, 'Port Vendres est un port magnifique situé en Catalogne française... Magnifique et tellement français : un maire bling-bling et des employés municipaux toujours à fond !\r\n\r\nÀ fond dans les acquis sociaux, à fond contre les cadences infernales, à fond... dans la déconne... celle qui fait qu\'on les aime... Et si de plus ils deviennent des héros alors il n\'y a plus aucune raison de ne pas s\'inscrire à ce voyage dans la vraie vie.', 'Eric Carrière, Francis Ginibre', 2, 'municipaux.jpg', 'https://www.youtube.com/embed/oSFyYGB1PXo', 1, 0),
(62, 'Le Dîner de cons', 1998, 80, 'Tous les mercredis, Pierre Brochant et ses amis organisent un dîner où chacun doit amener un con. Celui qui a trouvé le plus spectaculaire est declaré vainqueur. Ce soir, Brochant exulte, il est sur d\'avoir trouvé la perle rare, un con de classe mondiale: Francois Pignon, comptable au ministère des Finances et passionné de modèles réduits en allumettes. Ce qu\'il ignore c\'est que Pignon est passe maître dans l\'art de déclencher des catastrophes.', 'Francis Veber', 2, 'diner.jpg', 'https://www.youtube.com/embed/wx0mwd9l93Q', 1, 0),
(63, 'Terminator', 1984, 107, 'Un Terminator, robot d\'aspect humain, est envoyé d\'un futur où sa race livre aux hommes une guerre sans merci. Sa mission est de trouver et d\'éliminer Sarah Connor avant qu\'elle ne donne naissance à John, appelé à devenir le chef de la résistance. Cette dernière envoie un de ses membres, Reese, aux trousses du cyborg.', 'James Cameron', 1, 'terminator.jpg', 'https://www.youtube.com/embed/QaagRs5pX_E', 1, 0),
(64, 'Léon', 1994, 103, 'Un tueur à gages répondant au nom de Léon prend sous son aile Mathilda, une petite fille de douze ans, seule rescapée du massacre de sa famille. Bientôt, Léon va faire de Mathilda une \"nettoyeuse\", comme lui. Et Mathilda pourra venger son petit frère...', 'Luc Besson', 1, 'leon.jpg', 'https://www.youtube.com/embed/j6n4LZn1VoU', 12, 0),
(65, 'Heat', 1996, 170, 'Neil McCauley est un braqueur qui a de l\'expérience. Il veille, au cours de ses vols, à ne pas commettre d\'impairs. Ses complices n\'ont pas autant de scrupules ni de «conscience professionnelle». Lors d\'une opération pourtant bien planifiée, l\'un d\'entre eux tire sur deux vigiles. Ce double meurtre intéresse au plus au point le lieutenant Hanna, qui ne met guère de temps à identifier McCauley comme étant le cerveau de la bande. Les deux hommes apprennent à se connaître par dossier et surveillance interposée. A tel point qu\'il finissent par se rencontrer. Chacun jure alors de mettre l\'autre en échec. Un duel s\'engage, à la limite de la légalité. Robert De Niro et Al Pacino, deux monstres du cinéma, se livrent à un numéro d\'anthologie.', 'Michael Mann', 1, 'heat.jpg', 'https://www.youtube.com/embed/d6M_jyeqNYw', 1, 0),
(66, 'Un monstre à Paris', 2011, 90, '', 'Bibo Bergeron', 5, 'monstre.jpg', 'https://www.youtube.com/embed/qab4EQDYC-E', 6, 0),
(68, 'Mémoires d\'un escargot', 2025, 94, 'À la mort de son père, la vie heureuse et marginale de Grace Pudel, collectionneuse d’escargots et passionnée de lecture, vole en éclats. Arrachée à son frère jumeau Gilbert, elle atterrit dans une famille d’accueil à l’autre bout de l’Australie. Suspendue aux lettres de son frère, ignorée par ses tuteurs et harcelée par ses camarades de classe, Grace s’enfonce dans le désespoir. Jusqu’à la rencontre salvatrice avec Pinky, une octogénaire excentrique qui va lui apprendre à aimer la vie et à sortir de sa coquille…', 'Adam Elliot', 5, 'escargot.jpg', 'https://www.youtube.com/embed/OmCjaghgtTQ', 1, 0),
(69, 'Pirates des Caraïbes', 2003, 143, 'Un pirate excentrique s’allie à un forgeron pour sauver une jeune femme.', 'Gore Verbinski', 8, 'pirate.jpg', 'https://www.youtube.com/embed/WiZC7l0ovvk?si=kckHWMCeVow2KTBA', 10, 0),
(70, 'Sonic', 2020, 99, 'L\'histoire du hérisson bleu le plus rapide du monde qui arrive sur Terre, sa nouvelle maison. Sonic et son nouveau meilleur ami Tom font équipe pour sauver la planète du diabolique Dr. Robotnik, bien déterminé à régner sur le monde entier.', 'Jeff Fowler', 8, 'sonic.jpg', 'https://www.youtube.com/embed/szby7ZHLnkA?si=H1AHTqHHQvM97Yo_', 1, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
