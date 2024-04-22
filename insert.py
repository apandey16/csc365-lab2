from contextlib import redirect_stdout
import csv

def read_csv(file_path, table_name):
    openFile = open(file_path, 'r')
    csvFile = csv.reader(openFile)
    header = next(csvFile)
    headers = map((lambda x: '`'+x+'`'), header)
    insert = 'INSERT INTO ' + table_name +' (' + ", ".join(headers) + ") VALUES "
    for row in csvFile:
        values = map((lambda x: '"'+x+'"'), row)
        print (insert +"("+ ", ".join(values) +");" )
    openFile.close()

def airlines():
    with open('AIRLINE-populate.sql', 'w') as output_file:
        with redirect_stdout(output_file):
            read_csv('./csc365-lab2_datasets/AIRLINES/airlines.csv', 'airlines')
            print()
            read_csv('./csc365-lab2_datasets/AIRLINES/airports.csv', 'airports')
            print()
            read_csv('./csc365-lab2_datasets/AIRLINES/flights.csv', 'flights')

def main():
    airlines()

if __name__ == "__main__":
    main()