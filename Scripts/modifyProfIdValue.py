import csv

def generate_prof_id_with_count(depart_id, prof_id, employee_count):
    return f"{depart_id}{prof_id}{employee_count}"

def main(input_csv_file, output_csv_file):
    # Read the input CSV file
    with open(input_csv_file, 'r') as infile:
        reader = csv.reader(infile)
        header = next(reader)  # Skip the header row
        data = list(reader)

    # Initialize counters
    employee_counts = {}
    result_data = []

    # Process each row
    for row in data:
        depart_id, prof_id, prof_title = row
        if depart_id not in employee_counts:
            employee_counts[depart_id] = 4
        else:
            employee_counts[depart_id] += 1

        # Generate the new prof_id with employee count
        new_prof_id = generate_prof_id_with_count(depart_id, prof_id, employee_counts[depart_id])
        result_data.append([depart_id, new_prof_id, prof_title])

    # Write the result to the output CSV file
    with open(output_csv_file, 'w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerow(header)
        writer.writerows(result_data)

if __name__ == "__main__":
    input_csv_file = "PDF and CVS\\newRecruters.csv"  # Replace with your actual input file name
    output_csv_file = "newRecrutersOut.csv"  # Replace with your desired output file name
    main(input_csv_file, output_csv_file)
    print(f"Output written to {output_csv_file}")
