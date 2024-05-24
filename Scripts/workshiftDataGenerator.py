import datetime

# Initialize start time
start_time =  datetime.datetime(2024, 4, 1, 7, 30)
locations = ["1st Floor","2nd Floor","3rd Floor","4th Floor","5th Floor","6th Floor","7th Floor","Lobby","Entrance"]
# Prepare SQL insert statements
sql_inserts = []

for i in range(5000):
    # Calculate end time
    end_time = start_time + datetime.timedelta(hours=8)

    # Generate SQL insert statement
    sql_insert = f"INSERT INTO Shift (start_time, end_time, Location) VALUES (TO_TIMESTAMP('{start_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('{end_time.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS'), {locations[random(0,locations.__len__())]});"

    # Append SQL insert statement to list
    sql_inserts.append(sql_insert)

    # Increment start time by 8 hours for the next row
    start_time = end_time

with open ('insertWorkShiftInfo.sql', "w") as file:
    # Print SQL insert statements
    for sql in sql_inserts:
        file.write(sql + '\n')


