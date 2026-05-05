import { DataProfile } from '../../data/dataProfile.js';

let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();


let NavBar = {};

NavBar.format = async function (hAbout, hHome, hProfile, hFav) {
  let html = template;

  const profiles = await DataProfile.read();


  // html = html.replace("{{hAbout}}", hAbout);
  html = html.replace("{{hHome}}", hHome);
  html = html.replace("{{hProfile}}", hProfile);
  html = html.replace("{{hFav}}", hFav);

  let optionsHtml = profiles.map(c => `<option value="${c.id}">${c.name}</option>`).join('');
    html = html.replace('{{profile_options}}', optionsHtml);

  
  return html;
};

export { NavBar };
