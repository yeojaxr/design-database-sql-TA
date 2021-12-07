SHOW DATABASE;
CREATE DATABASE skilvul_music_streaming;
CREATE TABLE User (
    user_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL
);
CREATE TABLE Singer (
    singer_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NUll
);
CREATE TABLE Track (
    track_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    singer_id int NOT NULL,
    album_id int NOT NULL,
    CONSTRAINT fk_singertoTrack FOREIGN KEY (singer_id) REFERENCES Singer(singer_id),
    CONSTRAINT fk_albumtoTrack FOREIGN KEY (album_id) REFERENCES Album(album_id)
);
CREATE TABLE Album (
    album_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    singer_id int NOT NULL,
    CONSTRAINT fk_singertoALbum FOREIGN KEY (singer_id) REFERENCES Singer(singer_id)
);
CREATE TABLE Playlist (
    playlist_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    tracks int NOT NULL,
    CONSTRAINT fk_usertoPlaylist FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Track_Playlist (
    track_id int NOT NULL,
    playlist_id int NOT NULL,
    CONSTRAINT fk_tracktoTrackPlaylist FOREIGN KEY (track_id) REFERENCES Track(track_id),
    CONSTRAINT fk_playlisttoTrackPlaylist FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);