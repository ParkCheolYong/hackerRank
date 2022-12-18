SELECT CASE WHEN B.GRADE < 8 
            THEN NULL
            ELSE A.NAME
       END AS NAME
     , B.GRADE
     , A.MARKS
  FROM Students A
       INNER JOIN Grades B ON A.MARKS BETWEEN B.MIN_MARK AND MAX_MARK
 ORDER BY 
       B.GRADE DESC
     , A.NAME  
     , A.MARKS;