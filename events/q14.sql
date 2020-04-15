SELECT e.eid, sum(c.price) as totalamount
FROM schedule e INNER JOIN calendar c
        ON e.date = c.date and e.vid=c.vid
GROUP BY e.eid
ORDER BY e.eid DESC
; 