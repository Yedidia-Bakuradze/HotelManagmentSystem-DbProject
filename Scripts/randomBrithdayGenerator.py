from datetime import datetime, timedelta
import random

start_date = datetime(1974, 1, 1)
end_date = datetime(2004, 12, 31)

dates = set()
while len(dates) < 2500:
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    dates.add(random_date)

dates_list = list(dates)

output_file = 'PDF and CVS\generatedRandomBirthdayDates.txt'
with open(output_file, 'w') as f:
    f.write('[RANDOM]\n')
    for date in dates_list:
        formatted_date = date.strftime('%Y-%m-%d')
        f.write(f"TO_DATE('{formatted_date}'),\n")

