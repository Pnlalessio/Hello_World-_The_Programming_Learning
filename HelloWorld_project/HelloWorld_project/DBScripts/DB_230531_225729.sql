-- Curriculum [ent2]
create table "APP"."CURRICULUM" (
   "OID"  integer  not null,
   "PDF"  varchar(255),
  primary key ("OID")
);


-- User_Curriculum [rel2]
alter table "APP"."CURRICULUM"  add column  "USER_OID"  integer;
alter table "APP"."CURRICULUM"   add constraint FK_CURRICULUM_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


