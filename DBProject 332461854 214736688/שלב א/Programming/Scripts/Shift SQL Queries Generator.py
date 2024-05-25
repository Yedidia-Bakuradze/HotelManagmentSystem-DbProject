import datetime
import random

# Initialize start time

start_time =  datetime.datetime(2024, 1, 1, 7, 30)
day = 2
shiftOfDay = 1

locations = ["1st Floor","2nd Floor","3rd Floor","4th Floor","5th Floor","6th Floor","7th Floor","Lobby","Entrance"]

size = len(locations)

# Prepare SQL insert statements

sql_inserts = []


for i in range(2500):
    end_time = start_time + datetime.timedelta(hours=8)

    #Checks if the current shift is Shabbes or at night 
    special = ''

    if(start_time.hour == 23):
        special = "Night"
    if(day == 7 and start_time.hour != 23):
        if(special == ''):
            special = "Shabbes"
        else:
            special += " Shabbes"
    elif(day ==6 and start_time.hour !=7):
        if(special == ''):
            special = "Shabbes"
        else:
            special += " Shabbes"
    

    if(special==''):
        sql_insert = f"INSERT INTO Shift (StartTime, EndTime) VALUES (TO_TIMESTAMP('{start_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('{end_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'));"
    else:
        special = f"\'{special}\'"
        sql_insert = f"INSERT INTO Shift (StartTime, EndTime, SpecialShift) VALUES (TO_TIMESTAMP('{start_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('{end_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'),{special});"
    
    shiftOfDay +=1
    if (shiftOfDay > 3):
        day = day + 1
        if (day >7):
            day = 1
        shiftOfDay = 1;

    # Append SQL insert statement to list

    sql_inserts.append(sql_insert)


    # Increment start time by 8 hours for the next row
    start_time = end_time


with open ('insertIntoShift.sql', "w") as file:

    # Print SQL insert statements

    for sql in sql_inserts:

        file.write(sql + '\n')



