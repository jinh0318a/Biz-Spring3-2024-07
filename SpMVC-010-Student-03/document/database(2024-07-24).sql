-- 여기는 schooluser 화면tbl_score
use schooldb;

show tables;
desc tbl_score;
desc tbl_student;
desc tbl_subject;

select count(*) from tbl_score;
select * from tbl_score limit 10;

select count(*) from tbl_student;
select * from tbl_student limit 10;

select * from tbl_subject;

/*
학생정보, 성적, 과목정보 3개의 table의 데이터를 import 한 후
다음의 참조무결성 설정 (FK 생성)을 하기위해
먼저 참조 무결성이 성립되는지 검증하기 
LEFT JOIN 이용해서 데이터 검증실시

FK 설정대상
학생정보 : 성적, 과목정보 : 성적
*/

-- 참조무결성을 설정할 두 테이블을 LEFT JOIN 했을때 
-- 결과에 NULL 이 있으면 FK 설정 불가
select * from tbl_score left join tbl_student on sc_stnum = st_num where st_num is null;
select * from tbl_score left join tbl_subject on sc_sbcode = sb_code where sb_code is null;

-- 참조무결성을 유지하기 위하여 FK 설정하기
-- FK는 1:N 의 관계에서 설정하며
-- N 의 테이블에 FK 를 설정한다
alter table tbl_score add constraint FK_subject foreign key (sc_sbcode) references tbl_subject (sb_code) ;

alter table tbl_score  -- 성적 테이블 에 FK 설정
add constraint FK_student 
foreign key (sc_stnum) -- FK 칼럼
references tbl_student (st_num) -- 참조할 테이블 컬럼
on delete cascade -- 참조테이블 데이터를 삭제하면 같이 삭제
on update cascade; -- 참조테이블 학번이 변경되면 같이 변경

alter table tbl_score drop foreign key tbl_score_ibfk_2; 

-- 완전 JOIN
-- 테이블간 FK 가 완전하게 유지되는 경우 사용할수 있는 쿼리
select * 
from tbl_student, tbl_subject, tbl_score 
where st_num = sc_stnum and sc_sbcode = sb_code and st_num='S0001';

-- EQ, Inner JOIN
-- 테이블간 FK 가 설정되고 참조무결성관계가 유지되는 경우 사용하는 쿼리
select *
from tbl_score 
	join tbl_student 
		on sc_stnum = st_num 
	join tbl_subject 
		on sc_sbcode = sb_code 
where st_num='S0001';


