SELECT prfInformationCarrier ,
       SUM(prfPrdOilNetMillSm3) AS sumOil,
       SUM(prfPrdGasNetBillSm3) AS sumGas
FROM field_production_monthly AS prod,
     field
WHERE prod.prfNpdidInformationCarrier = field.fldNpdidField
  AND prod.prfYear = 2010
  AND prod.prfMonth >= 1
  AND prod.prfMonth <= 6
  AND field.cmpLongName = 'Statoil Petroleum AS'
GROUP BY prfInformationCarrier
ORDER BY prfInformationCarrier