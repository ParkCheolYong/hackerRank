SELECT FORMAT(ROUND(A.LONG_W,4),"##0.####")
  FROM STATION A
 WHERE A.LAT_N  = (SELECT MIN(LAT_N)
                     FROM STATION
                     WHERE LAT_N > 38.7780);