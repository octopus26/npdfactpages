SELECT prlName, cmpLongName, prlLicenseeDateValidFrom as fromDate, prlLicenseeDateValidTo as toDate
FROM licence_licensee_hst
ORDER BY prlName, fromDate