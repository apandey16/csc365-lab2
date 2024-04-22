DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS airports;
DROP TABLE IF EXISTS airlines;

-- Id: unique identifier of the airline -- UNIQUE
-- Airline: full name of the airline -- UNIQUE
-- Abbreviation: abbreviated name of the airline -- UNIQUE
-- Country: country of the airline
CREATE TABLE airlines(
    ID int NOT NULL PRIMARY KEY,
    Airline varchar(100) NOT NULL UNIQUE,
    Abbreviation varchar(20) NOT NULL UNIQUE,
    Country varchar(20) NOT NULL
);

SELECT * FROM airlines;

-- City: location of the airport
-- AirportCode: unique three-letter airport code
-- AirportName: name of the airport
-- Country: country of the airport
-- CountryAbbrev: abbreviation of the country
CREATE TABLE airports(
    City varchar(100) NOT NULL,
    AirportCode char(3) NOT NULL PRIMARY KEY,
    AirportName varchar(100) NOT NULL,
    Country varchar(100) NOT NULL,
    CountryAbbrev varchar(25) NOT NULL
);

-- Airline: airline that manages the flight  -- Foreign key with airlines number
-- FlightNo: flight number (unique for each airline, may repeat for different airlines) -- unique composite key
-- SourceAirport: Code for the airport from which the flight originates -- Foreign key with airports
-- DestAirport: Code for the airport at which the flight terminates -- Foreign key with airports, but soruce and dest cant be the same
CREATE TABLE flights(
    Airline int NOT NULL,
    FlightNo int NOT NULL,
    SourceAirport char(3) NOT NULL,
    DestAirport char(3) NOT NULL,
    PRIMARY KEY(Airline, FlightNo),
    FOREIGN KEY (Airline) references airlines(ID),
    FOREIGN KEY (SourceAirport)references airports(AirportCode),
    FOREIGN KEY (DestAirport)references airports(AirportCode),
    CHECK (SourceAirport != DestAirport)
);

SELECT * FROM flights;