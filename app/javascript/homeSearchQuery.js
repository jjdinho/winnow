const homeSearchBtn = document.querySelector("#home-search-button");
const searchResults = document.querySelector("#search-results");

const query = (event) => {
  event.preventDefault();

  const homeSearchQuery = document.querySelector("#home-search-query").value;

  fetch(`home_search_query/${homeSearchQuery}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      data.forEach((article) => {
        console.log('here')
        const item = `<li><a href="${article.url}" target="_blank">${article.title} - ${article.name}</a></li>`
        console.log(item)
        searchResults.insertAdjacentHTML("beforeend", item);
      });
    });
};

const homeSearchBtnListener = () => {
  homeSearchBtn.addEventListener("click", query);
};

document.addEventListener("DOMContentLoaded",function(){
  homeSearchBtnListener();
});
