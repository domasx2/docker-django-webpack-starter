import '../style/index.styl';
import hamster_img_url from '../images/hamster.jpg';

//import npm packages, node modules, other files here

window.addEventListener('load', function() {
    const p = document.createElement('p');
    p.innerHTML = 'hello world';
    document.body.insertBefore(p, document.body.firstChild);

    const img = document.createElement('img');
    img.src = hamster_img_url;
    document.body.insertBefore(img, document.body.firstChild);
});