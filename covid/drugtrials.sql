SELECT NR.drugname, coalesce(R.r, 0) as recovered, coalesce(NR.notr, 0) as notrecovered
FROM 
(
SELECT a.drugname, count( DISTINCT a.pid) as notr
FROM patient p inner join administration a
		on p.pid = a.pid
WHERE p.status<>'recovered'
GROUP BY drugname
)NR FULL OUTER JOIN
 (
SELECT a.drugname, count( DISTINCT a.pid) as r
FROM patient p inner join administration a
		on p.pid = a.pid
WHERE p.status='recovered'
GROUP BY drugname
)R
ON R.drugname = NR.drugname
;

--Alisa Gagina
--260770497