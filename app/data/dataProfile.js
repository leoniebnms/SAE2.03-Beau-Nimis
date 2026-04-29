console.log("Fichier DataProfile chargé !");

// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = ".."; // CHANGE THIS TO MATCH YOUR CONFIG

let DataProfile = {};

DataProfile.read = async function(){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readProfile");
    let data = await answer.json();
    return data;
}   

DataProfile.update = async function (fdata) {
    
    let config = {
        method: "POST", // méthode HTTP à utiliser
        body: fdata // données à envoyer sous forme d'objet FormData
    };
    let answer = await fetch(HOST_URL + "/server/script.php?todo=updateProfile", config);
    let data = await answer.json();
    return data;
}

export {DataProfile};
