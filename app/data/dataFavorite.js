// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = ".."; // CHANGE THIS TO MATCH YOUR CONFIG

let DataFavorite = {};

DataFavorite.add = async function(id_profile, id_movie){
    let fd = new FormData();
    fd.append("id_profile", id_profile);
    fd.append("id_movie", id_movie);

    let config = {
        method: "POST", // méthode HTTP à utiliser
        body: fd // données à envoyer sous forme d'objet FormData
    };
    
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addFavorite", config);
    let data = await answer.json();
    return data;
}   

DataFavorite.read = async function(id_profile){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readFavorites&id_profile=" + id_profile);
    let data = await answer.json();
    return data;
}

DataFavorite.remove = async function(id_profile, id_movie) {
    let fd = new FormData();
    fd.append("id_profile", id_profile);
    fd.append("id_movie", id_movie);

    let config = {
        method: "POST",
        body: fd
    };

    let answer = await fetch(HOST_URL + "/server/script.php?todo=removeFavorite", config);
    let data = await answer.json();
    return data;
}

export {DataFavorite};
