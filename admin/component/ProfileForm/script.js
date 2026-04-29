let templateFile = await fetch('./component/ProfileForm/template.html');
let template = await templateFile.text();


let ProfileForm = {};

ProfileForm.format = function(handler){

    let html= template;
    html = html.replace('{{handler}}', handler);

    return html;
}

ProfileForm.formatList = function(profiles) {
    const listItems = profiles.map(p => `
        <div>
            <span>${p.name} (${p.age} ans)</span>
            <button onclick="C.handlerEditProfile(${p.id})">
                Modifier
            </button>
        </div>
    `);

    return `
        <div class="adminSection">
            <h2 class="adminSection__title">Modifier un profil</h2>
            <div class="adminSection__list">
                ${profiles.map(p => `
                    <div class="adminItem">
                        <div class="adminItem__info">
                            <span class="adminItem__name">${p.name}</span>
                            <span class="adminItem__age">(${p.age} ans)</span>
                        </div>
                        <button class="adminItem__btn" onclick="C.handlerEditProfile(${p.id})">
                            Modifier
                        </button>
                    </div>
                `).join('')}
            </div>
        </div>`;
}

export {ProfileForm}; 
