Select ME.ID, FirstName,LastName,Email,
RegularSalary, NightShiftSalary, ShabbatShiftSalary, NightShabbatShiftSalary

From Employee ME,
(
  select RID,Salary,
  RSH, RSC,Salary *8* RSC As RegularSalary,
  NSH, NSC,Salary *8* NSC *1.20 as NightShiftSalary,
  SHSH,SHSC,Salary *8* 1.5 * SHSC as ShabbatShiftSalary,
  NSHSH,NSHSC,Salary*2*8 *NSHSC as NightShabbatShiftSalary
  from Employee E,Position P,
  (
    Select
    RID,RSH,RSC,
    NID,NSH,NSC,
    SHID,SHSH,SHSC,
    NSHID,NSHSH,NSHSC
    
    from 
    (
      (
        (
          (
            Select Id as RID,SpecialShift as RSH, count(*) as RSC
            From Employee E1, EmployeeShift ES1 ,Shift S,Position P

            Where E1.id = ES1.Empid
            And ES1.Starttime = S.STARTTIME
            And SpecialShift Is Null
            And P.Posid = E1.PosId
            And ES1.StartTime Between TO_DATE('01-01-2024','DD-MM-YYYY') and TO_DATE('01-02-2024','DD-MM-YYYY')
            
            Group By Id,SpecialShift
          )
          RS Left Join
          (
            Select Id as NID,SpecialShift as NSH, count(*) as NSC
            From Employee E1, EmployeeShift ES1 ,Shift S,Position P

            Where E1.id = ES1.Empid
            And ES1.Starttime = S.STARTTIME
            And SpecialShift = 'Night'
            And P.Posid = E1.PosId
            And ES1.StartTime Between TO_DATE('01-01-2024','DD-MM-YYYY') and TO_DATE('01-02-2024','DD-MM-YYYY')
            
            Group By Id,SpecialShift
          )
          NS On RS.RID = NS.NID
        )
        Left Join 
        (
          Select Id as SHID,SpecialShift as SHSH, count(*) as SHSC
          From Employee E1, EmployeeShift ES1 ,Shift S,Position P

          Where E1.id = ES1.Empid
          And ES1.Starttime = S.STARTTIME
          And SpecialShift = 'Shabbes'
          And P.Posid = E1.PosId
          And ES1.StartTime Between TO_DATE('01-01-2024','DD-MM-YYYY') and TO_DATE('01-02-2024','DD-MM-YYYY')
            
          Group By Id,SpecialShift
        )
        SHS on RS.RID=Shs.SHID
      )
      Left Join 
      (
        Select Id as NSHID,SpecialShift as NSHSH, count(*) as NSHSC
        From Employee E1, EmployeeShift ES1 ,Shift S,Position P

        Where E1.id = ES1.Empid
        And ES1.Starttime = S.STARTTIME
        And SpecialShift = 'Shabbes'
        And P.Posid = E1.PosId
        And ES1.StartTime Between TO_DATE('01-01-2024','DD-MM-YYYY') and TO_DATE('01-02-2024','DD-MM-YYYY')
        
        Group By Id,SpecialShift
      )
      NSHS on RS.RID=NSHS.NSHID
    )
  ) MIX
  Where E.Id = MIX.RID
  And E.PosId = P.PosId
) TOTAL
where ME.ID = TOTAL.RID

Order By RegularSalary,NightShiftSalary, ShabbatShiftSalary, NightShabbatShiftSalary;
