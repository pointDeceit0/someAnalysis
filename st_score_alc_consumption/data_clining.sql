SELECT * FROM st_alc_cons;

#################### st_alc_cons - updating ####################

ALTER TABLE st_alc_cons
MODIFY COLUMN Medu VARCHAR(50),
MODIFY COLUMN Fedu VARCHAR(50),
MODIFY COLUMN traveltime VARCHAR(50),
MODIFY COLUMN studytime VARCHAR(50);

# There are not null values in the table
UPDATE st_alc_cons
SET traveltime = IF(traveltime = 1, "< 15 m", IF(traveltime = 2, "15 to 30 m", IF(traveltime = 3, "30 m", "> 1 h"))),
	studytime = IF(studytime = 1, "<2 h", IF(studytime = 2, "2 to 5 h", IF(studytime = 3, "5 to 10 h", "> 10 h"))),
	sex = IF(sex = "F", "female", "male"),
	Medu = IF(Medu = 0, "No", IF(Medu = 1, "Primary education", IF(Medu = 2, "5th to 9th grade", IF(Medu = 3, "secondary education", "higher education")))),
	Fedu = IF(Fedu = 0, "No", IF(Fedu = 1, "Primary education", IF(Fedu = 2, "5th to 9th grade", IF(Fedu = 3, "secondary education", "higher education")))),
	Pstatus = IF(Pstatus = "T", "Together", "Apart"),
	address = IF(address = "U", "Urban", "Rural");
    
#################### st_alc_cons - deleting and renaming columns ####################

ALTER TABLE st_alc_cons
DROP COLUMN school,
DROP COLUMN guardian,
DROP COLUMN failures,
DROP COLUMN nursery,
DROP COLUMN G1,
DROP COLUMN G2,
DROP COLUMN G3;

# it's better to do that when loading, ofcourse
ALTER TABLE st_alc_cons
RENAME COLUMN famsize TO family_size,
RENAME COLUMN Pstatus TO parent_status,
RENAME COLUMN Medu TO mother_education,
RENAME COLUMN Fedu TO father_education,
RENAME COLUMN traveltime TO travel_time,
RENAME COLUMN studytime TO study_time,
RENAME COLUMN schoolsup TO school_support,
RENAME COLUMN famsup TO family_support,
RENAME COLUMN paid TO paid_support,
RENAME COLUMN famrel TO family_relationships,
RENAME COLUMN Dalc TO daily_alcohol,
RENAME COLUMN Walc to weekly_alcohol,
RENAME COLUMN Mjob TO mother_job,
RENAME COLUMN Fjob TO father_job;


