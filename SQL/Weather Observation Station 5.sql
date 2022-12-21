SELECT TOP 1
       CITY
     , LEN
  FROM (SELECT CITY
             , LEN(CITY) LEN
          FROM STATION) A
 ORDER BY 
       LEN
     , CITY;
     
SELECT TOP 1
       CITY
     , LEN
  FROM (SELECT CITY
             , LEN(CITY) LEN
          FROM STATION) A
 ORDER BY 
       LEN DESC
     , CITY;     