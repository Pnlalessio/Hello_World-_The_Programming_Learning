-- Curriculum [ent3]
create table "APP"."CURRICULUM" (
   "OID"  integer  not null,
   "CURRICULUM"  varchar(255),
  primary key ("OID")
);


-- Lesson [ent4]
create table "APP"."LESSON" (
   "OID"  integer  not null,
   "DESCRIPTION"  clob(10000),
   "NAME"  varchar(255),
   "VIDEO"  varchar(255),
  primary key ("OID")
);


-- Exercise [ent5]
create table "APP"."EXERCISE" (
   "OID"  integer  not null,
   "QUESTION"  clob(10000),
   "NAME"  varchar(255),
   "OPTION_1"  varchar(255),
   "OPTION_2"  varchar(255),
   "OPTION_3"  varchar(255),
   "OPTION_4"  varchar(255),
   "SOLUTION"  varchar(255),
  primary key ("OID")
);


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Curriculum [rel3]
alter table "APP"."CURRICULUM"  add column  "USER_OID"  integer;
alter table "APP"."CURRICULUM"   add constraint FK_CURRICULUM_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Course_Lesson [rel4]
alter table "APP"."LESSON"  add column  "COURSE_OID"  integer;
alter table "APP"."LESSON"   add constraint FK_LESSON_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Lesson_Exercise [rel5]
alter table "APP"."EXERCISE"  add column  "LESSON_OID"  integer;
alter table "APP"."EXERCISE"   add constraint FK_EXERCISE_LESSON foreign key ("LESSON_OID") references "APP"."LESSON" ("OID");


