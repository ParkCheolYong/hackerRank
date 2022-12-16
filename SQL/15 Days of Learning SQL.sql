SELECT A.SUBMISSION_DATE
     , A.HACKER_ID
     , X.HACKER_ID
     , (SELECT NAME FROM HACKERS WHERE HACKER_ID = X.HACKER_ID) AS NAME
  FROM (SELECT A.SUBMISSION_DATE
             , COUNT(DISTINCT A.HACKER_ID) AS HACKER_ID
          FROM SUBMISSIONS A
         WHERE (SELECT COUNT(DISTINCT SUBMISSION_DATE)
                  FROM SUBMISSIONS
                 WHERE HACKER_ID = A.HACKER_ID
                   AND SUBMISSION_DATE <= A.SUBMISSION_DATE) = DAY(A.SUBMISSION_DATE)             
        GROUP BY A.SUBMISSION_DATE
        ) A
       CROSS APPLY (SELECT TOP 1 
                           HACKER_ID
                      FROM SUBMISSIONS
                     WHERE SUBMISSION_DATE = A.SUBMISSION_DATE
                     GROUP BY 
                           HACKER_ID
                     ORDER BY 
                           COUNT(SUBMISSION_ID) DESC
                         , HACKER_ID) X;