SELECT COUNT (DISTINCT o.pid) as numdizzypatients
FROM (SELECT pid, day
		FROM administration
		WHERE drugname='tocilizumab') A,
		(SELECT pid, day
		FROM observation
		WHERE note LIKE '%dizz%') O
WHERE A.pid = O.pid AND A.day < O.day AND NOT O.day < A.day
;

--Alisa Gagina
--260770497