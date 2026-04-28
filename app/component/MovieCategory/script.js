import { Movie } from "../Movie/script.js";

let MovieCategory = {};

MovieCategory.format =  async function (categories, allmovies) {

    let templateFile = await fetch("./component/MovieCategory/template.html");
    let template = await templateFile.text();

    let categoriesHTML = "";

    for (let cat of categories) {

      let moviescategory = allmovies.filter(movie => movie.id_category == cat.id);

      if (moviescategory.length > 0) {
            let item = template;
            
            item = item.replaceAll("{{category__name}}", cat.name);
            
            let moviesHTML = await Movie.format(moviescategory);
            item = item.replace("{{movies}}", moviesHTML);

            categoriesHTML += item;
      }
    }

  return categoriesHTML;
}

export { MovieCategory };
