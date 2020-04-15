SELECT s.eid, s.date
FROM schedule s,
        (SELECT e.eid
        FROM event e, 
                (SELECT p.eid, count(*) as individuals
                FROM participate p
                WHERE p.pid='12345678' or p.pid ='12345679'
                GROUP BY p.eid
                ) p
         WHERE e.type='fundraising'  and p.eid =e.eid and p.individuals>1) e
WHERE e.eid=s.eid 
ORDER BY s.eid DESC, s.date ASC
;