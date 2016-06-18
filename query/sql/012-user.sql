SELECT DISTINCT strat.lsuName, cores.wlbName AS wlbName
FROM wellbore_core AS cores, strat_litho_wellbore AS strat
WHERE cores.wlbNpdidWellbore = strat.wlbNpdidWellbore
  AND ( ( cores.wlbCoreIntervalUom = '[ft  ]'
          AND 
	  (GREATEST(cores.wlbCoreIntervalTop * 0.3048, strat.lsuTopDepth)
	   < LEAST(cores.wlbCoreIntervalBottom * 0.3048, strat.lsuBottomDepth))
        )
        OR
        ( cores.wlbCoreIntervalUom = '[m   ]'
          AND 
	  (GREATEST(cores.wlbCoreIntervalTop, strat.lsuTopDepth)
	   < LEAST(cores.wlbCoreIntervalBottom, strat.lsuBottomDepth)
          )
        )
      )
ORDER BY strat.lsuName, wlbName
