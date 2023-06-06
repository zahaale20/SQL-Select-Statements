-- Lab 4 MARATHON
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT Place, TIME_FORMAT(RunTime, '%H:%i:%s') AS RunTime, FirstName, LastName, TIME_FORMAT(Pace, '%i:%s') AS Pace
FROM marathon
WHERE Town = 'LITTLE FERRY' AND State = 'NJ'
ORDER BY Place;

SELECT FirstName, LastName, Place, RunTime, GroupPlace
FROM marathon
WHERE Town = 'QUNICY' AND State = 'MA' AND Sex = 'F'
ORDER BY Place;

SELECT FirstName, LastName, Town, Place, GroupPlace, RunTime
FROM marathon
WHERE Age = 27 AND Sex = 'F' AND State = 'RI'
ORDER BY RunTime;

SELECT DISTINCT BIBNumber
FROM marathon
GROUP BY BIBNumber
HAVING COUNT(*) > 1
ORDER BY BIBNumber;

SELECT Winner.Sex, Winner.AgeGroup, Winner.FirstName, Winner.LastName, Winner.Age, RunnerUp.FirstName, RunnerUp.LastName, RunnerUp.Age
FROM (
  SELECT Sex, AgeGroup, FirstName, LastName, Age,
         RANK() OVER (PARTITION BY Sex, AgeGroup ORDER BY Place) AS wrank
  FROM marathon) AS Winner
JOIN (
  SELECT Sex, AgeGroup, FirstName, LastName, Age,
         RANK() OVER (PARTITION BY Sex, AgeGroup ORDER BY Place) AS rrank
  FROM marathon) AS RunnerUp
ON Winner.Sex = RunnerUp.Sex 
   AND Winner.AgeGroup = RunnerUp.AgeGroup
   AND Winner.wrank = 1
   AND RunnerUp.rrank = 2
ORDER BY Winner.Sex, Winner.AgeGroup;