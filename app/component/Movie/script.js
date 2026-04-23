

let Movie = {};

Movie.format =  async function (movies) {
let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();

  let menuItems = "";
  for (let movie of movies) {
    let item = template;

    let name = movie.name || "Nom inconnu";
    let image = movie.image || "default.jpg";

    item = item.replace("{{image}}", image);
    item = item.replaceAll("{{name}}", name);
    menuItems += item;
  }
  return menuItems;
}

export { Movie };
