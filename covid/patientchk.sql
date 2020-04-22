SELECT o.note, h.name, o.day, o.hour
FROM observation o, healthcarep h
WHERE o.pid IN (SELECT pid
				FROM personn 
				WHERE name = 'Samantha Adam'
				AND EXISTS (SELECT pid FROM infected  WHERE personn.pid = infected.pid))
AND o.hid=h.hid
AND o.note LIKE '%breathing%'
ORDER BY o.day DESC, o.hour DESC;

--Alisa Gagina
--260770497