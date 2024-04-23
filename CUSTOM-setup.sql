DROP TABLE IF EXISTS PitStops;
DROP TABLE IF EXISTS LapTimes;
DROP TABLE IF EXISTS Qualifying;
DROP TABLE IF EXISTS races;
DROP TABLE IF EXISTS constructors;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS circuits;

-- constructorIs, constructorRef, name, nationality
CREATE TABLE constructors(
    constructorId int PRIMARY KEY,
    constructorRef varchar(100) NOT NULL UNIQUE,
    name varchar(100) NOT NULL UNIQUE,
    nationality varchar(100) NOT NULL
);

-- driverId,driverRef,number,code,forename,surname,dob,nationality
CREATE TABLE drivers(
    driverId int PRIMARY KEY,
    driverRef varchar(50) UNIQUE,
    -- This isn't a number, some drivers have a /n and also the number changes each season
    `number` varchar(3) NOT NULL,
    -- This is the offical FIA code, but some drivers don't have it
    code varchar(3) NOT NULL,
    forename varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    dob date NOT NULL,
    nationality varchar(50) NOT NULL
);

-- circuitId,circuitRef,name,location,country
CREATE TABLE circuits(
    circuitId int NOT NULL PRIMARY KEY,
    circuitRef varchar(25) NOT NULL UNIQUE,
    name varchar(100) NOT NULL UNIQUE,
    location varchar(30) NOT NULL,
    country varchar(30) NOT NULL
);

-- raceId,year,round,circuitId,name
CREATE TABLE races(
    raceId int PRIMARY KEY NOT NULL,
    `year` year NOT NULL,
    `round` int NOT NULL,
    circuitId int NOT NULL,
    name varchar(100),
    FOREIGN KEY circuitID_for_race (circuitId) references circuits (circuitId)
);

-- raceId,driverId,lap,position,time

CREATE TABLE LapTimes(
    raceId int NOT NULL,
    driverId int NOT NULL,
    lap int NOT NULL,
    position int NOT NULL,
    `time` time NOT NULL,
    FOREIGN KEY raceID_for_lap (raceId) references races(raceId),
    FOREIGN KEY driverID_for_lap (driverId) references drivers(driverId)
);

-- raceId,driverId,stop,lap,time,duration
CREATE TABLE PitStops(
    raceId int NOT NULL,
    driverId int NOT NULL,
    stop int NOT NULL,
    lap int NOT NULL,
    `time` time NOT NULL,
    duration decimal(3) NOT NULL,
    FOREIGN KEY raceID_for_pits (raceId) references races(raceId),
    FOREIGN KEY driverID_for_pits (driverId) references drivers(driverId)
);

-- qualifyId,raceId,driverId,constructorId,number,position
CREATE TABLE Qualifying(
    qualifyId int NOT NULL PRIMARY KEY,
    raceId int NOT NULL,
    driverId int NOT NULL,
    constructorId int NOT NULL,
    `number` varchar(3) NOT NULL,
    position int NOT NULL,
    FOREIGN KEY raceID_for_quali (raceId) references races(raceId),
    FOREIGN KEY driverID_for_quali (driverId) references drivers(driverId),
    FOREIGN KEY constructorId_for_quali (constructorId) references constructors(constructorId)
);

SELECT * FROM constructors;
SELECT * FROM drivers;
SELECT * FROM circuits;
SELECT * FROM races;
SELECT * FROM LapTimes;
SELECT * FROM PitStops;
SELECT * FROM Qualifying;
