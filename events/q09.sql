SELECT s.eid, s.date
FROM schedule s,
        (SELECT e.eid
        FROM event e, 
                (SELECT eid  
                FROM participate 
                WHERE pid='12345678' 
                EXCEPT
                SELECT eid  
                FROM participate
                WHERE pid='12345679'
                ) p
         WHERE e.type='music'  and p.eid = e.eid ) e
WHERE e.eid=s.eid 
ORDER BY s.eid DESC, s.date ASC
;