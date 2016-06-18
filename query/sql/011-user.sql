SELECT DISTINCT *
FROM 
   ( (SELECT wlbName, (wlbTotalCoreLength * 0.3048) AS lenghtM 
      FROM wellbore_core
      WHERE wlbCoreIntervalUom = '[ft  ]'
        AND (wlbTotalCoreLength * 0.3048) > 30
     )
   UNION
     (SELECT wlbName, wlbTotalCoreLength AS lenghtM
      FROM wellbore_core
      WHERE wlbCoreIntervalUom = '[m   ]'
        AND wlbTotalCoreLength > 30
     )
   ) as t
