
/*Rename a tbl*/
alter table sample.tbl_countries rename sample.tbl_countries_new;

/*add column*/
alter table sample.tbl_locations 
add region_id int;

show columns from sample.tbl_locations;

/*add first column*/
alter table sample.tbl_locations
add id int first;

/*add after column*/
alter table sample.tbl_locations
add region_id int after state_province;

/* change datatype of a column*/
alter table sample.tbl_locations
change country_id country_id int;

/*use modify instead of change*/
alter table sample.tbl_locations
modify country_id varchar(20);

/*delete a column*/
alter table sample.tbl_locations
drop city;

/* change the column name*/
alter table sample.tbl_locations
drop state_province,
add state varchar(25)
after city;

/*renaming a column name*/
alter table sample.tbl_locations
change state_province state varchar(25);

desc sample.tbl_locations;

/*add primary key*/
alter table sample.tbl_locations
add primary key(location_id);

alter table sample.tbl_locations
drop primary key;

/*add combination of primary key*/
alter table sample.tbl_locations
add primary key(location_id,country_id);

/*remove primary key*/
alter table sample.tbl_locations
drop primary key;

use sample;
show tables;
show columns from sample.tbl_jobs;
show columns from sample.tbl_job_histry;

alter table sample.tbl_job_histry
change job_id job_id varchar(40) not null;

/* add foreign key*/
alter table sample.tbl_job_histry
add foreign key (job_id) references tbl_jobs(job_id);

desc sample.tbl_job_histry;
show keys from sample.tbl_job_histry;

/* Not working
alter table sample.tbl_job_histry
drop index job_id;

alter table sample.tbl_job_histry
drop foreign key job_id;
*/

/*To disable the foreign key check*/
SET foreign_key_checks = 0;
/*To enable foreign key check*/
SET foreign_key_checks = 1;


drop table sample.tbl_job_histry;

/*add foreign key with name fk_job_id*/
alter table sample.tbl_job_histry
add constraint fk_job_id 
foreign key (job_id) references sample.tbl_jobs(job_id);

show keys from sample.tbl_job_histry;

/* Remove foreign key */
alter table sample.tbl_job_histry
drop foreign key fk_job_id;
/* after the above stmt, still the description of the table has foreign key but the action is lost*/

desc sample.tbl_job_histry;
show columns from sample.tbl_job_histry;
show index from sample.tbl_job_histry;

/*add index*/
alter table sample.tbl_job_histry
add index index_job_id(job_id);

/*remove index*/
alter table sample.tbl_job_histry
drop index index_job_id;