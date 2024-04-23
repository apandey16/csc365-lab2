from contextlib import redirect_stdout
import csv

def read_csv(file_path, table_name, length=0):
    openFile = open(file_path, 'r')
    csvFile = csv.reader(openFile)
    header = next(csvFile)
    headers = map((lambda x: '`'+x+'`'), header)
    if length != 0:
        headers = list(headers)[:length]
        insert = 'INSERT INTO ' + table_name +' (' + ", ".join(headers) + ") VALUES "
    else:
        insert = 'INSERT INTO ' + table_name +' (' + ", ".join(headers) + ") VALUES "
    for row in csvFile:
        if length == 0:
            values = map((lambda x: '"'+x+'"'), row)
            print (insert +"("+ ", ".join(values) +");" )
        else:
            values = map((lambda x: '"'+x+'"'), row[:length])
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

def f1_data():
    with open('F1DATASET-populate.sql', 'w') as output_file:
        with redirect_stdout(output_file):
            # LOTS OF UNNEEDED INFO

            # Status holds the status code and what that code means in the entire data set -- statusId and status
            read_csv('./f1_data/status.csv', 'status')
            print()
            # constructorId,constructorRef,name,nationality
            read_csv('./f1_data/constructors.csv', 'constructors', 4)
            print()
            # driverId,driverRef,number,code,forename,surname,dob,nationality
            read_csv('./f1_data/drivers.csv', 'drivers', 8)
            print()
            # circuitId,circuitRef,name,location,country
            read_csv('./f1_data/circuits.csv', 'circuits', 5)
            print()
            # raceId,year,round,circuitId,name
            read_csv('./f1_data/races.csv', 'races', 5)
            print()
            # raceId,driverId,lap,position,time
            read_csv('./f1_data/lap_times.csv', 'LapTimes', 5)
            print()
            # raceId,driverId,stop,lap,time,duration
            read_csv('./f1_data/pit_stops.csv', 'PitStops', 6)
            print()
            # qualifyId,raceId,driverId,constructorId,number,position
            read_csv('./f1_data/qualifying.csv', 'Qualifying', 6)
            print()


def main():
    # airlines()
    # bakery()
    # katzenjammer()
    f1_data()

if __name__ == "__main__":
    main()