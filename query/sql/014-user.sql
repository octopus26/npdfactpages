SELECT DISTINCT cores.wlbName, cores.lenghtM, wellbore.wlbDrillingOperator, wellbore.wlbCompletionYear
FROM
   ( (SELECT wlbName, wlbNpdidWellbore, (wlbTotalCoreLength * 0.3048) AS lenghtM
      FROM wellbore_core
      WHERE wlbCoreIntervalUom = '[ft  ]'
     )
   UNION
     (SELECT wlbName, wlbNpdidWellbore, wlbTotalCoreLength AS lenghtM
      FROM wellbore_core
      WHERE wlbCoreIntervalUom = '[m   ]'
     )
   ) as cores,
   ( (SELECT wlbNpdidWellbore, wlbDrillingOperator, wlbCompletionYear
      FROM wellbore_development_all
     )
   UNION
     (SELECT wlbNpdidWellbore, wlbDrillingOperator, wlbCompletionYear
      FROM wellbore_exploration_all
     )
   UNION
     (SELECT wlbNpdidWellbore, wlbDrillingOperator, wlbCompletionYear
      FROM wellbore_shallow_all
     )
   ) as wellbore
WHERE wellbore.wlbNpdidWellbore = cores.wlbNpdidWellbore
  AND wellbore.wlbDrillingOperator LIKE '%STATOIL%'
  AND wlbCompletionYear < 2008
  AND lenghtM < 10
ORDER BY cores.wlbName