document.addEventListener( 'DOMContentLoaded', function() {
  let hamburger = document.getElementById("hamburger");
  hamburger.addEventListener("click", function() {
    let menu = document.getElementById("main-menu");
    menu.classList.toggle("mobile-hidden");
  })

  let dropdownButton = document.getElementById("dropdown-button");
  dropdownButton.addEventListener("click", function() {
    let dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.toggle("hidden");
  })
 
});
