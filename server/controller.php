<?php

/** ARCHITECTURE PHP SERVEUR  : Rôle du fichier controller.php
 * 
 *  Dans ce fichier, on va définir les fonctions de contrôle qui vont traiter les requêtes HTTP.
 *  Les requêtes HTTP sont interprétées selon la valeur du paramètre 'todo' de la requête (voir script.php)
 *  Pour chaque valeur différente, on déclarera une fonction de contrôle différente.
 * 
 *  Les fonctions de contrôle vont éventuellement lire les paramètres additionnels de la requête, 
 *  les vérifier, puis appeler les fonctions du modèle (model.php) pour effectuer les opérations
 *  nécessaires sur la base de données.
 *  
 *  Si la fonction échoue à traiter la requête, elle retourne false (mauvais paramètres, erreur de connexion à la BDD, etc.)
 *  Sinon elle retourne le résultat de l'opération (des données ou un message) à includre dans la réponse HTTP.
 */

/** Inclusion du fichier model.php
 *  Pour pouvoir utiliser les fonctions qui y sont déclarées et qui permettent
 *  de faire des opérations sur les données stockées en base de données.
 */
require("model.php");


function readMoviesController(){
    $age = isset($_GET['age']) ? intval($_GET['age']) : 0;

    $movies = getAllMovies($age);
    return $movies;
}


function addMovieController(){
  $name = isset($_POST['name']) ? $_POST['name'] : null;
  $year = isset($_POST['year']) ? $_POST['year'] : null;
  $length = isset($_POST['length']) ? $_POST['length'] : null;
  $description = isset($_POST['description']) ? $_POST['description'] : null;
  $director = isset($_POST['director']) ? $_POST['director'] : null;
  $id_category = isset($_POST['id_category']) ? $_POST['id_category'] : (isset($_POST['category']) ? $_POST['category'] : null);
  $image = isset($_POST['image']) ? $_POST['image'] : null;
  $trailer = isset($_POST['trailer']) ? $_POST['trailer'] : null;
  $min_age = isset($_POST['min_age']) ? $_POST['min_age'] : null;

  if (!$name || !$year || !$length || !$director || !$id_category || !$image || !$trailer || !$min_age) {
    return false;
  }

  $ok = AddMovie($name, $year, $length, $description, $director, $id_category, $image, $trailer, $min_age);

  if ($ok!=0){
    return ["message" => "Le film $name a été ajouté avec succès !"];
  }
  else{
    return false;
  }
}


function readController(){
 
    // PREMIERE VERIFICATION : LES PARAMETRES EXISTENT ET SONT NON VIDES
    // Vérification du paramètre 'jour'
    if ( isset($_REQUEST['name'])==false || empty($_REQUEST['name'])==true ){
      return false;
    }

    // DEUXIEME VERIFICATION : LES PARAMETRES EXISTENT MAIS LEUR VALEURS SONT-ELLES VALIDES ?

    // $jour doit être un jour de la semaine
    $name = $_REQUEST['name'];
  
    
    
    // si on arrive ici c'est que les paramètres existent et sont valides, on peut interroger la BDD
    // Appel de la fonction getMenu déclarée dans model.php pour extraire de la BDD le menu du jour spécifié
    $movie = getMovie($name, $year, $length, $description, $director, $id_category, $image, $trailer, $min_age);
    return $movie;
}

function readCategoriesController(){
    return getAllCategories();
}

function readMovieDetailController(){
 
    // PREMIERE VERIFICATION : LES PARAMETRES EXISTENT ET SONT NON VIDES
    // Vérification du paramètre 'id'
    if ( isset($_REQUEST['id'])==false || empty($_REQUEST['id'])==true ){
      return false;
    }

    // DEUXIEME VERIFICATION : LES PARAMETRES EXISTENT MAIS LEUR VALEURS SONT-ELLES VALIDES ?

    // $jour doit être un jour de la semaine
    $id = $_REQUEST['id'];
    
    // si on arrive ici c'est que les paramètres existent et sont valides, on peut interroger la BDD
    // Appel de la fonction getMenu déclarée dans model.php pour extraire de la BDD le menu du jour spécifié
    $movie = getMovieById($id);
    return $movie;
}


function readProfilesController(){
    $Profiles = getProfiles();
    return $Profiles;
}

function addProfileController(){
  $name = isset($_POST['name']) ? $_POST['name'] : null;
  $image = isset($_POST['image']) ? $_POST['image'] : null;
  $age = isset($_POST['age']) ? $_POST['age'] : null;

  if (!$name || !$age) {
    return false;
  }

  $ok = AddProfile($name, $image, $age);

  if ($ok!=0){
    return ["message" => "Le profil $name a été ajouté avec succès !"];
  }
  else{
    return false;
  }
}
