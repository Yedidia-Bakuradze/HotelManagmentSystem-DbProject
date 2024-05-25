import datetime

start_time =  datetime.datetime(2024, 1, 1, 7, 30)

sql_inserts = []

for i in range(2500):
    end_time = start_time + datetime.timedelta(hours=8)

    sql_insert = f"TO_TIMESTAMP(\'{start_time.strftime('%Y-%m-%d %H:%M:%S')}\', 'YYYY-MM-DD HH24:MI:SS')"
    
    sql_inserts.append(sql_insert)

    start_time = end_time

with open ('StartTimes.txt', "w") as file:
    # Print SQL insert statements
    for sql in sql_inserts:
        file.write(sql + '\n')


