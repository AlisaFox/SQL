SELECT DISTINCT p.pid, p.pname
FROM person p INNER JOIN participate e
ON p.pid=e.pid  
WHERE p.pid != '12345678' and e.eid IN (SELECT DISTINCT eid
                                         FROM participate
                                        WHERE pid='12345678')
ORDER BY  p.pid
;