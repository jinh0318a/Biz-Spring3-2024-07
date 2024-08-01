document.addEventListener("DOMContentLoaded", () => {
  const listBox = document.querySelector("article.list");
  const subBox = document.querySelector("article.sub");

  listBox.addEventListener("click", (e) => {
    // listbox 내에서 클릭된 요소
    const target = e.target;
    if (target.tagName === "INPUT" && target.classList.contains("btn-new"))
      alert("새로작성");
  });

  fetch(`${rootPath}/comps/list`)
    .then((res) => res.text())
    .then((html) => (listBox.innerHTML = html));
});
