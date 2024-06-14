
Select Id,
FirstName as Manager_FirstName,
LastName as Manager_LastName,
Phone as Manager_PhoneNumber,
Email as Manger_EmailAddress,
DEPARTID, 
D2.DEPARTNAME,
LeaveRequestPerDepartment

From Manager M

Natural Join Employee E
Natural Join Position P
Natural Join(
  Select D.DepartId,Count(*) As LeaveRequestPerDepartment
  From
  LeaveRequest LR join Employee E on LR.EmpId = E.Id
  Join Position P On E.PosId = P.PosId
  Join Department D On P.DepartId = D.DEPARTID

  Group By D.DepartId
)
Natural Join Department D2;
