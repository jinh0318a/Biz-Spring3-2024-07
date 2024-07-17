document.addEventListener("DOMContentLoaded", () => {
  const student_table = document.querySelector("table.student.list");

  /* 객체?.fun() 
     객체 요소가 null 이 아닐때만 fun() 함수 실행
     null safe code 라고 한다.
  */
  const student_data = student_table?.querySelector("tbody");

  const onDataClickHandler = (e) => {
    // click event 가 최초로 발생한 요소 = target
    const target = e.target;
    if (target.tagName === "TD") {
      // 클릭된 TD 태그를 감싸고 있는 부모태그(closest) 중에서 가장 가까이 있는 TR을 선택
      const tr = target.closest("TR");
      const st_num = tr.dataset.st_num;
      // 선택된 st_num 를 서버(controller)에게 요청하여 학생의 detail 정보를 보고싶다
      document.location.href = `${rootPath}/detail?st_num=${st_num}`;

      //  alert(st_num);
      //   const st_num = target.dataset.st_num;
      //   alert(st_num);
    }
  };

  student_data?.addEventListener("click", onDataClickHandler);
});
