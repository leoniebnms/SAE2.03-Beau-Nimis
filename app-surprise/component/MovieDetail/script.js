
let MovieDetail = {};

MovieDetail.format =  async function (movie, isFavorite) {

  let templateFile = await fetch("./component/MovieDetail/template.html");
  let template = await templateFile.text();
  
  let html = template;

  html = html.replaceAll("{{id}}", movie.id);
  
  html = html.replaceAll("{{name}}", movie.name);
  html = html.replace("{{image}}", movie.image);
  html = html.replace("{{length}}", movie.length);
  html = html.replace("{{description}}", movie.description);
  html = html.replace("{{director}}", movie.director);
  html = html.replace("{{year}}", movie.year);
  html = html.replace("{{id_category}}", movie.category__name);
  html = html.replace("{{min_age}}", movie.min_age);
  html = html.replace("{{trailer}}", movie.trailer);

  let buttonHTML = "";
    if (isFavorite) {
        buttonHTML = `<button class="fav__btn remove" onclick="C.handlerRemoveFavorite('${movie.id}')">Retirer des favoris</button>`;
    } else {
        buttonHTML = `<button class="fav__btn add" onclick="C.handlerFavorite('${movie.id}')">Ajouter aux favoris</button>`;
    }

    html = html.replace("{{fav_button}}", buttonHTML);

  return html;
}

export { MovieDetail};
