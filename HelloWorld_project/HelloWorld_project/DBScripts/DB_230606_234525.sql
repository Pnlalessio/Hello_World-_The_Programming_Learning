-- Forum [ent12]
create table "APP"."FORUM" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Post [ent13]
create table "APP"."POST" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "DESCRIPTION"  clob(10000),
  primary key ("OID")
);


-- Comment [ent14]
create table "APP"."COMMENT" (
   "OID"  integer  not null,
   "COMMENT"  clob(10000),
  primary key ("OID")
);


-- Private message [ent15]
create table "APP"."PRIVATE_MESSAGE" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "DESCRIPTION"  clob(10000),
  primary key ("OID")
);


-- Course followed [ent8]
create table "APP"."COURSE_FOLLOWED" (
   "OID"  integer  not null,
   "START_DATE"  date,
  primary key ("OID")
);


-- Courses followed_Course [rel10]
alter table "APP"."COURSE_FOLLOWED"  add column  "COURSE_OID"  integer;
alter table "APP"."COURSE_FOLLOWED"   add constraint FK_COURSE_FOLLOWED_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Course_Forum [rel11]
alter table "APP"."FORUM"  add column  "COURSE_OID"  integer;
alter table "APP"."FORUM"   add constraint FK_FORUM_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Course followed_Forum [rel12]
alter table "APP"."FORUM"  add column  "COURSE_FOLLOWED_OID"  integer;
alter table "APP"."FORUM"   add constraint FK_FORUM_COURSE_FOLLOWED foreign key ("COURSE_FOLLOWED_OID") references "APP"."COURSE_FOLLOWED" ("OID");


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


-- User_Private message [rel18]
alter table "APP"."PRIVATE_MESSAGE"  add column  "USER_OID"  integer;
alter table "APP"."PRIVATE_MESSAGE"   add constraint FK_PRIVATE_MESSAGE_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Course_Private message [rel19]
alter table "APP"."PRIVATE_MESSAGE"  add column  "COURSE_OID"  integer;
alter table "APP"."PRIVATE_MESSAGE"   add constraint FK_PRIVATE_MESSAGE_COURSE foreign key ("COURSE_OID") references "APP"."COURSE" ("OID");


-- Private message_Course followed [rel20]
alter table "APP"."PRIVATE_MESSAGE"  add column  "COURSE_FOLLOWED_OID"  integer;
alter table "APP"."PRIVATE_MESSAGE"   add constraint FK_PRIVATE_MESSAGE_COURSE_FOLL foreign key ("COURSE_FOLLOWED_OID") references "APP"."COURSE_FOLLOWED" ("OID");


-- User_Courses followed [rel9]
alter table "APP"."COURSE_FOLLOWED"  add column  "USER_OID"  integer;
alter table "APP"."COURSE_FOLLOWED"   add constraint FK_COURSE_FOLLOWED_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


