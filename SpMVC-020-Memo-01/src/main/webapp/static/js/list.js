/* 
새로작성을 위한 코드
새로작성 버튼을 클릭했을 때
날짜를 시스템의 현재 날짜로 생성하고
새로운 메모 입력화면을 오른쪽 article 에 보여주기
*/
document.addEventListener("DOMContentLoaded", () => {
  const timeBox = document.querySelector("div.date-time");
  const m_date = timeBox?.querySelector("input[name='m_date']");
  const m_time = timeBox?.querySelector("input[name='m_time']");
  const btn_new = timeBox?.querySelector("input[type='button']");
  const getToday = () => {
    const today = new Date();
    m_date.value = today.toISOString().split("T")[0];
    m_time.value = today.toISOString().split("T")[1].split(".")[0];
  };

  const onNewHandler = async () => {
    getToday();
    const response = await fetch(`${rootPath}/comps/input`);
    const html = await response.text();
    const subBox = document.querySelector("article.sub");
    subBox.innerHTML = html;
  };

  btn_new.addEventListener("click", onNewHandler);
});

/*
업데이트를 위한 코드
메모 리스트의 항목을 클릭하면
클릭한 항목의 내용을 오른쪽 article 에 보여주고 
Update 준비
*/
document.addEventListener("DOMContentLoaded", () => {
  const memoListBox = document.querySelector("ul.memo-list");
  const memoInputBox = document.querySelector("article.sub");

  const onListClickHandler = (e) => {
    const target = e.target;
    if (target.tagName !== "SPAN") return;
    const m_seq = target.closest("LI").dataset.seq;
    fetch(`${rootPath}/comps/update/${m_seq}`)
      .then((res) => res.text())
      .then((html) => (memoInputBox.innerHTML = html));
  };

  memoListBox.addEventListener("click", onListClickHandler);
});
