--average venue cost / event for each type
SELECT e.type, AVG(eventprices.totalamount)as averageamount
FROM  event e, (SELECT e.eid, sum(c.price) as totalamount
                FROM schedule e INNER JOIN calendar c
                ON e.date = c.date and e.vid=c.vid
                GROUP BY e.eid) eventprices 
WHERE e.eid=eventprices.eid
GROUP BY e.type
ORDER BY e.type
;

