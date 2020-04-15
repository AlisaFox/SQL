SELECT DISTINCT o.oid, o.oname
FROM  organization o, host h,
 (SELECT s.eid
  FROM schedule s
  WHERE s.date='2020-01-16') c
WHERE c.eid = h.eid and h.oid=o.oid
ORDER BY oid
;