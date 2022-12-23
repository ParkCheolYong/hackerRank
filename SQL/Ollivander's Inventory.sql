SELECT A.ID
     , A.AGE
     , A.COINS_NEEDED
     , A.POWER
  FROM (
        SELECT A.ID
             , B.AGE
             , A.COINS_NEEDED
             , A.POWER
             , RANK() OVER(PARTITION BY B.AGE, A.POWER ORDER BY A.COINS_NEEDED) AS RN
          FROM WANDS A
               INNER JOIN WANDS_PROPERTY B ON B.CODE = A.CODE
                                          AND B.IS_EVIL = 0
       ) A
 WHERE A.RN = 1     
 ORDER BY
       A.POWER DESC
     , A.AGE DESC;