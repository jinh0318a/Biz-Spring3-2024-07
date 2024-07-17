# Spring MVC Project
- 학생관리 시스템 2024

## DBMS 와 연동된 Spring MVC Project
- MySQL, MyBatis 를 연동하여 학생관리 CRUD 를 구현하는 프로젝트
- MySQL, MyBatis 를 연동하여 프로젝트를 구현하기 위하여 `maven dependencies`를 설정해야 한다.
- 필요한 dependencies 는 `spring-jdbc`, `mybatis`, `mybatis-spring`, `commons-dbcp2`, `mysql-connector`가 필요하다.

- 다음의 dependencies 를 `maven repository`에서 검색하여 `pom.xml`에 등록한다.
```xml
<!-- spring jdbc로 검색
 	 spring webmvc와 버전 일치
 -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>5.2.25.RELEASE</version>
</dependency>

<!-- mybatis 로 검색
-->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.5.16</version>
</dependency>

<!-- mybatis-spring
	 spring-webmvc 5.2.x.RELEASE 를 사용할때는 3.0.0 dlgk 버전을 사용
 -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>3.0.0</version>
</dependency>

<!-- dpcp 로 검색하여 commons-dbcp2 를 사용 -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-dbcp2</artifactId>
    <version>2.12.0</version>
</dependency>

<!-- mysql 로 검색하여 반드시 mysql-connector-j 를 사용한다 (mysql-connector-java 는 한글 문제와 timezone 설정부분에서 문제를 일으킬수 있음) -->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.4.0</version>
</dependency>

```