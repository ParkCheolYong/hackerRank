SELECT A.HACKER_ID
     , A.NAME  
  FROM Hackers A       
       INNER JOIN Submissions B ON B.HACKER_ID = A.HACKER_ID
       INNER JOIN Challenges C  ON C.CHALLENGE_ID = B.CHALLENGE_ID
       INNER JOIN Difficulty D  ON D.DIFFICULTY_LEVEL = C.DIFFICULTY_LEVEL
                               AND D.SCORE = B.SCORE
 GROUP BY 
       A.HACKER_ID
     , A.NAME                               
HAVING COUNT(*) > 1
 ORDER BY 
       COUNT(*) DESC
     , A.HACKER_ID; 