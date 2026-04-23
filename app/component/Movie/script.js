let Movie = {};

Movie.format =  async function (movies) {
let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();

  let menuItems = "";
  for (let movie of movies) {
    let item = template;


    item = item.replace("{{image}}", movie.image);
    item = item.replaceAll("{{name}}", movie.name);
    menuItems += item;
  }
  return menuItems;
}

export { Movie };
