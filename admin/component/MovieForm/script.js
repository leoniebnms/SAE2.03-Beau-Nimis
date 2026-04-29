

let templateFile = await fetch('./component/MovieForm/template.html');
let template = await templateFile.text();


let MovieForm = {};

MovieForm.format = function(handler, categories){
    let html= template;
    html = html.replace('{{handler}}', handler);

    let optionsHtml = categories.map(c => `<option value="${c.id}">${c.name}</option>`).join('');
    html = html.replace('{{categories_options}}', optionsHtml);

    return html;
}


export {MovieForm}; 
