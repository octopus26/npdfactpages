SELECT fclBelongsToName as field, fclName as facility, fclKind as type
FROM facility_fixed
WHERE fclBelongsToKind = 'FIELD'
ORDER BY field