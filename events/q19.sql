SELECT h.oid
FROM host h, schedule s
WHERE h.eid=s.eid and s.vid IN
        (SELECT vid
        FROM venue
        WHERE area='C'
        )         
GROUP BY h.oid
HAVING count(DISTINCT s.vid) = (SELECT count(vid)
        FROM venue
        WHERE area='C'
        )
ORDER BY h.oid
;
