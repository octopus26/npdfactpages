SELECT wlbProductionLicence, COUNT(DISTINCT wlbWell)
FROM 
(
  SELECT wlbProductionLicence, wlbWell
  FROM wellbore_development_all
  UNION
  SELECT wlbProductionLicence, wlbWell
  FROM wellbore_exploration_all
  UNION
  SELECT wlbProductionLicence, wlbWell
  FROM wellbore_shallow_all
) AS t
GROUP BY wlbProductionLicence