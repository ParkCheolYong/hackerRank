SELECT A.X
     , A.Y
  FROM Functions A
       INNER JOIN Functions B ON B.Y = A.X
                             AND B.X = A.Y                           
 GROUP BY 
       A.X
     , A.Y
HAVING COUNT(*) > 1 
    OR A.X < A.Y
 ORDER BY 
       A.X; 