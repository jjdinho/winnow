const homeSearchBtn = document.querySelector("#home-search-button");
const searchResults = document.querySelector("#search-results");

const checkCheckbox = (checkbox) => {
  if (checkbox.checked == true) {
    return checkbox.value
  } else {
    return ""
  }
}

const query = (event) => {
  event.preventDefault();

  searchResults.innerHTML = "";

  const homeSearchQuery = document.querySelector("#home-search-query").value;
  const encodedQuery = encodeURI(homeSearchQuery);

  const cnn = checkCheckbox(document.querySelector("#cnn-checkbox"));
  const foxNews = checkCheckbox(document.querySelector("#fox-news-checkbox"));
  const nytimes = checkCheckbox(document.querySelector("#the-new-york-times-checkbox"));
  const wsj = checkCheckbox(document.querySelector("#the-wall-street-journal-checkbox"));
  const washingtonPost = checkCheckbox(document.querySelector("#the-washington-post-checkbox"));

  const sourceArray = [];
  if (cnn !== "") { sourceArray.push(cnn); }
  if (foxNews !== "") { sourceArray.push(foxNews); }
  if (nytimes !== "") { sourceArray.push(nytimes); }
  if (wsj !== "") { sourceArray.push(wsj); }
  if (washingtonPost !== "") { sourceArray.push(washingtonPost); }

  console.log(`home_search_query/${encodedQuery}/${sourceArray}.json`)

  fetch(`home_search_query/${encodedQuery}/${sourceArray}.json`)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      data.forEach((article) => {
        const item = `<li><a href="${article.url}" target="_blank">${article.title} - ${article.name}</a></li>`
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
