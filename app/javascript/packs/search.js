document.addEventListener("DOMContentLoaded", function() {
  const btn = document.querySelector('#search-box')
  const search = document.querySelector('#hidden');

  btn.addEventListener('click', () => {
    search.classList.toggle('search-menu')
  })
})
