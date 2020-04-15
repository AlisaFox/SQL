SELECT vid, count(eid) as numevents
FROM schedule
GROUP BY vid
UNION ALL
SELECT vid, 0
FROM venue
WHERE vid not in (select vid from schedule)
ORDER BY vid
;

