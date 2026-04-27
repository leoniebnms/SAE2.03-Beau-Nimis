
let MovieDetail = {};

MovieDetail.format =  async function (movie) {

  let templateFile = await fetch("./component/MovieDetail/template.html");
  let template = await templateFile.text();
  
  let html = template;
  
  html = html.replaceAll("{{name}}", movie.name);
  html = html.replace("{{image}}", movie.image);
  html = html.replace("{{length}}", movie.length);
  html = html.replace("{{description}}", movie.description);
  html = html.replace("{{director}}", movie.director);
  html = html.replace("{{year}}", movie.year);
  html = html.replace("{{id_category}}", movie.category_name);
  html = html.replace("{{min_age}}", movie.min_age);
  html = html.replace("{{trailer}}", movie.trailer);

  return html;
}

export { MovieDetail};
