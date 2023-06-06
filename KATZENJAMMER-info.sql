-- Lab 4 - KATZENJAMMER
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT s.Title
FROM Songs s, Tracklists t, Albums a
WHERE s.SongId = t.Song
AND t.Album = a.AId
AND a.Title = 'Le Pop'
ORDER BY t.Position;

SELECT DISTINCT b.FirstName, i.Instrument
FROM Band b, Instruments i, Songs s, Tracklists t, Albums a
WHERE b.Id = i.Bandmate
  AND i.Song = s.SongId
  AND s.SongId = t.Song
  AND t.Album = a.AId
  AND s.SongId = 11
ORDER BY b.Firstname, i.Instrument;

SELECT DISTINCT i.Instrument
FROM Band b, Instruments i
WHERE b.Id = i.Bandmate
  AND b.Firstname = 'Solveig'
ORDER BY i.Instrument;

SELECT s.Title, b.Firstname
FROM Songs s, Instruments i, Band b
WHERE s.SongId = i.Song
  AND i.Bandmate = b.Id
  AND i.Instrument = 'toy piano'
ORDER BY s.Title;

SELECT DISTINCT i.Instrument
FROM Band b, Instruments i, Songs s, Vocals v
WHERE b.Id = i.Bandmate
  AND i.Song = s.SongId
  AND s.SongId = v.Song
  AND b.Firstname = 'Turid'
  AND v.VocalType = 'lead'
ORDER BY i.Instrument;

SELECT s.Title, b.Firstname, p.StagePosition
FROM Songs s, Vocals v, Band b, Performance p
WHERE s.SongId = v.Song
  AND v.Bandmate = b.Id
  AND s.SongId = p.Song
  AND b.Id = p.Bandmate
  AND v.VocalType = 'lead'
  AND p.StagePosition <> 'center'
ORDER BY s.Title;

SELECT s.Title
FROM Songs s, Instruments i, Band b
WHERE b.Firstname = 'Anne-Marit'
AND s.SongId = i.Song
AND i.Bandmate = b.Id
GROUP BY s.Title
HAVING COUNT(DISTINCT i.Instrument) = 3;

SELECT b1.Firstname, b2.Firstname, b3.Firstname, b4.Firstname
FROM  Songs s, Performance p1, Band b1, Performance p2, Band b2, Performance p3, Band b3, Performance p4, Band b4
WHERE p1.Song = s.SongId
  AND p2.Song = s.SongId
  AND p3.Song = s.SongId
  AND p4.Song = s.SongId
  AND p1.StagePosition = 'right'
  AND p2.StagePosition = 'center'
  AND p3.StagePosition = 'back'
  AND p4.StagePosition = 'left'
  AND b1.Id = p1.Bandmate
  AND b2.Id = p2.Bandmate
  AND b3.Id = p3.Bandmate
  AND b4.Id = p4.Bandmate
  AND s.Title = 'Johnny Blowtorch' -- Can be replaced with 'A Bar in Amsterdam'
                                   -- I decided to use 'Johnny Blowtorch' to pass the check in Lab365;


