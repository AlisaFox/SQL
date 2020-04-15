SELECT v.vid, v.area, v.capacity
FROM venue v
WHERE v.vid IN (SELECT DISTINCT s.vid
                 FROM host h INNER JOIN schedule s
                 ON h.eid = s.eid
                 WHERE h.oid=6)
ORDER BY v.vid, v.capacity
;