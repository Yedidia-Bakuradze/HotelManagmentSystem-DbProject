import re
# Regular expression pattern to match the id value
pattern = r"values \((\d+),"

# Open the file containing the SQL queries
with open('../SQL Files/insertEmployeeDetails.sql', 'r') as infile:
    # Open the new file where the filtered queries will be written
    with open('../SQL Files/insertManagerDetails.sql', 'w') as outfile:
        # Read each line (SQL query) in the input file
        for line in infile:
            # Check if the line contains 'Management'
            if 'Management' in line:
                # Use the re module to find matches
                match = re.search(pattern, line)

                if match:
                    outfile.write(f"insert into Manager (id, departId) values ({match.group(1)});\n")
                else:
                    print("No id value found.")