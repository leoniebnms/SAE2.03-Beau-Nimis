
let MovieFeatured = {};

MovieFeatured.format =  async function (movies) {

  let templateFile = await fetch("./component/MovieFeatured/template.html");
  let template = await templateFile.text();

  let templatecardFile = await fetch("./component/MovieFeatured/template-card.html");
  let cardTemplate = await templatecardFile.text();

  if (!movies || movies.length === 0) {
    return `<p class="featured__empty">Aucun film à l'affiche pour le moment.</p>`;
  }


  let allCardsHtml = "";
  for (let movie of movies) {
    let card = cardTemplate;
    card = card.replace('{{image}}', movie.image);
    card = card.replace('{{name}}', movie.name);

    allCardsHtml += card;
  }
    
  let html = template.replace ("{{movies__cards}}", allCardsHtml);

  return html;
};

export { MovieFeatured};
