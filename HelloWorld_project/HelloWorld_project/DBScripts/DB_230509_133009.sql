-- Group [Group]
alter table "APP"."GROUP"  add column  "OID_2"  integer  not null;
alter table "APP"."GROUP"  add column  "GROUPNAME_2"  varchar(255);


-- Module [Module]
alter table "APP"."MODULE"  add column  "OID_2"  integer  not null;
alter table "APP"."MODULE"  add column  "MODULEID_2"  varchar(255);
alter table "APP"."MODULE"  add column  "MODULENAME_2"  varchar(255);


-- User [User]
alter table "APP"."USER"  add column  "OID_2"  integer  not null;
alter table "APP"."USER"  add column  "EMAIL_2"  varchar(255);
alter table "APP"."USER"  add column  "PASSWORD_2"  varchar(255);
alter table "APP"."USER"  add column  "FIRSTNAME_2"  varchar(255);
alter table "APP"."USER"  add column  "LASTNAME_2"  varchar(255);
alter table "APP"."USER"  add column  "ISAPPROVED_2"  smallint;
alter table "APP"."USER"  add column  "USERNAME_2"  varchar(255);


