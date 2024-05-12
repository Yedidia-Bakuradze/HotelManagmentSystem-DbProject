# Open the file containing the SQL queries
with open('insertEmpDetails.sql', 'r') as infile:
    # Open the new file where the filtered queries will be written
    with open('insertRecrutersDetails.sql', 'w') as outfile:
        # Read each line (SQL query) in the input file
        for line in infile:
            # Check if the line contains 'Management'
            if 'Human Resources' in line:
                # Extract the id value
                id_value = line.split('values')[1].split(',')[0].strip("'")
                print(id_value)
                # Write a new SQL query into the output file
                outfile.write(f"insert into Recruter (id) values ('{id_value}');\n")
