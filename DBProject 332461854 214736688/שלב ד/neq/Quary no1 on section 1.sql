SELECT RequestID, Urgency, AreaID, Availability
FROM Dept1_MaintenanceDetails
WHERE Urgency = 'High' AND Availability = 'Available';
