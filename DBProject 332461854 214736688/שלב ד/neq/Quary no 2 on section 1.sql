SELECT AreaID, COUNT(*) AS NumberOfRequests
FROM Dept1_MaintenanceDetails
GROUP BY AreaID;
