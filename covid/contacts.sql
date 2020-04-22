SELECT name, email, phone
FROM personn
WHERE pid IN
		( SELECT person_pid
		FROM contactwith		
		WHERE patient_pid IN (SELECT pid
				FROM personn
				WHERE email='dub.vizer@br.com'
		 		)
	 	)
;

--Alisa Gagina
--260770497