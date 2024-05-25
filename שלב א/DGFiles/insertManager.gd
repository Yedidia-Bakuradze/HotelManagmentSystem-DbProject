
[General]
Version=1

[Preferences]
Username=
Password=2887
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YEDIDIA
Name=MANAGER
Count=20

[Record]
Name=ID
Type=NUMBER
Size=9
Data=List(
=SELECT emp.id
=FROM employee emp
=natural JOIN position pos
=WHERE pos.role = 'Manager'
=)
Master=

[Record]
Name=ACCESSTYPE
Type=VARCHAR2
Size=1
Data=List('A', 'B', 'C')
Master=

