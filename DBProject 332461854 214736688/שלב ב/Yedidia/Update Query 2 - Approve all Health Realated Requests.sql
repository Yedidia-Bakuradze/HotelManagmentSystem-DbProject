Update LeaveRequest
Set Status = 'Approved'
where RequestId in (
  select RequestId
  from leaverequest
  where leaveType ='Medical Leave'
  and
  Status != 'Expired'
);
