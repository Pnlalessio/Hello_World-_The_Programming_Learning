-- Feedback [ent5]
create table "APP"."FEEDBACK" (
   "OID"  integer  not null,
   "RATING"  integer,
  primary key ("OID")
);


-- Course_Feedback [rel8]
alter table "APP"."FEEDBACK"  add column  "COURSE_OID"  integer;
alter table "APP"."FEEDBACK"   add constraint FK_FEEDBACK_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


