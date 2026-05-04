
let MovieFeatured = {};

MovieFeatured.format =  async function (movies) {

  let templateFile = await fetch("./component/MovieFeatured/template.html");
  let template = await templateFile.text();


  if (!movies || movies.length === 0) {
    return `<p class="featured__empty">Aucun film à l'affiche pour le moment.</p>`;
  }

  let movie = movies[0];

  let html = template;
    
  html = html.replaceAll("{{name}}", movie.name);
  html = html.replace("{{image}}", movie.image);
  html = html.replace("{{description}}", movie.description);

  return html;
};

export { MovieFeatured};
