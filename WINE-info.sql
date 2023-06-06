-- Lab 4 - WINE
-- azaharia
-- May 17, 2023

SELECT w.Name, w.Winery, w.Score
FROM wine w, appellations a
WHERE w.Appellation = a.Appellation
AND w.Grape = 'Zinfandel'
AND w.Vintage = 2008
AND a.Appellation = 'Napa Valley'
ORDER BY w.Score DESC;

SELECT DISTINCT g.Grape
FROM wine w, grapes g
WHERE w.Grape = g.Grape
AND g.Color = 'White'
AND w.Vintage = 2009 
AND w.Score >= 90
ORDER BY g.Grape ASC;

SELECT DISTINCT a.Appellation, a.County
FROM wine w, appellations a
WHERE a.County = 'Sonoma' 
AND w.Grape = 'Grenache' 
AND w.Appellation = a.Appellation
ORDER BY a.County ASC, a.Appellation ASC;

SELECT DISTINCT w.Vintage
FROM wine w
JOIN appellations a ON w.Appellation = a.Appellation
WHERE a.County = 'Sonoma' 
AND w.Grape = 'Zinfandel' 
AND w.Score > 92
ORDER BY w.Vintage ASC;

SELECT w.Name, w.Vintage, w.Score, w.Price * w.Cases * 12 AS Revenue
FROM wine w
WHERE w.Winery = 'Altamura' 
AND w.Price IS NOT NULL
ORDER BY Revenue DESC;

SELECT SUM(w.price + 2* w2.price + 3*w3.price) 
FROM wine w, wine w2, wine w3
WHERE (w.Name = 'Koplen Vineyard' AND w.Vintage = 2008 AND w.Grape = 'Pinot Noir')
   AND (w2.Name = 'Darius II' AND w2.Vintage = 2007 AND w2.Grape = 'Cabernet Sauvingnon')
   AND (w3.Name = 'McCrea Vineyard' AND w3.Vintage = 2006 AND w3.Grape = 'Chardonnay');


