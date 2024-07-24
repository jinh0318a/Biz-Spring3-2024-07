document.addEventListener("DOMContentLoaded", () => {
  const section_detail = document.querySelector("section.student.detail");
  const btn_list = section_detail?.querySelector("button.list");
  const btn_update = section_detail?.querySelector("button.update");
  const btn_delete = section_detail?.querySelector("button.delete");

  btn_list?.addEventListener("click", () => {
    document.location.href = `${rootPath}/`;
  });

  // 익명 함수로 선언하기
  // 외부에 함수를 선언하지 않고 직접 선언한 함수 몸체에서 handler 추가
  // 함수를 한번만 사용하고 다른곳에서는 사용하지 않을꺼라는 예측으로 만듬
  // 익명함수로 handler 를 선언하는 것을 Call Back 함수 선언 이라고도 한다.
  btn_delete?.addEventListener("click", (e) => {
    if (confirm("정말 학생정보를 삭제할까요?")) {
      // 클릭된 버튼의 부모태그 중에서 가장 가까이 있는 태그에 data-st_num 으로 설정된 값을 추출하고
      // 그 값을 서버의 delete 에게 보내서 삭제 요청
      const st_num = e.target.closest("div").dataset.st_num;
      document.location.replace(`${rootPath}/delete?st_num=${st_num}`);
    }
  });

  btn_update?.addEventListener("click", (e) => {
    // update 버튼을 감싸고 있는 div 가 가지고 있는 st_num 변수 값을 추출하기
    const st_num = e.target.closest("div").dataset.st_num;

    // update 로 st_num 전달
    document.location.href = `${rootPath}/update?num=${st_num}`;
  });
});
