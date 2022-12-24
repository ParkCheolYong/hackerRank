SELECT HACKER_ID
     , NAME
     , SCORE
  FROM (SELECT A.HACKER_ID
             , A.NAME
             , SUM(B.MAX_SCORE) AS SCORE
          FROM Hackers A
               INNER JOIN (SELECT HACKER_ID
                                , CHALLENGE_ID
                                , MAX(SCORE) AS MAX_SCORE
                             FROM Submissions 
                            GROUP BY 
                                  HACKER_ID
                                , CHALLENGE_ID) B ON B.HACKER_ID = A.HACKER_ID
         GROUP BY 
               A.HACKER_ID
             , A.NAME) A
 WHERE SCORE <> 0
 ORDER BY
       SCORE DESC
     , HACKER_ID;