let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();

let NavBar = {};

NavBar.format = function (hAbout, hHome, hCategory, categories=[]) {
  let html = template;

  // html = html.replace("{{hAbout}}", hAbout);
  html = html.replace("{{hHome}}", hHome);
  html = html.replace("{{hCategory}}", hCategory);

  let listHTML = categories.map(cat => `
    <li class="dropdown__item" onclick="C.handlerCategoryById(${cat.id})">
      ${cat.name}
    </li>
  `).join('');

  html = html.replace('<ul class="dropdown__content" id="nav__categories--list"></ul>', 
                      `<ul class="dropdown__content" id="nav__categories--list">${listHTML}</ul>`);

  return html;
};

export { NavBar };
