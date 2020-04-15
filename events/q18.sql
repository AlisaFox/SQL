SELECT v.vid, count(s.eid) AS numevents
FROM Schedule s
RIGHT OUTER JOIN Venue v ON s.vid=v.vid
GROUP BY v.vid
ORDER BY v.vid
;