if (location.pathname.match("articles/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("articles_tag_tag_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("articles_tag_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `tagsearch/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();

      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("articles_tag_tag_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};