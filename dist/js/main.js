function headerSearch() {
    let search = document.querySelector('#headerSearch'),
        headerNavigation = document.querySelector('#headerNavigation'),
        headerOptions = document.querySelector('#headerOptions'),
        searchInput = document.querySelector('#searchInput');

    search.addEventListener('click', function() {
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

    mobileMenu.addEventListener('click', function() {
        options.classList.toggle('header__options--active')
        mobileMenu.classList.toggle('is-active');
        headerMenu.classList.toggle('header__menu--active');

        for (childCount = 0; childCount < childs.length; childCount++) {
            childs[childCount].classList.toggle('animation-bounceIn');
        }


    });
}
mobileMenu()


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
