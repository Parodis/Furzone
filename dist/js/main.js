function headerSearch() {
    let search = document.querySelector('#headerSearch'),
        headerNavigation = document.querySelector('#headerNavigation'),
        headerOptions = document.querySelector('#headerOptions'),
        searchInput = document.querySelector('#searchInput');

    search.addEventListener('click', function() {
        console.log('click');
        addClass(headerNavigation, 'header__navigation--shorted');
        addClass(headerOptions, 'header__options--expanded');
        addClass(searchInput, 'animated');
    });
}
headerSearch();


/* work with classes */

function hasClass(el, className) {
    if (el.classList)
        el.classList.contains(className);
    else
        new RegExp('(^| )' + className + '( |$)', 'gi').test(el.className);
}

function addClass(el, className) {
    if (el.classList)
        el.classList.add(className);
    else
        el.className += ' ' + className;
}

function removeClass(el, className) {
    if (el.classList)
        el.classList.remove(className);
    else
        el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
}
