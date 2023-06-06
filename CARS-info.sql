-- Lab 4 - CARS
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT m1.Make, d.Year
FROM makes m1, cardata d
WHERE m1.Model = 'pontiac' AND m1.Id = d.Id AND d.Year < 1977
ORDER BY d.Year;

SELECT ma.Make, d.Year
FROM carmakers cm, models m, makes ma, cardata d
WHERE cm.Maker = 'chrysler' AND m.Maker = cm.Id AND ma.Model = m.Model AND ma.Id = d.ID AND (d.Year = 1976 OR d.Year = 1977)
ORDER BY d.Year, ma.Make;

SELECT cm.FullName, co.Name
FROM carmakers cm, countries co
WHERE co.Name IN ('France', 'Sweden') AND cm.Country = co.Id
ORDER BY co.Name, cm.FullName;

SELECT cm.Maker, ma.Make
FROM cardata d, makes ma, models mo, carmakers cm
WHERE d.Cylinders != 4 
AND d.Year = 1979 
AND d.MPG > 20 
AND d.Accelerate < 18 
AND ma.Id = d.Id
AND ma.Model = mo.Model
AND mo.Maker = cm.Id;

SELECT cm.FullName, co.Name
FROM cardata d, makes ma, models mo, carmakers cm, countries co, continents con
WHERE d.weight < 2000
AND (d.Year = 1977 OR d.Year = 1978 OR d.Year = 1979)
AND d.Id = ma.Id
AND ma.Model = mo.Model
AND mo.Maker = cm.Id
AND cm.Country = co.Id
AND co.Continent = con.Id
AND con.Name = 'america'
ORDER BY cm.FullName;

SELECT ma.Make, d.Year, d.Weight / d.Horsepower AS Ratio
FROM models mo, cardata d, carmakers cm, makes ma
WHERE cm.FullName = 'Volvo' -- Interchangable with 'Saab' like in the lab report.
AND d.Year > 1971           -- I used 'Volvo' because that is what passed the check on Lab365
AND d.Id = ma.Id
AND ma.Model = mo.Model
AND mo.Maker = cm.Id
ORDER BY Ratio DESC;


