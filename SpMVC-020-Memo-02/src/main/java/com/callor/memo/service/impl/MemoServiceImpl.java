package com.callor.memo.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.callor.memo.models.Memo;
import com.callor.memo.service.MemoService;

@Service
public class MemoServiceImpl implements MemoService {

	protected final List<Memo> memoList;

	public MemoServiceImpl() {
		super();
		this.memoList = new ArrayList<Memo>();
		this.sampleMemo();
	}

	protected void sampleMemo() {
		LocalDateTime lt = LocalDateTime.now();
		DateTimeFormatter date = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter time = DateTimeFormatter.ofPattern("HH:mm:ss");

		String[] memos = { "설산의 고행을", "없는 사막이 다 보여", "하는 온갖 과실이", "우는 봄날의 잔치는 얼마나", "능히 품으며 그들의", "세상을 하늘아래 두며" };
		/*
		 * Builder 패턴을 사용하여 데이터 객체 만들기 lombok @Builder Annotation 을 사용하면 데이터클래스(Dto,
		 * VO)에 Builder 내부 생성도구가 만들어진다.
		 * 
		 * 1. 객체를 생성하면서 변수를 세팅할때, 변수이름과 동일한 메서드를 통하여 변수를 세팅할 수 있다. 2. 일부 변수의 값을 세팅하지 않고
		 * 싶을때 생략하면서 나머지 변수만 세팅할 수 있다. 3. setter method 를 사용할때 보다 코드가 줄어든다. 4. 생성자 주입을
		 * 통하여 사용할때와 달리 변수의 세팅 순서를 유지하지 않아도된다. 필요한 변수만 세팅할 수 있다.
		 */
		for (String m : memos) {

			String m_seq = UUID.randomUUID().toString();

			Memo memo = Memo.builder().m_seq(m_seq).m_date(lt.format(date)).m_time(lt.format(time)).m_subject(m)
					.m_content(m + lt.format(time)).build();

			memoList.add(memo);
		}

		// 클래스를 사용하여 객체를 생성하고
//		// 객체의 각속성에 값 setting
//		for (String m : memos) {
//			Memo memo = new Memo();
//			memo.setM_seq("");
//			memo.setM_date(lt.format(date));
//			memo.setM_time(lt.format(time));
//			memo.setM_subject(m);
//			memo.setM_content(m + lt.format(time));
//		}

//		// 생성자를 사용하여 객체를 생성하면서 각 속성들을 생성자에 주입하여 만드는 방법
//		for (String m : memos) {
//			Memo memo = new Memo("", lt.format(date), lt.format(time), m, m + lt.format(time));
//		}
	}

	@Override
	public List<Memo> selectAll() {
		return memoList;
	}

	@Override
	public Memo findById(String m_seq) {
		/*
		 * memoList 에 저장된 요소중 m_seq 값이 매개변수로 전달받은 m_seq 와 일치하는 값이 있으면 그 메모를 return
		 */
		for (Memo memo : memoList) {
			if (memo.getM_seq().equals(m_seq)) {
				return memo;
			}
		}
		return null;
	}

	@Override
	public int insert(Memo memo) {
		String m_seq = UUID.randomUUID().toString();
		memo.setM_seq(m_seq);
		memoList.add(memo);

		return memoList.size();
	}

	@Override
	public int update(Memo memo) {
		String m_seq = memo.getM_seq();
//		int nSize = memoList.size();
//		int index;
//		for (index = 0; index < nSize; index++) {
//			if (memoList.get(index).getM_seq().equals(m_seq))
//				break;
//		}
		// memoList.set(index, memo);

		/*
		 * 자바 8 이상에서 사용하는 List<T> type 의 데이터 요소를 교체하는 코드 1. memoList 전체를 forEach 반복하기 2.
		 * 각 요소를 변수 m 에 담아 내부 함수로 전달 3. 요소의 m_seq 값이 매개변수로 받은 memo 의 m_seq 값과 같으면 memo
		 * return 4. 그렇지 않으면 자신을 return
		 * 
		 * 그리하여 전달받은 데이터의 memo 를 memoList 의 요소로 교체하기
		 * 
		 * java 의 화살표함수를 lambda 함수라고 한다 javascript 와 비슷한 객체 함수
		 */
		memoList.replaceAll(m -> m.getM_seq().equals(m_seq) ? memo : m);

		return 0;
	}

	@Override
	public int delete(String m_seq) {
		int index = 0;

		/*
		 * forEach 반복문을 순회하면서 m_seq 가 일치하는 memo 요소를 찾는다 일치하는 요소를 찾으면 break 를 실행하여
		 * forEach 를 중단 이때 index 는 찾은 요소의 index 가 된다 forEach 다음에서 remove 를 실행하여 요소를 삭제한다
		 */

		for (Memo m : memoList) {
			if (m.getM_seq().equals(m_seq))
				break;
			index++;
		}
		memoList.remove(index);

		/*
		 * memoList 를 forEach() 로 반복하면서 m_seq 를 검사하여 삭제 대상을 찾으면 remove() 실행하여 요소를 삭제한다
		 * 
		 * 이코드는 표면상으로 정상적으로 작동하는 것처럼 보인다 하지만, 내부에서 indexOutOfBind Exception 이 발생할 수 있고
		 * 메모리 누수 등의 문제를 일으킬 수 있다. 가급적 이 코드를 사용하지 않는것이 좋다.
		 */

//		int index = 0;
//		for (Memo m : memoList) {
//			if (m.getM_seq().equals(m_seq))
//				memoList.remove(index);
//			index++;
//		}

		return 0;
	}

}
