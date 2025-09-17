-- Feedback [ent1]
create table "APP"."FEEDBACK_2" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- Group_Feedback [rel1]
create table "APP"."GROUP_FEEDBACK" (
   "GROUP_OID"  integer not null,
   "FEEDBACK_2_OID"  integer not null,
  primary key ("GROUP_OID", "FEEDBACK_2_OID")
);
alter table "APP"."GROUP_FEEDBACK"   add constraint FK_GROUP_FEEDBACK_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_FEEDBACK"   add constraint FK_GROUP_FEEDBACK_FEEDBACK_2 foreign key ("FEEDBACK_2_OID") references "APP"."FEEDBACK_2" ("OID");


