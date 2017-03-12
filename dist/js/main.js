'use strict';

function headerSearch() {
    var search = document.querySelector('#headerSearch'),
        headerNavigation = document.querySelector('#headerNavigation'),
        headerOptions = document.querySelector('#headerOptions'),
        searchInput = document.querySelector('#searchInput');

    search.addEventListener('click', function () {
        console.log('click');
        headerNavigation.classList.add('header__navigation--shorted');
        headerOptions.classList.add('header__options--expanded');
        searchInput.classList.add('animated');
    });
}
headerSearch();

function mobileMenu() {
    var mobileMenu = selectQuery('#mobileMenu'),
        headerMenu = selectQuery('.header__menu'),
        options = selectQuery('.header__options'),
        childs = getChildElements(headerMenu),
        childCount = void 0;

    mobileMenu.addEventListener('click', function () {
        options.classList.toggle('header__options--active');
        mobileMenu.classList.toggle('is-active');
        headerMenu.classList.toggle('header__menu--active');

        for (childCount = 0; childCount < childs.length; childCount++) {
            childs[childCount].classList.toggle('animation-bounceIn');
        }
    });
}
mobileMenu();

function showPass() {
    var showLink = selectQuery('#showPass'),
        password = selectQuery('#password');

    showLink.addEventListener('click', function () {
        if (password.getAttribute('type') == 'password') password.setAttribute('type', 'text');else password.setAttribute('type', 'password');
    });
}
showPass();

function togglePopup() {
    var popup = selectQuery('#loginPopup'),
        signInLink = selectQuery('#signInLink'),
        loginWrapper = selectQuery('#loginWrapper');

    signInLink.addEventListener('click', function (event) {
        event.preventDefault();
        popup.classList.toggle('login__opened');
    });
    popup.addEventListener('click', function (event) {
        if (!event.path.includes(loginWrapper)) {
            popup.classList.toggle('login__opened');
        }
    });
}
togglePopup();

function formSignUp() {
    var signUpLink = selectQuery('#signUpLink'),
        formAction = selectQuery('#formAction'),
        passwordRepeat = selectQuery('#passwordRepeat'),
        loginHeader = selectQuery('#loginHeader'),
        forgotPassLink = selectQuery('#forgotPassLink'),
        submitButton = selectQuery('#submitButton'),
        forgotPassGroup = selectQuery('#forgotPassGroup');

    signUpLink.addEventListener('click', function (event) {
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
                forgotPassLink.classList.remove('login__form-group--invisible');
            }
        }
    });
    forgotPassLink.addEventListener('click', function (event) {
        event.preventDefault();
        formAction.setAttribute('value', 'forgot');
        if (!passwordRepeat.classList.contains('login__form-group--invisible')) {
            passwordRepeat.classList.add('login__form-group--invisible');
        }
        loginHeader.innerText = 'SEND PASS';
        submitButton.innerText = 'SEND PASS';
        forgotPassLink.classList.toggle('login__form-group--invisible');
        forgotPassGroup.classList.toggle('login__form-group--invisible');
        signUpLink.classList.toggle('login__form-group--invisible');
    });
}
formSignUp();

function loginFormSubmit() {
    var loginForm = selectQuery('#login_form'),
        login = selectQuery('#login_form #email'),
        password = selectQuery('#login_form #password');

    loginForm.addEventListener('submit', function (event) {
        var data = new FormData(loginForm),
            xmlhttp = new XMLHttpRequest();
        event.preventDefault();

        xmlhttp.open("POST", loginForm.getAttribute('action'), true);

        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState != 4) return;

            if (xmlhttp.status == 200) {} else {
                console.log(xmlhttp.statusText);
            }
        };
        xmlhttp.send(data);
    });
}

loginFormSubmit();

function newsletterForm() {
    var newsletter = selectQuery('#newsLetter'),
        validator = new FormValidator('newsletter', [{
        name: 'email',
        rules: 'required|valid_email'
    }], function (errors, event) {

        if (errors.length > 0) {
            var length = errors.length,
                element = void 0;
            for (var i = 0; i < length; i++) {
                console.log(errors[i]);
                // element = selectQuery(errors[i].element);
                console.log(errors[i].element.setAttribute('value', errors[i].message));
            }
        }
    });

    newsletter.addEventListener('submit', function (event) {
        var data = new FormData(newsletter),
            xmlhttp = new XMLHttpRequest();
        event.preventDefault();

        xmlhttp.open("POST", newsletter.getAttribute('action'), true);

        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState != 4) return;

            if (xmlhttp.status == 200) {
                console.log(xmlhttp.statusText);
            } else {
                console.log(xmlhttp.statusText);
            }
        };
        xmlhttp.send(data);
    });
}
newsletterForm();

/* Utils */

function selectQuery(query) {
    return document.querySelector(query);
}

function getChildElements(el) {
    var childs = el.childNodes,
        childCount = void 0,
        nodes = [];

    for (childCount = 0; childCount < childs.length; childCount++) {
        if (childs[childCount].nodeType != 1) continue;
        nodes.push(childs[childCount]);
    }
    return nodes;
}