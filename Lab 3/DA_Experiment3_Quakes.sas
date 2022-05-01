PROC SQL;
CREATE TABLE WORK.query AS
SELECT Latitude , Longitude , 'Depth'n , Magnitude , dNearestStation , RootMeanSquareTime , 'Type'n FROM SASHELP.QUAKES;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC ANOVA DATA = WORK.query;
CLASS type;
MODEL Magnitude = type;
MEANS type / tukey lines;
RUN;

PROC PRINT DATA=WORK.details;
RUN;