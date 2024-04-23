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

def bakery():
    with open('BAKERY-populate.sql', 'w') as output_file:
        with redirect_stdout(output_file):
            read_csv('./csc365-lab2_datasets/BAKERY/customers.csv', 'customers')
            print()
            read_csv('./csc365-lab2_datasets/BAKERY/goods.csv', 'goods')
            print()
            # Update this to use the correct date format from online DB
            read_csv('./csc365-lab2_datasets/BAKERY/receipts.csv', 'receipts')
            print()
            read_csv('./csc365-lab2_datasets/BAKERY/items.csv', 'items')
    
def katzenjammer():
    with open('KATZENJAMMER-populate.sql', 'w') as output_file:
        with redirect_stdout(output_file):
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Albums.csv', 'albums')
            print()
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Band.csv', 'band')
            print()
            # Row 10 causes issues, copy from online DB
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Songs.csv', 'Songs')
            print()
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Instruments.csv', 'Instruments')
            print()
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Performance.csv', 'Performance')
            print()
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Tracklists.csv', 'tracklists')
            print()
            read_csv('./csc365-lab2_datasets/KATZENJAMMER/Vocals.csv', 'vocals')

def main():
    # airlines()
    # bakery()
    katzenjammer()

if __name__ == "__main__":
    main()