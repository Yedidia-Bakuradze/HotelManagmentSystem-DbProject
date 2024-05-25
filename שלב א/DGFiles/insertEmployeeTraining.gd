
[General]
Version=1

[Preferences]
Username=
Password=2830
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YEDIDIA
Name=EMPLOYEETRAINING
Count=10000

[Record]
Name=TRAINEDID
Type=NUMBER
Size=9
Data=List(select id from employee where id not in (select id from manager))
Master=

[Record]
Name=TRAININGID
Type=NUMBER
Size=5
Data=List(select trainingid from training)
Master=

