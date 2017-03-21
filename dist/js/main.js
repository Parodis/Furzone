'use strict';

function headerSearch() {
    var search = document.querySelector('#headerSearch'),
        headerNavigation = document.querySelector('#headerNavigation'),
        headerOptions = document.querySelector('#headerOptions'),
        searchInput = document.querySelector('#searchInput');

    search.addEventListener('click', function (e) {
        e.preventDefault();
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

    if (signInLink) {
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
}

togglePopup();

function formSignUp() {
    var signUpLink = selectQuery('#signUpLink'),
        formAction = selectQuery('#formAction'),
        passwordRepeat = selectQuery('#passwordRepeat'),
        loginHeader = selectQuery('#loginHeader'),
        forgotPassLink = selectQuery('#forgotPassLink'),
        submitButton = selectQuery('#submitButton'),
        forgotPassGroup = selectQuery('#forgotPassGroup'),
        loginForm = selectQuery('#login_form');

    signUpLink.addEventListener('click', function (event) {
        event.preventDefault();
        if (formAction.getAttribute('value') == 'log') {
            loginForm.setAttribute('action', '/register/');
            formAction.setAttribute('value', 'sign');
            loginHeader.innerText = 'SIGN UP';
            signUpLink.innerText = 'I have an account';
            submitButton.innerText = 'SIGN UP';
            passwordRepeat.classList.toggle('login__form-group--invisible');
            forgotPassLink.classList.toggle('login__form-group--invisible');
        } else {
            loginForm.setAttribute('action', '/login/');
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
            var response = JSON.parse(xmlhttp.responseText);
            if (xmlhttp.status == 200) {
                if (response.message == "Success") {
                    location.reload();
                }
            } else {
                console.log(xmlhttp.statusText);
            }
        };
        xmlhttp.send(data);
    });
}

loginFormSubmit();

function newsletterForm() {
    var newsletter = selectQuery('#newsLetter'),
        newsletterMessage = selectQuery('#newsletterMessage');
    // validator = new FormValidator('newsletter', [{
    //     name: 'email',
    //     rules: 'required|valid_email'
    // }], function(errors, event) {
    //
    //     if (errors.length > 0) {
    //         let length = errors.length,
    //             element;
    //         for (let i = 0; i < length; i++) {
    //             console.log(errors[i]);
    //             // element = selectQuery(errors[i].element);
    //             console.log(errors[i].element.setAttribute('value', errors[i].message));
    //         }
    //     }
    // });

    if (newsletter) {
        newsletter.addEventListener('submit', function (event) {
            var data = new FormData(newsletter),
                xmlhttp = new XMLHttpRequest();
            event.preventDefault();

            xmlhttp.open("POST", newsletter.getAttribute('action'), true);

            xmlhttp.onreadystatechange = function () {

                if (xmlhttp.readyState != 4) return;
                newsletterMessage.classList.add('newsletter__error--hidden');
                var response = JSON.parse(xmlhttp.response);
                console.log(response.message);
                if (xmlhttp.status == 200) {
                    newsletterMessage.classList.toggle('newsletter__error--success');
                    console.log(xmlhttp.statusText);
                } else {

                    console.log(xmlhttp.statusText);
                }
                newsletterMessage.innerText = response.message;
                newsletterMessage.classList.remove('newsletter__error--hidden');
            };
            xmlhttp.send(data);
        });
    }
}
newsletterForm();

function addToCart() {
    var form = selectQuery('#addToCartForm'),
        spinner = selectQuery('.buy__spinner'),
        message = selectQuery('.buy__message-span');

    if (form) {
        form.addEventListener('click', function (event) {
            message.classList.remove('buy__message-span--visible');
            spinner.classList.add('buy__spinner--visible');
            var data = new FormData(form),
                xmlhttp = new XMLHttpRequest();
            event.preventDefault();

            xmlhttp.open("POST", form.getAttribute('action'), true);

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState != 4) return;
                var response = JSON.parse(xmlhttp.response);
                message.innerText = response.message;
                setTimeout(function () {
                    spinner.classList.remove('buy__spinner--visible');
                    message.classList.add('buy__message-span--visible');
                }, 400);
            };
            xmlhttp.send(data);
        });
    }
}
addToCart();

function categoryFilter() {
    var formFilter = selectQuery('#formFilter'),
        categoryLoader = selectQuery('#categoryLoader'),
        categorySection = selectQuery('#categorySection');

    if (categorySection) {
        categorySection.addEventListener('change', function (event) {
            categoryLoader.classList.toggle('category__loader--visible');
        });
    }
}
categoryFilter();

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