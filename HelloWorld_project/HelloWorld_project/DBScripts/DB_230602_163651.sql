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
  primary key ("OID")
);


-- Possible answers [ent6]
create table "APP"."POSSIBLE_ANSWERS" (
   "OID"  integer  not null,
   "OPTION"  varchar(255),
  primary key ("OID")
);


-- Solution [ent7]
create table "APP"."SOLUTION" (
   "OID"  integer  not null,
   "SOLUTION"  varchar(255),
  primary key ("OID")
);


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


-- Course_Lesson [rel4]
alter table "APP"."LESSON"  add column  "COURSE_OID"  integer;
alter table "APP"."LESSON"   add constraint FK_LESSON_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Lesson_Exercise [rel5]
alter table "APP"."EXERCISE"  add column  "LESSON_OID"  integer;
alter table "APP"."EXERCISE"   add constraint FK_EXERCISE_LESSON foreign key ("LESSON_OID") references "APP"."LESSON" ("OID");


-- Possible answers_Exercise [rel6]
alter table "APP"."POSSIBLE_ANSWERS"  add column  "EXERCISE_OID"  integer;
alter table "APP"."POSSIBLE_ANSWERS"   add constraint FK_POSSIBLE_ANSWERS_EXERCISE foreign key ("EXERCISE_OID") references "APP"."EXERCISE" ("OID");


-- Exercise_Solution [rel7]
alter table "APP"."SOLUTION"  add column  "EXERCISE_OID"  integer;
alter table "APP"."SOLUTION"   add constraint FK_SOLUTION_EXERCISE foreign key ("EXERCISE_OID") references "APP"."EXERCISE" ("OID");


