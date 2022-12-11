SELECT DISTINCT A.N
     , CASE WHEN B.P IS NULL 
            THEN 'Leaf'
            WHEN A.P IS NULL 
            THEN 'Root'
            ELSE 'Inner'  
       END AS NODE
  FROM BST A
       LEFT OUTER JOIN BST B ON A.N = B.P
 ORDER BY A.N;