SELECT fldName, SUBSTRING_INDEX(wlbName, '-', 1)
FROM field
ORDER BY fldName