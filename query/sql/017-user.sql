SELECT field.fldName,
       SUM(prfPrdOeNetMillSm3),
       SUM(prfPrdOilNetMillSm3),
       SUM(prfPrdGasNetBillSm3),
       SUM(prfPrdNGLNetMillSm3),
       SUM(prfPrdCondensateNetMillSm3)
FROM field_production_yearly,
     field
WHERE prfNpdidInformationCarrier = fldNpdidField
--  AND prfYear < 2013 -- exclude current, and incomplete, year
GROUP BY prfInformationCarrier
ORDER BY SUM(prfPrdOeNetMillSm3) DESC