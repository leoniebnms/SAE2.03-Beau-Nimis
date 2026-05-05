let templateFile = await fetch('./component/ProfileForm/template.html');
let template = await templateFile.text();

let templateUpdateFile = await fetch('./component/ProfileForm/template-update.html');
let templateUpdate = await templateUpdateFile.text();

let templateListFile = await fetch('./component/ProfileForm/template-list.html');
let templateList = await templateListFile.text();


let ProfileForm = {};

ProfileForm.format = function(handler){

    let html= template;
    html = html.replace('{{handler}}', handler);

    return html;
}

ProfileForm.formatList = function(profiles) {
   
    const itemsHtml = profiles.map(p => {
        return templateUpdate
            .replace('{{name}}', p.name)
            .replace('{{age}}', p.age)
            .replace('{{id}}', p.id);
    }).join('');

    return templateList.replace('{{items}}', itemsHtml);
}

export {ProfileForm}; 
