SELECT o.oid, o.oname
FROM organization o, host h, (SELECT eid, count(DISTINCT date) as duration
                        FROM schedule 
                        GROUP BY eid
                        ) s                       
WHERE s.duration > 2 and h.eid =s.eid and o.oid=h.oid
ORDER BY o.oid
;