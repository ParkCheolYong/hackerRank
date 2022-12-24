SELECT A.HACKER_ID
     , A.NAME
     , COUNT(*) AS CNT
  FROM Hackers A
       INNER JOIN Challenges B ON B.HACKER_ID = A.HACKER_ID                               
 GROUP BY 
       A.HACKER_ID
     , A.NAME
HAVING COUNT(*) = (SELECT MAX(MAX_CNT.CNT)
                     FROM (SELECT HACKER_ID
                                , COUNT(*) CNT 
                             FROM Challenges 
                            GROUP BY
                                  HACKER_ID) MAX_CNT)
    OR COUNT(*) IN (SELECT UNIQ_CNT.CNT
                      FROM (SELECT HACKER_ID
                                 , COUNT(*) AS CNT 
                              FROM Challenges 
                             GROUP BY
                                   HACKER_ID) UNIQ_CNT                             
                     GROUP BY CNT
                    HAVING COUNT(*) = 1)
 ORDER BY
       CNT DESC
     , HACKER_ID;
               