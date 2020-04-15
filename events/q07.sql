SELECT DISTINCT v.vid
FROM venue v, 
 (SELECT c.vid
 FROM calendar c
 WHERE c.date='2020-01-17') c
WHERE v.area='A' and not v.vid=c.vid
ORDER BY v.vid
;