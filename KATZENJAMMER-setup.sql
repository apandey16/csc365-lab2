DROP TABLE IF EXISTS Instruments;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS tracklists;
DROP TABLE IF EXISTS vocals;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS band;

-- AId: unique identifier of the album
-- Title: title of the album
-- Year: year the album was released
-- Label: label (record company) that released the album
-- Type: type of recording (studio, live, etc.)

CREATE TABLE albums(
    AId int PRIMARY KEY,
    Title varchar(100) UNIQUE NOT NULL,
    Year year NOT NULL,
    Label varchar(100) NOT NULL,
    `Type` varchar(20) NOT NULL
);

SELECT * FROM albums;

-- Id: unique id of each band member
-- Firstname: first name of each band member
-- Lastname: last name of each band member
CREATE TABLE band(
    Id int PRIMARY KEY,
    Firstname varchar(100) NOT NULL,
    Lastname varchar(100) NOT NULL
);

SELECT * FROM band;

-- SongId: unique identifier of the song
-- Title: song title
CREATE TABLE Songs (
    SongId int PRIMARY KEY,
    Title varchar(100) NOT NULL UNIQUE
);

SELECT * FROM Songs;

-- SongId: id of the song (see Songs.SongId)
-- BandmateId: id of the band member (see Band.Id)
-- Instrument: name of the instrument played [1]  
CREATE TABLE Instruments(
    SongId int NOT NULL,
    BandmateId int NOT NULL,
    Instrument varchar(100) NOT NULL,
    UNIQUE(SongId, Instrument),
    FOREIGN KEY song_key (SongId) references Songs(SongId),
    FOREIGN KEY member_key (BandmateId)references band(Id)
);

SELECT * FROM Songs;

-- SongId: id of the song (see Songs.SongId)
-- Bandmate: id of the band member (see Band.Id)
-- StagePosition: stage position of the band member during the live 
--                 performances of the song [2]

CREATE TABLE Performance(
    SongId int NOT NULL,
    Bandmate int NOT NULL,
    StagePosition varchar(7) NOT NULL,
    UNIQUE(SongId, Bandmate),
    FOREIGN KEY song_preformance_key (SongId)references Songs(SongId),
    FOREIGN KEY member_preformance_key (Bandmate) references band(Id)
);  

-- AlbumId:  id of the album (see Albums.Aid)
-- Position:  position of the song on the album (first, second, etc...)
-- SongId:  id of the song (see Songs.SongId)
CREATE TABLE tracklists (
    AlbumId int NOT NULL,
    Position int NOT NULL,
    SongId int NOT NULL,
    FOREIGN KEY album_tracklist (AlbumId) references albums(AId),
    FOREIGN KEY song_tracklist (SongId) references Songs(SongId)
);

SELECT * FROM tracklists;

-- SongId: id of the song (see Songs.SongId)
-- Bandmate: id of the band member (see Band.Id)
-- Type: type of vocal performance of the band member on the song [3]
CREATE TABLE vocals(
    SongId int NOT NULL,
    Bandmate int NOT NULL,
    `Type` varchar(20) NOT NULL,
    FOREIGN KEY song_vocals_key (SongId)references Songs(SongId),
    FOREIGN KEY member_vocals_key (Bandmate) references band(Id)
);

SELECT * FROM vocals;