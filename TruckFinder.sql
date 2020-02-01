CREATE DATABASE TruckFindr;
USE TruckFindr;

CREATE TABLE Users(
    userID INT(10) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
);

CREATE TABLE TruckInfo(
    truckID INT(10) PRIMARY KEY AUTO_INCREMENT,
    truckName VARCHAR(20) NOT NULL,
    foodMenu VARCHAR(100) NOT NULL,
    beverages VARCHAR(100) NOT NULL,
    hours VARCHAR(15) NOT NULL,
    address VARCHAR(20) NOT NULL,
    latitude FLOAT(10) NOT NULL,
    longitude FLOAT(10) NOT NULL,
    rating FLOAT(5) NOT NULL,
    
    FOREIGN KEY(truckID) REFERENCES Users(userID)
);