const INPUT_INDEX = {
  username: 0,
  password: 1,
  name: 2,
  nick: 3,
  button: 4,
};
const ERROR_MESSAGE = [
  "* ID 는 반드시 입력하세요",
  "* 비밀번호는 반드시 입력하세요",
  "* 본명은 반드시 입력하세요",
  "* 닉네임은 반드시 입력하세요",
];

document.addEventListener("DOMContentLoaded", () => {
  const join_form = document.querySelector("form.user.join");

  // form > input 전체를 배열로 추출하기
  const join_inputs = join_form.querySelectorAll("input");
  const error_inputs = join_form.querySelectorAll("span");

  const emptyValid = (index) => {
    const text = join_inputs[index].value;
    if (!text) {
      error_inputs[index].textContent = ERROR_MESSAGE[index];
      error_inputs[index].style.display = "inline-block";
      join_inputs[index].select();
      return false;
    }
    return true;
  };

  const onJoinSubmit = () => {
    // alert("button click");
    // 유사 배열을 순수 배열로 변경하기
    Array.from(error_inputs).forEach((span) => (span.style.display = "none"));

    const input_values_array = Array.from(join_inputs);

    input_values_array.forEach((_, index) => {
      if (emptyValid(index)) return false;
    });
    // const input_values = input_values_array.map((input) => input.value);
    // if (!input_values[INPUT_INDEX.username]) {
    //   const error_input = error_inputs[INPUT_INDEX.username];
    //   error_input.textContent = ERROR_MESSAGE[INPUT_INDEX.name];
    //   error_input.style.display = "inline-block";
    //   join_inputs[INPUT_INDEX.username].select();
    //   return false;
    // }
  };

  // join_inputs[4]
  join_inputs[INPUT_INDEX.button].addEventListener("click", onJoinSubmit);
});
