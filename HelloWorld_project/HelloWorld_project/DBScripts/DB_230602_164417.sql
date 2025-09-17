-- Category.# courses [ent1#att21]
create view "APP"."CATEGORY_COURSES_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."COURSE_OID") as "DER_ATTR"
from  "APP"."CATEGORY" AL1 
               left outer join "APP"."CATEGORY_COURSE" AL2 on AL1."OID"=AL2."CATEGORY_OID"
group by AL1."OID";


