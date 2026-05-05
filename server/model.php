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

// define("HOST", "localhost");
// define("DBNAME", "SAE203");
// define("DBLOGIN", "usersae203");
// define("DBPWD", "sae203NieBeau2512");


function getAllMovies($age = 0){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le menu avec des paramètres
    $sql = "SELECT m.id, m.name, m.image, m.id_category, c.name AS category__name 
            FROM `SAE203_Movie` m
            JOIN `SAE203_Category` c ON m.id_category = c.id
            WHERE m.min_age <= :age
            ORDER BY c.name ASC";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    $stmt->bindValue(':age', $age, PDO::PARAM_INT);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}

function AddMovie($name, $year, $length, $description, $director, $id_category, $image, $trailer, $min_age){
    try {
        // Connexion à la base de données
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "INSERT INTO `SAE203_Movie` (`name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`) VALUES (:name, :year, :length, :description, :director, :id_category, :image, :trailer, :min_age)";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':year', $year);
        $stmt->bindParam(':length', $length);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':director', $director);
        $stmt->bindParam(':id_category', $id_category);
        $stmt->bindParam(':image', $image);
        $stmt->bindParam(':trailer', $trailer);
        $stmt->bindParam(':min_age', $min_age);
        $stmt->execute();
        return $stmt->rowCount();
    } catch (PDOException $e) {
        return false;
    }
}

function getAllCategories(){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le menu avec des paramètres
    $sql = "SELECT id, name from `SAE203_Category` ORDER BY name ASC";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}

function getMovieById($id){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    // Requête SQL pour récupérer le menu avec des paramètres
    $sql = "SELECT SAE203_Movie.*, SAE203_Category.name AS category__name
            FROM SAE203_Movie 
            INNER JOIN SAE203_Category ON SAE203_Movie.id_category = SAE203_Category.id 
            WHERE SAE203_Movie.id = :id";
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id', $id);
    // Exécute la requête SQL
    $stmt->execute();
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetch(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}


function AddProfile($name, $image, $age){
    try {
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "INSERT INTO `SAE203_Profile` (`name`, `image`, `age`) VALUES (:name, :image, :age)";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':image', $image);
        $stmt->bindParam(':age', $age);
        $stmt->execute();
        return $stmt->rowCount();
    } catch (PDOException $e) {
        return false;
    }
}


function getProfiles(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT id, name, image, age FROM `SAE203_Profile`";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; 
}

function UpdateProfile($id, $name, $image, $age){
    try {
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "UPDATE `SAE203_Profile` SET `name` = :name, `image` = :image, `age` = :age WHERE `id` = :id";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':image', $image);
        $stmt->bindParam(':age', $age);
        $stmt->execute();
        return $stmt->rowCount();
    } catch (PDOException $e) {
        return false;
    }
}

function addFavorite($id_profile, $id_movie){
    try {
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "INSERT INTO `SAE203_Favorite` (`id_profile`, `id_movie`) VALUES (:id_profile, :id_movie)";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':id_profile', $id_profile);
        $stmt->bindParam(':id_movie', $id_movie);
        $stmt->execute();
        return $stmt->rowCount();
    } catch (PDOException $e) {
        return false;
    }
}

function getFavorite($id_profile){
    try{
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $sql = "SELECT m.id, m.name, m.image, m.id_category, c.name AS category__name 
            FROM `SAE203_Favorite` f
            JOIN `SAE203_Movie` m ON f.id_movie = m.id
            JOIN `SAE203_Category` c ON m.id_category = c.id
            WHERE f.id_profile = :id_profile";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':id_profile', $id_profile);
        $stmt->execute();
        $res = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $res; 
    } 
    catch (PDOException $e) {
        return false;
    }
}

function readFavorites($id_profile){
    try {
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $sql = "SELECT m.* FROM SAE203_Movie m 
            JOIN SAE203_Favorite f ON m.id = f.id_movie 
            WHERE f.id_profile = :id_profile";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':id_profile', $id_profile);
        $stmt->execute();
        $res = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $res; 
    } 
    catch (PDOException $e) {
        return false;
    }
    
}

function removeFavorite($id_profile, $id_movie) {
    try {
        $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
        $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);        
        $sql = "DELETE FROM `SAE203_Favorite` WHERE `id_profile` = :id_profile AND `id_movie` = :id_movie";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':id_profile', $id_profile);
        $stmt->bindParam(':id_movie', $id_movie);
        $stmt->execute();
        return ($stmt->rowCount() > 0);
    } catch (PDOException $e) {
        return false;
    }
}

function getFeaturedMovies(){
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME, DBLOGIN, DBPWD);
    $sql = "SELECT * FROM `SAE203_Movie` WHERE featured = 1";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; 
}