
// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "../server/script.php";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataProfile = {};

 /**
     * Fetches data from the server based on the specified day.
     *
     * @param {string} movie - The day parameter to be sent to the server.
     * @returns The response from the server.
     * 
     * DataMenu.request permet de récupérer des données depuis le serveur.
     * Elle prend en paramètre un jour (lundi mardi...) de la semaine et 
     * renvoie les données contenues dans la réponse du serveur (data).
     */

DataProfile.add = async function (fdata) {
    
    let config = {
        method: "POST", // méthode HTTP à utiliser
        body: fdata // données à envoyer sous forme d'objet FormData
    };
    let answer = await fetch(HOST_URL + "?todo=addProfile", config);
    let data = await answer.json();
    return data;
}

export {DataProfile};
