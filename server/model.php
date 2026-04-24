<?php
/**
 * Ce fichier contient toutes les fonctions qui réalisent des opérations
 * sur la base de données, telles que les requêtes SQL pour insérer, 
 * mettre à jour, supprimer ou récupérer des données.
 */

/**
 * Définition des constantes de connexion à la base de données.
 *
 * HOST : Nom d'hôte du serveur de base de données, ici "localhost".
 * DBNAME : Nom de la base de données
 * DBLOGIN : Nom d'utilisateur pour se connecter à la base de données.
 * DBPWD : Mot de passe pour se connecter à la base de données.
 */
define("HOST", "localhost");
define("DBNAME", "beaunimis1");
define("DBLOGIN", "beaunimis1");
define("DBPWD", "beaunimis1");


function getAllMovies(){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le menu avec des paramètres
    $sql = "select id, name, image from SAE203_Movie";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}

function AddMovie($titre, $real, $annee, $duree, $desc, $cat, $aff, $url, $restr){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le menu avec des paramètres
    $sql = "insert into SAE203_Movie (name, realisateur, annee, duree, synopsis, categorie, affiche, url, restrictions) values (:titre, :real, :annee, :duree, :desc, :cat, :aff, :url, :restr)";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie le paramètre à la valeur
    $stmt->bindParam(':titre', $titre);
    $stmt->bindParam(':real', $real);
    $stmt->bindParam(':annee', $annee);
    $stmt->bindParam(':duree', $duree);
    $stmt->bindParam(':syno', $syno);
    $stmt->bindParam(':cat', $cat);
    $stmt->bindParam(':aff', $aff);
    $stmt->bindParam(':url', $url);
    $stmt->bindParam(':restr', $restr);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}



/**
 * Met à jour le menu pour un jour spécifique dans la base de données.
 *
 * @param string $j Le jour pour lequel le menu est mis à jour.
 * @param string $e La nouvelle entrée pour le menu.
 * @param string $p Le nouveau plat principal pour le menu.
 * @param string $d Le nouveau dessert pour le menu.
 * @return int Le nombre de lignes affectées par la requête de mise à jour.
 * 
 * A SAVOIR: une requête SQL de type update retourne le nombre de lignes affectées par la requête.
 * Si la requête a réussi, le nombre de lignes affectées sera 1.
 * Si la requête a échoué, le nombre de lignes affectées sera 0.
 */
function updateMovie($titre, $real, $annee, $duree, $syno, $cat, $aff, $url, $restr){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD); 
    // Requête SQL de mise à jour du menu avec des paramètres
    $sql = "REPLACE INTO Repas (titre, real, annee, duree, syno, cat, aff, url, restr) 
            VALUES (:titre, :real, :annee, :duree, :syno, :cat, :aff, :url, :restr)";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Lie les paramètres aux valeurs
   $stmt->bindParam(':titre', $titre);
    $stmt->bindParam(':real', $real);
    $stmt->bindParam(':annee', $annee);
    $stmt->bindParam(':duree', $duree);
    $stmt->bindParam(':syno', $syno);
    $stmt->bindParam(':cat', $cat);
    $stmt->bindParam(':aff', $aff);
    $stmt->bindParam(':url', $url);
    $stmt->bindParam(':restr', $restr);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées
}
