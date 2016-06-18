SELECT field.fldName,
       AVG(prfPrdOeNetMillSm3),
       AVG(prfPrdOilNetMillSm3),
       AVG(prfPrdGasNetBillSm3),
       AVG(prfPrdNGLNetMillSm3),
       AVG(prfPrdCondensateNetMillSm3)
FROM field_production_yearly,
     field
WHERE prfNpdidInformationCarrier = fldNpdidField
  AND prfYear < 2013 -- exclude current, and incomplete, year
GROUP BY prfInformationCarrier
ORDER BY AVG(prfPrdOeNetMillSm3) DESC