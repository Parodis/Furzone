function headerSearch() {
    let search = document.querySelector('#headerSearch'),
        headerNavigation = document.querySelector('#headerNavigation'),
        headerOptions = document.querySelector('#headerOptions'),
        searchInput = document.querySelector('#searchInput');

    search.addEventListener('click', () => {
        console.log('click');
        headerNavigation.classList.add('header__navigation--shorted');
        headerOptions.classList.add('header__options--expanded');
        searchInput.classList.add('animated');
    });
}
headerSearch();

function mobileMenu() {
    let mobileMenu = selectQuery('#mobileMenu'),
        headerMenu = selectQuery('.header__menu'),
        options = selectQuery('.header__options'),
        childs = getChildElements(headerMenu),
        childCount;

    mobileMenu.addEventListener('click', () => {
        options.classList.toggle('header__options--active')
        mobileMenu.classList.toggle('is-active');
        headerMenu.classList.toggle('header__menu--active');

        for (childCount = 0; childCount < childs.length; childCount++) {
            childs[childCount].classList.toggle('animation-bounceIn');
        }
    });
}
mobileMenu()

function showPass() {
    let showLink = selectQuery('#showPass'),
        password = selectQuery('#password');

    showLink.addEventListener('click', () => {
        if (password.getAttribute('type') == 'password')
            password.setAttribute('type', 'text')
        else
            password.setAttribute('type', 'password');
    })
}
showPass();

function togglePopup() {
    let popup = selectQuery('#loginPopup'),
        signInLink = selectQuery('#signInLink'),
        loginWrapper = selectQuery('#loginWrapper');

    signInLink.addEventListener('click', (event) => {
        event.preventDefault();
        popup.classList.toggle('login__opened');
    });
    popup.addEventListener('click', (event) => {
        if (!event.path.includes(loginWrapper)) {
            popup.classList.toggle('login__opened');
        }

    });
}
togglePopup();

function formSignUp() {
    let signUpLink = selectQuery('#signUpLink'),
        formAction = selectQuery('#formAction'),
        passwordRepeat = selectQuery('#passwordRepeat'),
        loginHeader = selectQuery('#loginHeader'),
        forgotPassLink = selectQuery('#forgotPassLink'),
        submitButton = selectQuery('#submitButton'),
        forgotPassGroup = selectQuery('#forgotPassGroup');


    signUpLink.addEventListener('click', (event) => {
        event.preventDefault();
        if (formAction.getAttribute('value') == 'log') {
            formAction.setAttribute('value', 'sign');
            loginHeader.innerText = 'SIGN UP';
            signUpLink.innerText = 'I have an account';
            submitButton.innerText = 'SIGN UP';
            passwordRepeat.classList.toggle('login__form-group--invisible');
            forgotPassLink.classList.toggle('login__form-group--invisible');
        } else {
            formAction.setAttribute('value', 'log');
            loginHeader.innerText = 'SIGN IN';
            submitButton.innerText = 'SIGN IN';
            passwordRepeat.classList.toggle('login__form-group--invisible');
            if (forgotPassLink.classList.contains('login__form-group--invisible')) {
                forgotPassLink.classList.remove('login__form-group--invisible')
            }
        }

    });
    forgotPassLink.addEventListener('click', (event) => {
        event.preventDefault();
        formAction.setAttribute('value', 'forgot');
        if (!passwordRepeat.classList.contains('login__form-group--invisible')) {
            passwordRepeat.classList.add('login__form-group--invisible')
        }
        loginHeader.innerText = 'SEND PASS';
        submitButton.innerText = 'SEND PASS';
        forgotPassLink.classList.toggle('login__form-group--invisible');
        forgotPassGroup.classList.toggle('login__form-group--invisible');
        signUpLink.classList.toggle('login__form-group--invisible');
    })

}
formSignUp();

function loginFormSubmit() {
    let loginForm = selectQuery('#login_form'),
        login = selectQuery('#login_form #email'),
        password = selectQuery('#login_form #password');

    loginForm.addEventListener('submit', (event) => {
        console.log(loginForm);
        let data = new FormData(loginForm),
            xmlhttp = new XMLHttpRequest();

        console.log('submit');
        event.preventDefault();


        xmlhttp.open("POST", loginForm.getAttribute('action'), true);

        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState != 4) return;

            if (xmlhttp.status == 200) {

            } else {
                console.log(xmlhttp.statusText);
            }
        }
        xmlhttp.send(data);
    });
}

loginFormSubmit();


/* Utils */

function selectQuery(query) {
    return document.querySelector(query);
}

function getChildElements(el) {
    let childs = el.childNodes,
        childCount,
        nodes = [];

    for (childCount = 0; childCount < childs.length; childCount++) {
        if (childs[childCount].nodeType != 1) continue;
        nodes.push(childs[childCount]);
    }
    return nodes;
}
