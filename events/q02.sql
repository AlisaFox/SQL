SELECT v.vid, v.capacity
FROM venue v INNER JOIN calendar c
        ON v.vid=c.vid
WHERE v.area = 'C' and c.price <100 and c.date='2020-01-16'
ORDER BY vid
;