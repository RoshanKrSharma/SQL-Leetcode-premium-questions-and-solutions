-- see question in OneNote

SELECT MIN(ABS(p1.x-p2.x))
FROM Point p1
JOIN Point p2 On p1.x <> p2.x
