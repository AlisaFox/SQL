SELECT vid, capacity 
FROM venue 
WHERE capacity > 100 AND (area='B' OR area = 'C')
ORDER BY capacity DESC, vid ASC;