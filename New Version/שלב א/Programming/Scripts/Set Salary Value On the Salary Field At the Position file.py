import pandas as pd

# Dictionary of profession titles to salary values
salary_dict = {
    'Secretary': 40.32,
    'Bellboy': 30.42,
    'Customer Service': 33.42,
    'Lawyer': 50.27,
    'Storekeeper': 35.81,
    'Recruter': 41.23,
    'Waiters': 32.21,
    'Guest Service Representative': 43.2,
    'Security Guard': 45.3,
    'Dietician': 46.21,
    'Housekeeper': 40.1,
    'IT Specialist': 40,
    'UX/UI Designer': 34,
    'Masseuse': 50.32,
    'Backend Developer': 70.7,
    'Semi-Manager': 80.2,
    'Fitness Instructor': 40.32,
    'Sales Force': 32.1,
    'Chef': 80.42,
    'Network Administrator': 43.24,
    'Sous-Chef': 40.21,
    'Account Executive': 39.21,
    'Line Cook': 40.21,
    'Cloud Administrator ': 51.3,
    'Social Media Specialist': 31,
    'Bartender': 50,
    'Manager': 100.7,
    'Server': 40.23,
    'Accountant': 54.21,
    'Cleaner': 40.12,
    'Frontend Developer': 63.21,
    'Yoga Instructor': 50.32,
    'Financial Analyst': 43.21
}

# Function to map profession titles to salaries
def map_salary(prof_title):
    return salary_dict.get(prof_title, 0)  # Default to 0 if title not found

# Read the CSV file
input_csv = "DataImportFiles\Positions.csv"
df = pd.read_csv(input_csv)

# Map the salary values based on profession titles
df['salary'] = df['profTitle'].apply(map_salary)

# Write the updated DataFrame to a new CSV file
output_csv = 'DataImportFiles\PositionsWithSalary.csv'
df.to_csv(output_csv, index=False)

print("New CSV file with updated salary column has been created.")

