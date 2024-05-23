
[General]
Version=1

[Preferences]
Username=
Password=2587
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YEDIDIA
Name=TRAINING
Count=2500

[Record]
Name=ENTREYLEVEL
Type=VARCHAR2
Size=35
Data=list(
='Entry-Level','Junior/Associate','Mid-Level','Senior/Managerial',
='Director/Executive'
=)
Master=

[Record]
Name=TRAININGID
Type=NUMBER
Size=9
Data=Sequence(0, 1,10000)
Master=

[Record]
Name=TRAININGNAME
Type=VARCHAR2
Size=35
Data=List(
='Leadership Development Program',
='Management Training Course',
='Supervisor Development Workshop',
='Executive Education Program',
='Advanced Professional Development Series',
='Career Advancement Bootcamp',
='Succession Planning Seminar',
='Strategic Leadership Retreat',
='Promotion Preparation Workshop',
='Management Excellence Academy'
=)
Master=

[Record]
Name=TRAINERID
Type=NUMBER
Size=9
Data=List(
=
=select id
=from manager
=
=)
Master=

[Record]
Name=TRAINEDID
Type=NUMBER
Size=9
Data=List(
=select id
=from employee
=where id not in (
=    select id
=    from manager
=)
=
=)
Master=

