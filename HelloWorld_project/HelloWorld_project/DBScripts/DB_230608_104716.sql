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


-- Private message [ent10]
create table "APP"."PRIVATE_MESSAGE" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "DESCRIPTION"  clob(10000),
   "STATUS"  varchar(255),
   "INSTERTION_DATE"  date,
   "ANSWER"  clob(10000),
  primary key ("OID")
);


-- Option [ent11]
create table "APP"."OPTION" (
   "OID"  integer  not null,
   "OPTION"  varchar(255),
  primary key ("OID")
);


-- Forum [ent12]
create table "APP"."FORUM" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- Post [ent13]
create table "APP"."POST" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "DESCRIPTION"  clob(10000),
   "INSERT_TIME"  timestamp,
  primary key ("OID")
);


-- Comment [ent14]
create table "APP"."COMMENT" (
   "OID"  integer  not null,
   "COMMENT"  clob(10000),
   "INSERT_TIME"  timestamp,
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


-- Content [ent6]
create table "APP"."CONTENT" (
   "OID"  integer  not null,
   "ORDER"  integer,
   "NAME"  varchar(255),
   "DESCRIPTION"  clob(10000),
  primary key ("OID")
);


-- Exercise [ent7]
create table "APP"."EXERCISE" (
   "CONTENT_OID"  integer  not null,
   "SOLUTION"  varchar(255),
  primary key ("CONTENT_OID")
);


-- Course followed [ent8]
create table "APP"."COURSE_FOLLOWED" (
   "OID"  integer  not null,
   "START_DATE"  date,
  primary key ("OID")
);


-- Category [ent9]
create table "APP"."CATEGORY" (
   "OID"  integer  not null,
   "CATEGORY"  varchar(255),
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


-- Courses followed_Course [rel10]
alter table "APP"."COURSE_FOLLOWED"  add column  "COURSE_OID"  integer;
alter table "APP"."COURSE_FOLLOWED"   add constraint FK_COURSE_FOLLOWED_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Course_Forum [rel11]
alter table "APP"."FORUM"  add column  "COURSE_OID"  integer;
alter table "APP"."FORUM"   add constraint FK_FORUM_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Exercise_Options [rel12]
alter table "APP"."OPTION"  add column  "EXERCISE_OID"  integer;
alter table "APP"."OPTION"   add constraint FK_OPTION_EXERCISE foreign key ("EXERCISE_OID") references "APP"."EXERCISE" ("CONTENT_OID");


-- Post_Forum [rel13]
alter table "APP"."POST"  add column  "FORUM_OID"  integer;
alter table "APP"."POST"   add constraint FK_POST_FORUM foreign key ("FORUM_OID") references "APP"."FORUM" ("OID");


-- Comment_Post [rel14]
alter table "APP"."COMMENT"  add column  "POST_OID"  integer;
alter table "APP"."COMMENT"   add constraint FK_COMMENT_POST foreign key ("POST_OID") references "APP"."POST" ("OID");


-- User_Comment [rel15]
alter table "APP"."COMMENT"  add column  "USER_OID"  integer;
alter table "APP"."COMMENT"   add constraint FK_COMMENT_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- User_Post [rel17]
alter table "APP"."POST"  add column  "USER_OID"  integer;
alter table "APP"."POST"   add constraint FK_POST_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Support_User [rel2]
alter table "APP"."SUPPORT"  add column  "USER_OID"  integer;
alter table "APP"."SUPPORT"   add constraint FK_SUPPORT_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- User_Curriculum [rel3]
alter table "APP"."CURRICULUM"  add column  "USER_OID"  integer;
alter table "APP"."CURRICULUM"   add constraint FK_CURRICULUM_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Category_Course [rel4]
alter table "APP"."COURSE"  add column  "CATEGORY_OID"  integer;
alter table "APP"."COURSE"   add constraint FK_COURSE_CATEGORY foreign key ("CATEGORY_OID") references "APP"."CATEGORY" ("OID");


-- User_Private message [rel5]
alter table "APP"."PRIVATE_MESSAGE"  add column  "USER_OID"  integer;
alter table "APP"."PRIVATE_MESSAGE"   add constraint FK_PRIVATE_MESSAGE_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Course_Content [rel6]
alter table "APP"."CONTENT"  add column  "COURSE_OID"  integer;
alter table "APP"."CONTENT"   add constraint FK_CONTENT_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Private message_Course [rel7]
alter table "APP"."PRIVATE_MESSAGE"  add column  "COURSE_OID"  integer;
alter table "APP"."PRIVATE_MESSAGE"   add constraint FK_PRIVATE_MESSAGE_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- User_Courses followed [rel9]
alter table "APP"."COURSE_FOLLOWED"  add column  "USER_OID"  integer;
alter table "APP"."COURSE_FOLLOWED"   add constraint FK_COURSE_FOLLOWED_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- GEN FK: Lesson --> Content
alter table "APP"."LESSON"   add constraint FK_LESSON_CONTENT foreign key ("CONTENT_OID") references "APP"."CONTENT" ("OID");


-- GEN FK: Exercise --> Content
alter table "APP"."EXERCISE"   add constraint FK_EXERCISE_CONTENT foreign key ("CONTENT_OID") references "APP"."CONTENT" ("OID");


-- Category.#courses [ent9#att29]
create view "APP"."CATEGORY_COURSES_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."OID") as "DER_ATTR"
from  "APP"."CATEGORY" AL1 
               left outer join "APP"."COURSE" AL2 on AL1."OID"=AL2."CATEGORY_OID"
group by AL1."OID";


