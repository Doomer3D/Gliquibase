--liquibase formatted sql


--changeset Doomer:20210508-01
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM ALL_TABLES WHERE TABLE_NAME = 'TEST' AND OWNER = 'STROY';
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM TEST WHERE ID in (2,3,4);
insert all 
  into TEST (ID, CODE, NAME) values (2, 'TEST_2', 'Тестовое значение 2')
  into TEST (ID, CODE, NAME) values (3, 'TEST_3', 'Тестовое значение 3')
  into TEST (ID, CODE, NAME) values (4, 'TEST_4', 'Тестовое значение 4')
select count(*) from dual;
--rollback not required
