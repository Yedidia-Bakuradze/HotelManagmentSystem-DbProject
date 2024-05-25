
[General]
Version=1

[Preferences]
Username=
Password=2048
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YEDIDIA
Name=EMPLOYEESHIFT
Count=5000

[Record]
Name=EMPID
Type=NUMBER
Size=9
Data=List(select id from employee)
Master=

[Record]
Name=STARTTIME
Type=TIMESTAMP(6)
Size=11
Data=Starttimes
Master=

