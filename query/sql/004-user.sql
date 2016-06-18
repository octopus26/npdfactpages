SELECT wlbProductionLicence, MIN(wlbEntryDate)
FROM wellbore_exploration_all
GROUP BY wlbProductionLicence
ORDER BY wlbProductionLicence
