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


