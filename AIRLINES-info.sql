-- Lab 4 - AIRLINES
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT DISTINCT a.Name, a.Abbr
FROM airlines a, flights f, airports ap
WHERE ap.Code = 'KQA' AND a.Id = f.Airline AND f.Source = ap.Code
ORDER BY a.Name;

SELECT f.FlightNo, f.Destination, ap.Name
FROM flights f, airports ap, airlines a
WHERE f.Source = 'KQA' 
  AND f.Airline = a.Id 
  AND f.Destination = ap.Code 
  AND a.Name = 'Delta Airlines'
ORDER BY f.FlightNo;

SELECT f1.FlightNo, f2.FlightNo, f2.Destination, ap2.Name
FROM flights f1, flights f2, airports ap1, airports ap2, airlines a1, airlines a2
WHERE f1.Destination = f2.Source
  AND f1.Destination = ap1.Code
  AND f2.Destination = ap2.Code
  AND f2.Destination != f1.Source
  AND f1.Airline = a1.Id
  AND f2.Airline = a2.Id
  AND f1.Source = 'KQA'
  AND a1.Name = 'Delta Airlines'
  AND a2.Name = 'Delta Airlines'
  AND f1.FlightNo <> f2.FlightNo
ORDER BY ap2.Code;

SELECT ap1.Name AS Source, ap1.Code AS SourceCode, ap2.Name AS Destination, ap2.Code AS DestCode
FROM flights f1, flights f2, airports ap1, airports ap2, airlines a1, airlines a2
WHERE f1.Destination = f2.Destination
  AND f1.Source = ap1.Code
  AND f2.Source = ap2.Code
  AND f1.Airline = a1.Id
  AND f2.Airline = a2.Id
  AND ((a1.Name = 'Delta Airlines' AND a2.Name = 'JetBlue Airways') OR (a1.Name = 'JetBlue Airways' AND a2.Name = 'Delta Airlines'))
GROUP BY ap1.Code, ap2.Code
HAVING COUNT(*) > 1
ORDER BY ap1.Code, ap2.Code;

SELECT f.Source
FROM flights f
JOIN airlines a ON f.Airline = a.Id
WHERE a.Abbr IN ('Delta', 'Frontier', 'USAir', 'UAL', 'Southwest')
GROUP BY f.Source
HAVING COUNT(DISTINCT a.Name) = 5
ORDER BY f.Source;

SELECT f.Source
FROM flights f
JOIN airlines a ON f.Airline = a.Id
WHERE a.Abbr = 'Delta'
GROUP BY f.Source
HAVING COUNT(*) >= 3
ORDER BY f.Source;


