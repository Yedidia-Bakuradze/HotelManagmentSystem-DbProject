# Open the file containing the SQL queries
with open('insertEmpDetails.sql', 'r') as infile:
    # Open the new file where the filtered queries will be written
    with open('insertManagersDetails.sql', 'w') as outfile:
        # Read each line (SQL query) in the input file
        for line in infile:
            # Check if the line contains 'Management'
            if 'Management' in line:
                # Extract the id value
                id_value = line.split('values')[1].split(',')[0].strip("'")
                print(id_value)
                # Write a new SQL query into the output file
                outfile.write(f"SELECT * FROM Employee WHERE id = '{id_value}';\n")
