SELECT p.pid, p.pname
FROM person p INNER JOIN participate par
        ON p.pid= par.pid
WHERE par.eid=5
ORDER BY p.pid
;