SELECT seaSurveyTypePart, count(*) FROM seis_acquisition
where seaSurveyTypePart is not null and seaSurveyTypePart <> 'Ikke seismikk'
group by seaSurveyTypePart
