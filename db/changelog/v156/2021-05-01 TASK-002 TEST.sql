--liquibase formatted sql


--changeset Doomer:20210501-02
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM ALL_TABLES WHERE TABLE_NAME = 'TEST' AND OWNER = 'STROY';
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM TEST WHERE ID = 1;
insert into TEST (ID, CODE, NAME)
values (1, 'TEST', 'Какое-то значение');
--rollback not required


--changeset Doomer:20210501-03
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM ALL_TABLES WHERE TABLE_NAME = 'TEST' AND OWNER = 'STROY';
--precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM TEST WHERE ID = 1;
update TEST
   set NAME = 'CONTEXT USER_ID=' || nvl(SYS_CONTEXT('CLIENTCONTEXT', 'USER_ID'), 'NULL')
 where ID = 1;
--rollback not required
