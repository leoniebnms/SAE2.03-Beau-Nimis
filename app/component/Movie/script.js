let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();

let templateliFile = await fetch("./component/Movie/templateli.html");
let templateli = await templateliFile.text();

let Movie = {};

Movie.format = function (data, css = "") {
  let html = template;
  html = html.replace("{{cssClass}}", css);

  let menuHTML = "";
  for (let menu of data.menus) {
    let li = templateli; 
    li = li.replace("{{affiche}}", menu.affiche);
    li = li.replace("{{title}}", menu.title);
   
    menuHTML += li;
  }
  html = html.replace("{{menuItems}}", menuHTML);

  return html;
};

Movie.render = function (where, data, css = "") {
  let node = document.querySelector(where);
  node.innerHTML += Movie.format(data, css);
};

export { Movie };
