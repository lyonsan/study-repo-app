document.addEventListener("DOMContentLoaded", function() {
  const btn = document.querySelector('#box')
  const nav = document.querySelector('nav');

  btn.addEventListener('click', () => {
    nav.classList.toggle('open-menu')
  })
})
