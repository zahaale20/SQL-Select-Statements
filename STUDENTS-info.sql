-- Lab4 - STUDENTS
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT FirstName, LastName
FROM list
WHERE Classroom = '112'
ORDER BY LastName DESC;

SELECT Classroom, Grade
FROM list
GROUP BY Classroom, Grade
ORDER BY Grade ASC, Classroom ASC;

SELECT t.First, t.Last
FROM teachers t, list l
WHERE l.FirstName = 'JEFFRY' AND l.LastName = 'FLACHS' AND l.Classroom = t.Classroom;

SELECT t2.First, t2.Last
FROM teachers t, teachers t2
WHERE t.First = 'LORIA' AND t.Last = 'ONDERSMA'
  AND (t.Classroom = t2.Classroom - 1 OR t.Classroom = t2.Classroom + 1)
ORDER BY t2.Classroom;

SELECT l2.FirstName, l2.LastName
FROM list l, list l2
WHERE l.FirstName = 'LYNNETTE' and l.LastName = 'HOESCHEN' and l.classroom != l2.classroom and l.grade = l2.grade
ORDER BY l2.Classroom, l2.LastName;


