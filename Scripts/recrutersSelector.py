import re
pattern = r"values \((\d+),"

# Open the file containing the SQL queries
with open('../SQL Files/Done/insertEmployeeDetails.sql', 'r') as infile:
    # Open the new file where the filtered queries will be written
    with open('../SQL Files/insertRecruterDetails.sql', 'w') as outfile:
        # Read each line (SQL query) in the input file
        for line in infile:
            # Check if the line contains 'Management'
            if 'Human Resources' in line:

                match = re.search(pattern, line)

                if match:
                    outfile.write(f"insert into Recruter (id) values ({match.group(1)});\n")
                else:
                    print("No id value found.")