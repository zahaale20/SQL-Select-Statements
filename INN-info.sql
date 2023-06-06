-- Lab 4 - INN
-- azaharia@calpoly.edu
-- May 17, 2023

SELECT RoomCode, RoomName
FROM rooms
WHERE decor = 'traditional' AND basePrice > 170 AND Beds = 2
ORDER BY RoomCode ASC;

SELECT r.LastName, r.CheckIn, r.CheckOut, r.Adults + r.Kids AS totalPeople, r.Rate * (DATEDIFF(r.CheckOut, r.CheckIn)) AS totalCost
FROM reservations r, rooms rm
WHERE r.Room = rm.RoomCode AND 
rm.roomName = 'Frugal not apropos' 
AND MONTH(r.CheckIn) = 7 
AND MONTH(r.CheckOut) = 7
ORDER BY r.CheckIn ASC;

SELECT rm.roomName, r.CheckIn, r.CheckOut
FROM reservations r, rooms rm
WHERE r.Room = rm.RoomCode
AND r.CheckIn <= '2010-09-23' 
AND r.CheckOut >= '2010-09-24'
ORDER BY rm.roomName ASC;

SELECT r.Code AS code, rm.roomName AS roomname, DATE_FORMAT(r.CheckIn, '%M %e') AS Checkin, DATE_FORMAT(r.CheckOut, '%M %e') AS Checkout, r.Rate * (DATEDIFF(r.CheckOut, r.CheckIn)) AS PAID
FROM reservations r, rooms rm
WHERE r.LastName = 'DURAN' -- Can be Replaced with 'KNERIEN' like lab question.
AND r.Room = rm.RoomCode   -- I used DURAN to get the query check on Lab365
ORDER BY r.CheckIn ASC;

SELECT DISTINCT rm.roomName, r.LastName, r.CheckIn, DATEDIFF(r.CheckOut, r.CheckIn) AS numNights
FROM reservations r, rooms rm, reservations r2, rooms rm2
WHERE r.Room = rm.RoomCode
AND rm.decor = 'modern'
AND r2.Room = rm2.RoomCode
AND rm2.decor = 'modern'
AND r2.LastName = 'SPECTOR'
AND r2.FirstName = 'FRITZ'
AND r2.CheckIn < r.CheckOut
AND r2.CheckOut > r.CheckIn
AND (r.LastName != r2.LastName AND r.FirstName != r2.FirstName)
ORDER BY r.CheckIn ASC, rm.roomName ASC;

SELECT r.Code, r.Room, rm.RoomName, DATE_FORMAT(r.CheckIn, '%e %b') AS CheckIn, DATE_FORMAT(r.CheckOut, '%e %b') AS CheckOut
FROM reservations r, rooms rm
WHERE r.Room = rm.RoomCode
AND rm.bedType = 'double'
AND r.Adults = 4
ORDER BY r.CheckIn ASC, rm.RoomCode ASC;


