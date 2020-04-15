SELECT ppl.eid, ppl.numpeople
FROM (
        SELECT e.eid, COUNT(DISTINCT p.pid) as numpeople
        FROM event e INNER JOIN participate p
                ON e.eid=p.eid
        WHERE e.type='fundraising' 
        GROUP BY e.eid) ppl     
WHERE ppl.numpeople >= (SELECT max(m.npeople) 
                            FROM( 
                                SELECT e.eid, COUNT(DISTINCT p.pid) as npeople
                                FROM event e INNER JOIN participate p
                                        ON e.eid=p.eid
                                WHERE e.type='fundraising' 
                                GROUP BY e.eid) m
          )
  ORDER BY ppl.eid
;