SELECT DISTINCT a.prlName, a.cmpLongName, a.prlLicenseeInterest, a.prlLicenseeDateValidTo
FROM licence_licensee_hst a
WHERE a.prlLicenseeDateValidTo IN
  (SELECT MAX(b.prlLicenseeDateValidTo)
   FROM licence_licensee_hst b
   WHERE a.prlName = b.prlName
   GROUP BY b.prlName)
ORDER BY a.prlName