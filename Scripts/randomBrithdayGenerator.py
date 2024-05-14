from datetime import datetime, timedelta
import random

# Define the start and end dates
start_date = datetime(1974, 1, 1)
end_date = datetime(2004, 12, 31)

# Generate 1000 different dates
dates = set()
while len(dates) < 1000:
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    dates.add(random_date)

# Convert the set of dates to a list
dates_list = list(dates)

# Print the generated dates
for date in dates_list:
    print(date.strftime('%Y-%m-%d'))