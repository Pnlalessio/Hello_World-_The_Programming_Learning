-- Group [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "USER_NAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
   "FIRSTNAME"  varchar(255),
   "LASTNAME"  varchar(255),
   "ISAPPROVED"  integer,
  primary key ("OID")
);


-- Category [ent1]
create table "APP"."CATEGORY" (
   "OID"  integer  not null,
   "CATEGORY"  varchar(255),
  primary key ("OID")
);


-- Course [ent2]
create table "APP"."COURSE" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
   "DESCRIPTION"  clob(10000),
  primary key ("OID")
);


-- Curriculum [ent3]
create table "APP"."CURRICULUM" (
   "OID"  integer  not null,
   "CURRICULUM"  varchar(255),
  primary key ("OID")
);


-- Lesson [ent4]
create table "APP"."LESSON" (
   "CONTENT_OID"  integer  not null,
   "VIDEO"  varchar(255),
  primary key ("CONTENT_OID")
);


-- Exercise [ent5]
create table "APP"."EXERCISE" (
   "CONTENT_OID"  integer  not null,
   "OPTION_1"  varchar(255),
   "OPTION_2"  varchar(255),
   "OPTION_3"  varchar(255),
   "OPTION_4"  varchar(255),
   "SOLUTION"  varchar(255),
  primary key ("CONTENT_OID")
);


-- Content [ent6]
create table "APP"."CONTENT" (
   "OID"  integer  not null,
   "ORDER"  integer,
   "NAME"  varchar(255),
   "DESCRIPTION"  varchar(255),
  primary key ("OID")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP"  add column  "MODULE_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"  add column  "GROUP_OID"  integer;
alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Course [rel1]
alter table "APP"."COURSE"  add column  "USER_OID"  integer;
alter table "APP"."COURSE"   add constraint FK_COURSE_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Category_Course [rel2]
create table "APP"."CATEGORY_COURSE" (
   "CATEGORY_OID"  integer not null,
   "COURSE_OID"  integer not null,
  primary key ("CATEGORY_OID", "COURSE_OID")
);
alter table "APP"."CATEGORY_COURSE"   add constraint FK_CATEGORY_COURSE_CATEGORY foreign key ("CATEGORY_OID") references "APP"."CATEGORY" ("OID");
alter table "APP"."CATEGORY_COURSE"   add constraint FK_CATEGORY_COURSE_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- User_Curriculum [rel3]
alter table "APP"."CURRICULUM"  add column  "USER_OID"  integer;
alter table "APP"."CURRICULUM"   add constraint FK_CURRICULUM_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Course_Content [rel6]
alter table "APP"."CONTENT"  add column  "COURSE_OID"  integer;
alter table "APP"."CONTENT"   add constraint FK_CONTENT_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- GEN FK: Lesson --> Content
alter table "APP"."LESSON"   add constraint FK_LESSON_CONTENT foreign key ("CONTENT_OID") references "APP"."CONTENT" ("OID");


-- GEN FK: Exercise --> Content
alter table "APP"."EXERCISE"   add constraint FK_EXERCISE_CONTENT foreign key ("CONTENT_OID") references "APP"."CONTENT" ("OID");


-- Category.# courses [ent1#att21]
create view "APP"."CATEGORY_COURSES_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."COURSE_OID") as "DER_ATTR"
from  "APP"."CATEGORY" AL1 
               left outer join "APP"."CATEGORY_COURSE" AL2 on AL1."OID"=AL2."CATEGORY_OID"
group by AL1."OID";


