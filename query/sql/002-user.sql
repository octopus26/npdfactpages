SELECT a.prlName, a.cmpLongName, a.prlOperDateValidFrom
FROM licence_oper_hst a
WHERE a.prlOperDateValidFrom IN 
  (SELECT MAX(b.prlOperDateValidFrom) 
   FROM licence_oper_hst b
   WHERE a.prlName = b.prlName)
ORDER BY a.prlName
