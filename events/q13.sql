SELECT count(distinct p.pid) as numpeople
FROM Participate p
WHERE p.eid IN (SELECT eid
                FROM host 
                WHERE oid = 1
                )
; 