
Select Id, DEPARTID, D2.DEPARTNAME, FirstName, LastName, LeaveRequestPerDepartment
From Manager M
Natural Join Employee E
Natural Join Position P
Natural Join(
  Select D.DepartId,Count(*) As LeaveRequestPerDepartment
  From
  LeaveRequest LR join Employee E on LR.EmpId = E.Id
  Join Position P On E.PosId = P.PosId
  Join Department D On P.DepartId = D.DEPARTID


  Where Status = 'Approved'
  Group By D.DepartId
)
Natural Join Department D2;
