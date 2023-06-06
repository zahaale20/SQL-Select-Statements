-- Lab 4 - CSU
-- azaharia@calpoly.edu
-- May 17, 2023

select Campus, Year
from campuses
where Year < 1920
order by Year;

select d.Year, d.degrees
from campuses c, degrees d
where c.Campus = 'San Diego State University' 
and c.Id = d.CampusId
and d.Year >= 2000 
and d.Year <= 2004
order by d.Year;

SELECT c.Campus AS CampusName, d.Name AS Discipline, de.Gr, de.Ug
FROM campuses c, discEnr de, disciplines d
WHERE (c.Campus LIKE '%Polytechnic%' OR c.Campus = 'Humboldt State University')
  AND de.Year = 2004
  AND de.Discipline = d.Id
  AND d.Name IN ('Mathematics', 'Engineering', 'Computer and Info. Sciences')
  AND c.Id = de.CampusId
ORDER BY CampusName, Discipline;

SELECT c.Campus, e.Year, (de.Degrees / e.FTE) AS RATIO
FROM campuses c, enrollments e, degrees de
WHERE c.Id = e.CampusId AND c.Id = de.CampusId AND e.Year = de.Year
  AND e.Year BETWEEN 1990 AND 1999
  AND (de.Degrees / e.FTE) > 0.25
ORDER BY e.Year, c.Campus;

SELECT c.Campus, d.Name, de.Ug, de.Gr
FROM campuses c, discEnr de, disciplines d
WHERE c.Id = de.CampusId
  AND de.Discipline = d.Id
  AND de.Year = 2004
  AND de.Gr > 0
  AND de.Ug > 0
  AND de.Gr >= 4 * de.Ug
ORDER BY c.Campus, d.Name;

SELECT e.Year, (e.FTE * cf.fee) AS COLLECTED, (e.FTE * cf.fee / f.FTE) AS 'PER FACULTY'
FROM enrollments e, fees cf, faculty f, campuses c
WHERE e.CampusId = c.Id
  AND c.Campus = 'San Diego State University'
  AND e.Year BETWEEN 2002 AND 2004
  AND e.CampusId = cf.CampusId
  AND e.Year = cf.Year
  AND e.CampusId = f.CampusId
  AND e.Year = f.Year
ORDER BY e.Year;

SELECT c2.Campus, e2.FTE as STUDENTS, f2.FTE as FACULTY, e2.FTE/f2.FTE as RATIO
FROM enrollments e, campuses c, faculty f, enrollments e2, campuses c2, faculty f2
WHERE c.Campus = 'San Jose State University'
  AND c.Id = e.CampusId
  AND e.Year = 2003
  AND f.Year = 2003
  AND f.CampusId = c.Id
  AND e2.CampusId = c2.Id
  AND e2.Year = 2003
  AND f2.Year = 2003
  AND f2.CampusId = c2.Id
  AND e.FTE < e2.FTE
ORDER BY RATIO;


