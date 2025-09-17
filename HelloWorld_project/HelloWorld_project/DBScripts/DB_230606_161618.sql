-- Support [ent1]
create table "APP"."SUPPORT" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "DESCRIPTION"  clob(10000),
   "STATUS"  varchar(255),
   "SOLUTION"  clob(10000),
   "INSERTION_DATE"  date,
  primary key ("OID")
);


-- Support_User [rel2]
alter table "APP"."SUPPORT"  add column  "USER_OID"  integer;
alter table "APP"."SUPPORT"   add constraint FK_SUPPORT_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


