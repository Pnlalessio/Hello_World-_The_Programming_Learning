-- Tutor [ent1]
create table "APP"."TRAINER" (
   "USER_OID"  integer  not null,
   "OID"  integer  not null,
   "DESCRIPTION"  clob(10000),
   "ISAPPROVED"  integer,
  primary key ("USER_OID")
);


-- GEN FK: Tutor --> User
alter table "APP"."TRAINER"   add constraint FK_TRAINER_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


