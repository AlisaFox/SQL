SELECT vid, capacity
FROM venue 
WHERE vid IN  (SELECT vid
                FROM calendar
                WHERE price <100 and date= '2020-01-16')
          AND area='C'
ORDER BY vid
;