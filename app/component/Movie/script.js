let templateFile = await fetch("./component/Movie/template.html");
let template = await templateFile.text();

let templateFile = await fetch("./component/Movie/template-message.html");
let template = await templateFile.text();


let Movie = {};

Movie.format =  async function (movies) {

  data=[]

  if (!movies || movies.length === 0) {
    let response = await fetch("./component/Movie/template-message.html");
    return await response.text();
  }

  
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
