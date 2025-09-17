-- Company [ent1]
create table "APP"."COMPANY" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- Employee_Company [rel1]
alter table "APP"."EMPLOYEE"  add column  "COMPANY_OID"  integer;
alter table "APP"."EMPLOYEE"   add constraint FK_EMPLOYEE_COMPANY foreign key ("COMPANY_OID") references "APP"."COMPANY" ("OID");


-- Company_Employee [rel2]
alter table "APP"."EMPLOYEE"  add column  "COMPANY_OID_2"  integer;
alter table "APP"."EMPLOYEE"   add constraint FK_EMPLOYEE_COMPANY_2 foreign key ("COMPANY_OID_2") references "APP"."COMPANY" ("OID");


