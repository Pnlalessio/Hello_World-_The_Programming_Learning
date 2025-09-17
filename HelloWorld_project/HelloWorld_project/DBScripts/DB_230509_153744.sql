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
  primary key ("OID")
);


-- Employee [ent2]
create table "APP"."EMPLOYEE" (
   "USER_OID"  integer  not null,
   "FIRST_NAME"  varchar(255),
   "PHONE"  varchar(255),
   "GENDER"  varchar(255),
   "LOCATION"  varchar(255),
   "BIRTHDATE"  date,
   "IM_USERNAME"  varchar(255),
   "PIC"  varchar(255),
   "ENTRYDATE"  date,
   "LAST_NAME"  varchar(255),
  primary key ("USER_OID")
);


-- Organization Unit [ent3]
create table "APP"."ORGANIZATION_UNIT" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
   "DESCRIPTION"  clob(10000),
   "TYPE"  varchar(255),
  primary key ("OID")
);


-- Role [ent4]
create table "APP"."ROLE" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
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


-- Department_Department [rel2]
alter table "APP"."ORGANIZATION_UNIT"  add column  "ORGANIZATION_UNIT_OID"  integer;
alter table "APP"."ORGANIZATION_UNIT"   add constraint FK_ORGANIZATION_UNIT_ORGANIZAT foreign key ("ORGANIZATION_UNIT_OID") references "APP"."ORGANIZATION_UNIT" ("OID");


-- Employee_Organization Unit [rel3]
alter table "APP"."ORGANIZATION_UNIT"  add column  "EMPLOYEE_OID"  integer;
alter table "APP"."ORGANIZATION_UNIT"   add constraint FK_ORGANIZATION_UNIT_EMPLOYEE foreign key ("EMPLOYEE_OID") references "APP"."EMPLOYEE" ("USER_OID");


-- Employee_Organization Unit_2 [rel4]
alter table "APP"."EMPLOYEE"  add column  "ORGANIZATION_UNIT_OID"  integer;
alter table "APP"."EMPLOYEE"   add constraint FK_EMPLOYEE_ORGANIZATION_UNIT foreign key ("ORGANIZATION_UNIT_OID") references "APP"."ORGANIZATION_UNIT" ("OID");


-- Employee_Role [rel5]
alter table "APP"."EMPLOYEE"  add column  "ROLE_OID"  integer;
alter table "APP"."EMPLOYEE"   add constraint FK_EMPLOYEE_ROLE foreign key ("ROLE_OID") references "APP"."ROLE" ("OID");


-- GEN FK: Employee --> User
alter table "APP"."EMPLOYEE"   add constraint FK_EMPLOYEE_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


