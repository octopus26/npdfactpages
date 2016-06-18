SELECT field.fldName
       prfPrdOeNetMillSm3,
       prfPrdOilNetMillSm3,
       prfPrdGasNetBillSm3,
       prfPrdNGLNetMillSm3,
       prfPrdCondensateNetMillSm3
FROM field_production_monthly a,
     field
WHERE prfNpdidInformationCarrier = fldNpdidField
  AND prfPrdOeNetMillSm3 IN
  (SELECT MAX(prfPrdOeNetMillSm3)
   FROM field_production_monthly b
   WHERE a.prfNpdidInformationCarrier = b.prfNpdidInformationCarrier
   GROUP BY b.prfInformationCarrier)
ORDER BY prfPrdOeNetMillSm3 DESC