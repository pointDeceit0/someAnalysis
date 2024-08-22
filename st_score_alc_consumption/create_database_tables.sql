CREATE DATABASE students;
USE students;


############################ student preferences ############################

CREATE TABLE st_pref(
        gender VARCHAR(50),
        race_ethnicity VARCHAR(50),
        parental_level_of_education VARCHAR(50),
        lunch VARCHAR(50),
        test_preparation_course VARCHAR(50),
        math_score INT,
        reading_score INT,
        writing_score INT
);

LOAD DATA LOCAL INFILE "C:\\Users\\user\\Desktop\\someAnalysis\\data\\st_pref.csv" INTO TABLE st_pref
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @gender,
    @"race/ethnicity",
    @parental_level_of_education,
    @lunch,
    @test_preparation_course,
    @math_score,
    @reading_score,
    @writing_score
)
SET gender = NULLIF(@gender, ''),
    race_ethnicity = NULLIF(@"race/ethnicity", ''),
    parental_level_of_education = NULLIF(@parental_level_of_education, ''),
    lunch = NULLIF(@lunch, ''),
    test_preparation_course = NULLIF(@test_preparation_course, ''),
    math_score = NULLIF(@math_score, ''),
    reading_score = NULLIF(@reading_score, ''),
    writing_score = NULLIF(@writing_score, '');
    
    
############################ student alcohol consumering ############################

DROP TABLE students.st_alc_cons;
CREATE TABLE st_alc_cons(
    school VARCHAR(50),
    sex VARCHAR(50),
    age INT,
    address VARCHAR(50),
    famsize VARCHAR(50),
    Pstatus VARCHAR(50),
    Medu INT,
    Fedu INT,
    Mjob VARCHAR(50),
    Fjob VARCHAR(50),
    reason VARCHAR(50),
    guardian VARCHAR(50),
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup VARCHAR(50),
    famsup VARCHAR(50),
    paid VARCHAR(50),
    activities VARCHAR(50),
    nursery VARCHAR(50),
    higher VARCHAR(50),
    internet VARCHAR(50),
    romantic VARCHAR(50),
    famrel INT,
    freetime INT,
    goout INT,
    Dalc INT,
    Walc INT,
    health INT,
    absences INT,
    G1 INT,
    G2 INT,
    G3 INT
);

LOAD DATA LOCAL INFILE "C:\\Users\\user\\Desktop\\someAnalysis\\data\\st_alc_cons.csv" INTO TABLE st_alc_cons
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @school,
    @sex,
    @age,
    @address,
    @famsize,
    @Pstatus,
    @Medu,
    @Fedu,
    @Mjob,
    @Fjob,
    @reason,
    @guardian,
    @traveltime,
    @studytime,
    @failures,
    @schoolsup,
    @famsup,
    @paid,
    @activities,
    @nursery,
    @higher,
    @internet,
    @romantic,
    @famrel,
    @freetime,
    @goout,
    @Dalc,
    @Walc,
    @health,
    @absences,
    @G1,
    @G2,
    @G3
)
SET   school = NULLIF(@school, ''),
    sex = NULLIF(@sex, ''),
    age = NULLIF(@age, ''),
    address = NULLIF(@address, ''),
    famsize = NULLIF(@famsize, ''),
    Pstatus = NULLIF(@Pstatus, ''),
    Medu = NULLIF(@Medu, ''),
    Fedu = NULLIF(@Fedu, ''),
    Mjob = NULLIF(@Mjob, ''),
    Fjob = NULLIF(@Fjob, ''),
    reason = NULLIF(@reason, ''),
    guardian = NULLIF(@guardian, ''),
    traveltime = NULLIF(@traveltime, ''),
    studytime = NULLIF(@studytime, ''),
    failures = NULLIF(@failures, ''),
    schoolsup = NULLIF(@schoolsup, ''),
    famsup = NULLIF(@famsup, ''),
    paid = NULLIF(@paid, ''),
    activities = NULLIF(@activities, ''),
    nursery = NULLIF(@nursery, ''),
    higher = NULLIF(@higher, ''),
    internet = NULLIF(@internet, ''),
    romantic = NULLIF(@romantic, ''),
    famrel = NULLIF(@famrel, ''),
    freetime = NULLIF(@freetime, ''),
    goout = NULLIF(@goout, ''),
    Dalc = NULLIF(@Dalc, ''),
    Walc = NULLIF(@Walc, ''),
    health = NULLIF(@health, ''),
    absences = NULLIF(@absences, ''),
    G1 = NULLIF(@G1, ''),
    G2 = NULLIF(@G2, ''),
    G3 = NULLIF(@G3, '');