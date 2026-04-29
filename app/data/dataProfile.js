// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = ".."; // CHANGE THIS TO MATCH YOUR CONFIG

let DataProfile = {};

DataProfile.read = async function(){
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readProfile");
    let data = await answer.json();
    return data;
}   

export {DataProfile};
