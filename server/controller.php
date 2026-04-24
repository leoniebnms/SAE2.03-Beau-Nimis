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
    $movies = getAllMovies();
    return $movies;
}

/** updateController
 * 
 * Cette fonction est en charge du traitement des requêtes HTTP pour lesquelles le paramètre 'todo' vaut 'Update'.
 * Elle récupère les valeurs des paramètres 'jour', 'entree', 'plat' et 'dessert' et utilise la fonction updateMenu
 * déclarée dans model.php pour mettre à jour le menu dans la base de données.
 * en fonctiondu résultat de la mise à jour, elle retourne un message indiquant si la mise à jour a réussi ou non.
 */
function updateController(){
  /* Lecture des données de formulaire
    On ne vérifie pas si les données sont valides, on suppose (faudra pas toujours...) que le client les a déjà
    vérifiées avant de les envoyer 
  */
  $titre = $_REQUEST['titre'];
  $real = $_REQUEST['realisateur'];
  $annee = $_REQUEST['annee'];
  $duree = $_REQUEST['duree'];
  $syno = $_REQUEST['synopsis'];
  $cat = $_REQUEST['categorie'];
  $aff = $_REQUEST['affiche'];
  $url = $_REQUEST['url'];
  $restr = $_REQUEST['restrictions'];
  // Mise à jour du menu à l'aide de la fonction updateMenu décrite dans model.php
  $ok = AddMovie($titre, $real, $annee, $duree, $syno, $cat, $aff, $url, $restr);
  // $ok est le nombre de ligne affecté par l'opération de mise à jour dans la BDD (voir model.php)
  if ($ok!=0){
    return ["message" => "Le film $titre a été ajouté avec succès !"];
  }
  else{
    return false;
  }
}


function readController(){
 
    // PREMIERE VERIFICATION : LES PARAMETRES EXISTENT ET SONT NON VIDES
    // Vérification du paramètre 'jour'
    if ( isset($_REQUEST['titre'])==false || empty($_REQUEST['titre'])==true ){
      return false;
    }

    // DEUXIEME VERIFICATION : LES PARAMETRES EXISTENT MAIS LEUR VALEURS SONT-ELLES VALIDES ?

    // $jour doit être un jour de la semaine
    $titre = $_REQUEST['titre'];
  
    
    
    // si on arrive ici c'est que les paramètres existent et sont valides, on peut interroger la BDD
    // Appel de la fonction getMenu déclarée dans model.php pour extraire de la BDD le menu du jour spécifié
    $movie = getMovie($titre, $real, $annee, $duree, $syno, $cat, $aff, $url, $restr);
    return $movie;
}

