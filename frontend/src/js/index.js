import '../style/index.styl';

//import npm packages, node modules, other files here

window.addEventListener('load', function() {
    const p = document.createElement('p');
    p.innerHTML = 'hello world';
    document.body.insertBefore(p, document.body.firstChild);
});