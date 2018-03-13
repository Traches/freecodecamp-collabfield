document.addEventListener( 'DOMContentLoaded', function() {
  let hamburger = document.getElementById("hamburger");
  hamburger.addEventListener("click", function() {
    let menu = document.getElementById("main-menu");
    menu.classList.toggle("mobile-hidden");
  })

});
