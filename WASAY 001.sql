CREATE DATABASE Transport_Management_System;

USE Transport_Management_System;

CREATE TABLE Vehicles (
  Vehicle_ID INT PRIMARY KEY,
  Make VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  License_Plate VARCHAR(20)
);

CREATE TABLE Drivers (
  Driver_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  License_Number VARCHAR(20),
  Contact_Info VARCHAR(100)
);

CREATE TABLE Routes (
  Route_ID INT PRIMARY KEY,
  Origin VARCHAR(50),
  Destination VARCHAR(50),
  Distance DECIMAL(10, 2)
);

CREATE TABLE Trips (
  Trip_ID INT PRIMARY KEY,
  Vehicle_ID INT,
  Driver_ID INT,
  Route_ID INT,
  Departure_Time DATETIME,
  Arrival_Time DATETIME,
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID),
  FOREIGN KEY (Driver_ID) REFERENCES Drivers(Driver_ID),
  FOREIGN KEY (Route_ID) REFERENCES Routes(Route_ID)
);

CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Info VARCHAR(100)
);

CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY,
  Trip_ID INT,
  Passenger_ID INT,
  Seat_Number INT,
  FOREIGN KEY (Trip_ID) REFERENCES Trips(Trip_ID),
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID)
);

CREATE TABLE Fuel_Logs (
  Fuel_Log_ID INT PRIMARY KEY,
  Vehicle_ID INT,
  Date DATE,
  Fuel_Amount DECIMAL(10, 2),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);

CREATE TABLE Maintenance_Records (
  Maintenance_ID INT PRIMARY KEY,
  Vehicle_ID INT,
  Date DATE,
  Description VARCHAR(100),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);

CREATE TABLE Traffic_Violations (
  Violation_ID INT PRIMARY KEY,
  Driver_ID INT,
  Date DATE,
  Violation_Type VARCHAR(50),
  FOREIGN KEY (Driver_ID) REFERENCES Drivers(Driver_ID)
);

CREATE TABLE Accidents (
  Accident_ID INT PRIMARY KEY,
  Vehicle_ID INT,
  Date DATE,
  Description VARCHAR(100),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);
