DELETE FROM leaverequest
WHERE status != 'Approved'
  AND EXTRACT(MONTH FROM startdate) = 4
  AND EXTRACT(YEAR FROM startdate) = 2024;
