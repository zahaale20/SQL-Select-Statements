-- Lab 4 - BAKERY
-- azaharia@calpoly.edu
-- May 17,2023

SELECT g.Flavor, g.Food, g.Price
FROM goods g
WHERE g.Food = 'cookie' AND g.Price BETWEEN 1 AND 2
ORDER BY g.Flavor;

SELECT g.Flavor, g.Food, g.Price
FROM goods  g
WHERE g.Food = 'Pie'
   OR (g.Price BETWEEN 3.40 AND 3.65)
   OR (g.Food = 'Croissant' AND g.Flavor != 'Apple')
ORDER BY g.Price;

SELECT DISTINCT c.LastName, c.FirstName
FROM customers c, receipts r
WHERE c.CId = r.Customer and r.SaleDate = '2007-10-17'
ORDER BY c.LastName;

SELECT DISTINCT g.Flavor, g.Food
FROM goods g, items i, receipts r
WHERE g.GId = i.Item AND i.Receipt = r.RNumber AND g.Food = 'Croissant' AND r.SaleDate = '2007-10-09'
ORDER BY g.Flavor;

SELECT r.RNumber, g.Flavor, g.Food, r.SaleDate
FROM goods g, items i, receipts r
WHERE g.GId = i.Item AND i.Receipt = r.RNumber AND g.Flavor = 'Apricot' 
GROUP BY r.RNumber, g.Flavor, g.Food, r.SaleDate
HAVING COUNT(i.Item) >= 2
ORDER BY r.SaleDate;

SELECT r.SaleDate
FROM customers c, receipts r
WHERE c.CId = r.Customer AND c.FirstName = 'MIGDALIA' AND c.LastName = 'STADICK'
GROUP BY r.SaleDate
HAVING COUNT(DISTINCT r.RNumber) >= 2
ORDER BY r.SaleDate;


