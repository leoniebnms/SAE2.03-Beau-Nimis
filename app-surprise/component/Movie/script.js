
let Movie = {};

Movie.format =  async function (movies) {


  if (!movies || movies.length === 0) {
    let response = await fetch("./component/Movie/template-message.html");
    return await response.text();
  }

  let templateFile = await fetch("./component/Movie/template.html");
  let template = await templateFile.text();


  
  let menuItems = "";

  for (let movie of movies) {
    let item = template;


    item = item.replaceAll("{{image}}", movie.image);
    item = item.replaceAll("{{name}}", movie.name);
    item = item.replaceAll("{{id}}", movie.id);


    item = item.replace("{{id_category}}", movie.category__name);

    menuItems += item;
  }
  return menuItems;
}

export { Movie };
