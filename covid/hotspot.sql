SELECT p.bname, COUNT(p.pid) as infectednum
FROM personn p INNER JOIN patient i
		ON p.pid = i.pid
GROUP BY p.bname
ORDER BY infectednum DESC, bname; 


--Alisa Gagina
--260770497