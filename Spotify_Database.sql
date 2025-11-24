CREATE TABLE `Account`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`Name` VARCHAR(255) DEFAULT NULL,
  	PRIMARY KEY (`ID`)
);

CREATE TABLE `Subscription`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,	
  	`Account_ID` INT UNSIGNED NOT NULL,
  	`Subscription_Payment_Date_Start` DATETIME NOT NULL,
  	`Subscription_Payment_Date_End` DATETIME,
  	`Amount_Payed` DECIMAL(5,2) NOT NULL,	 
# 0, 9.99, 4.99, 12.99 --> 2 Acc, 15.99 --> 6 Acc
  	`Description` VARCHAR(255) DEFAULT NULL, 
# Free, Individual, Student, Duo, Family
	PRIMARY KEY (`ID`),
  	FOREIGN KEY (`Account_ID`) REFERENCES `Account`(`ID`)
);

CREATE TABLE `Spotify_User` (
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Account_ID` INT UNSIGNED NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Birthday` DATETIME NOT NULL,
  	`User_Password_Hash` VARCHAR(255) DEFAULT NULL,
  	`Email` VARCHAR(255) DEFAULT NULL,
  	`Address` VARCHAR(255) DEFAULT NULL,
  	`ZIP_Code` VARCHAR(255) DEFAULT NULL,
  	`Country` VARCHAR(255) DEFAULT NULL,
  	PRIMARY KEY (`ID`),
  	FOREIGN KEY (`Account_ID`) REFERENCES `Account`(`ID`)
);


CREATE TABLE `Artist`(
  	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`Name` VARCHAR(255) NOT NULL,
  	`Country` VARCHAR(255) DEFAULT NULL,
  	PRIMARY KEY (`ID`)
);

CREATE TABLE `Album`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`Artist_ID` INT UNSIGNED NOT NULL,
  	`Name` VARCHAR(255) NOT NULL,
  	`Release_Date` DATETIME NOT NULL,
    `Genre` VARCHAR(255) DEFAULT NULL,
  	`Description` VARCHAR(255) DEFAULT NULL,
  	PRIMARY KEY (`ID`),
    FOREIGN KEY (`Artist_ID`) REFERENCES `Artist`(`ID`)
);

CREATE TABLE `Title`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	#`Feature_Artist_ID` INT UNSIGNED NOT NULL, # maybe remove?
  	`Name` VARCHAR(255) NOT NULL,
  	`Album_ID` INT UNSIGNED NOT NULL,
  	`Duration` INT NOT NULL, # Has to be in Sec no?
  	`Title_Language` VARCHAR(255) NOT NULL,
  	`Quality` INT NOT NULL,
  	PRIMARY KEY (`ID`),
    # FOREIGN KEY (`Feature_Artist_ID`) REFERENCES `xxxx`(`ID`),
  	FOREIGN KEY (`Album_ID`) REFERENCES `Album`(`ID`)
);

CREATE TABLE `Artist_Follower_list`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,	
    `Artist_ID` INT UNSIGNED NOT NULL,
    `User_ID` INT UNSIGNED NOT NULL,
  	PRIMARY KEY (`ID`),
  	FOREIGN KEY (`User_ID`) REFERENCES `Spotify_User`(`ID`)
);

CREATE TABLE `Playlist` (
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `User_ID` INT UNSIGNED NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Type` VARCHAR(255) DEFAULT NULL, # 'Private', 'Public'
  	`Creation_Date` DATETIME NOT NULL,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`User_ID`) REFERENCES `Spotify_User`(`ID`)
);

CREATE TABLE `Playlist_line`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`Playlist_ID` INT UNSIGNED NOT NULL,
  	`Title_ID` INT UNSIGNED NOT NULL,
  	PRIMARY KEY (`ID`),
    FOREIGN KEY (`Playlist_ID`) REFERENCES `Playlist`(`ID`),
  	FOREIGN KEY (`Title_ID`) REFERENCES `Title`(`ID`)
);

CREATE TABLE `Playlist_Follower_list`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`Playlist_ID` INT UNSIGNED NOT NULL,
  	`User_ID` INT UNSIGNED NOT NULL,
   	PRIMARY KEY (`ID`),
  	FOREIGN KEY (`Playlist_ID`) REFERENCES `Playlist`(`ID`),
  	FOREIGN KEY (`User_ID`) REFERENCES `Spotify_User`(`ID`)
);

CREATE TABLE `Listening_table`(
	`ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  	`User_ID` INT UNSIGNED NOT NULL,
	`Title_ID` INT UNSIGNED NOT NULL,
  	`Last_played_date` DATE NOT NULL,
    PRIMARY KEY (`ID`),
  	FOREIGN KEY (`User_ID`) REFERENCES `Spotify_User`(`ID`),
  	FOREIGN KEY (`Title_ID`) REFERENCES `Title`(`ID`)  
);

# Account 

# Free, Individual, Student, Duo, Family


INSERT INTO `Account` (`Name`) 
VALUES 

## Family
('Brodey Family'), 
('Rizzkrut Family'),
('Sanchez Family'),
('Milk Family'),
('Eriksen Family'), 
('Zhou Family'), 

# Duo 
('Sin Duoo Account'),
('Sisters Sharing'),
('Bro Duo'),
('Espania Share'),

# Stundet
('Stundet1'),
('Stundet2'),
('Stundet3'),
('Stundet4'),
('Stundet5'),
('Stundet6'),
('Stundet7'),
('Stundet8'),
('Stundet9'),
('Stundet10'),
('Stundet11'),
('Stundet12'),
('Stundet13'),
('Stundet14'),
('Stundet15'),
('Stundet16'),
('Stundet17'),
('Stundet18'),
('Stundet19'),
('Stundet20'),
('Stundet21'),
('Stundet22'),
('Stundet23'),

# Individual
('Individual1'),
('Individual2'),
('Individual3'),
('Individual4'),
('Individual5'),
('Individual6'),
('Individual7'),
('Individual8'),
('Individual9'),
('Individual10'),
('Individual11'),
('Individual12'),
('Individual13'),
('Individual14'),
('Individual15'),
('Individual16'),

# Free
('FreeUsers1'),
('FreeUsers2'),
('FreeUsers3'),
('FreeUsers4'),
('FreeUsers5'),
('FreeUsers6'),
('FreeUsers7'),
('FreeUsers8'),
('FreeUsers9'),
('FreeUsers10'),
('FreeUsers11'),
('FreeUsers12'),
('FreeUsers13'),
('FreeUsers14'),
('FreeUsers15'),
('FreeUsers16'),
('FreeUsers17'),
('FreeUsers18'),
('FreeUsers19'),
('FreeUsers20'),
('FreeUsers21'),
('FreeUsers22'),
('FreeUsers23'),
('FreeUsers24'),
('FreeUsers25'),
('FreeUsers26'),
('FreeUsers27'),
('FreeUsers28'),
('FreeUsers29');

# Subscription Familiy 

#Brodey (2022 - Now) 
INSERT INTO `Subscription` (`Account_ID`, `Subscription_Payment_Date_Start`, `Subscription_Payment_Date_End`, `Amount_Payed`, `Description`)
VALUES 
(1, '2022-01-01', '2022-02-01', 15.99, 'Family'),
(1, '2022-02-01', '2022-03-01', 15.99, 'Family'),
(1, '2022-03-01', '2022-04-01', 15.99, 'Family'),
(1, '2022-04-01', '2022-05-01', 15.99, 'Family'),
(1, '2022-05-01', '2022-06-01', 15.99, 'Family'),
(1, '2022-06-01', '2022-07-01', 15.99, 'Family'),
(1, '2022-07-01', '2022-08-01', 15.99, 'Family'),
(1, '2022-08-01', '2022-09-01', 15.99, 'Family'),
(1, '2022-09-01', '2022-10-01', 15.99, 'Family'),
(1, '2022-10-01', '2022-11-01', 15.99, 'Family'),
(1, '2022-11-01', '2022-12-01', 15.99, 'Family'),
(1, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(1, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(1, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(1, '2023-03-01', '2023-04-01', 15.99, 'Family'),

(2, '2022-01-01', '2022-02-01', 15.99, 'Family'),
(2, '2022-02-01', '2022-03-01', 15.99, 'Family'),
(2, '2022-03-01', '2022-04-01', 15.99, 'Family'),
(2, '2022-04-01', '2022-05-01', 15.99, 'Family'),
(2, '2022-05-01', '2022-06-01', 15.99, 'Family'),
(2, '2022-06-01', '2022-07-01', 15.99, 'Family'),
(2, '2022-07-01', '2022-08-01', 15.99, 'Family'),
(2, '2022-08-01', '2022-09-01', 15.99, 'Family'),
(2, '2022-09-01', '2022-10-01', 15.99, 'Family'),
(2, '2022-10-01', '2022-11-01', 15.99, 'Family'),
(2, '2022-11-01', '2022-12-01', 15.99, 'Family'),
(2, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(2, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(2, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(2, '2023-03-01', '2023-04-01', 15.99, 'Family'),

(3, '2022-01-01', '2022-02-01', 15.99, 'Family'),
(3, '2022-02-01', '2022-03-01', 15.99, 'Family'),
(3, '2022-03-01', '2022-04-01', 15.99, 'Family'),
(3, '2022-04-01', '2022-05-01', 15.99, 'Family'),
(3, '2022-05-01', '2022-06-01', 15.99, 'Family'),
(3, '2022-06-01', '2022-07-01', 15.99, 'Family'),
(3, '2022-07-01', '2022-08-01', 15.99, 'Family'),
(3, '2022-08-01', '2022-09-01', 15.99, 'Family'),
(3, '2022-09-01', '2022-10-01', 15.99, 'Family'),
(3, '2022-10-01', '2022-11-01', 15.99, 'Family'),
(3, '2022-11-01', '2022-12-01', 15.99, 'Family'),
(3, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(3, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(3, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(3, '2023-03-01', '2023-04-01', 15.99, 'Family'),

(4, '2022-08-01', '2022-09-01', 15.99, 'Family'),
(4, '2022-09-01', '2022-10-01', 15.99, 'Family'),
(4, '2022-10-01', '2022-11-01', 15.99, 'Family'),
(4, '2022-11-01', '2022-12-01', 15.99, 'Family'),
(4, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(4, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(4, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(4, '2023-03-01', '2023-04-01', 15.99, 'Family'),

(5, '2022-08-01', '2022-09-01', 15.99, 'Family'),
(5, '2022-09-01', '2022-10-01', 15.99, 'Family'),
(5, '2022-10-01', '2022-11-01', 15.99, 'Family'),
(5, '2022-11-01', '2022-12-01', 15.99, 'Family'),
(5, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(5, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(5, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(5, '2023-03-01', '2023-04-01', 15.99, 'Family'),

(6, '2022-12-01', '2023-01-01', 15.99, 'Family'),
(6, '2023-01-01', '2023-02-01', 15.99, 'Family'),
(6, '2023-02-01', '2023-03-01', 15.99, 'Family'),
(6, '2023-03-01', '2023-04-01', 15.99, 'Family'),

# Duo 
(7, '2022-12-01', '2023-01-01', 12.99, 'Duo'),
(7, '2023-01-01', '2023-02-01', 12.99, 'Duo'),
(7, '2023-02-01', '2023-03-01', 12.99, 'Duo'),
(7, '2023-03-01', '2023-04-01', 12.99, 'Duo'),

(8, '2023-01-01', '2023-02-01', 12.99, 'Duo'),
(8, '2023-02-01', '2023-03-01', 12.99, 'Duo'),
(8, '2023-03-01', '2023-04-01', 12.99, 'Duo'),

(9, '2022-12-01', '2023-01-01', 12.99, 'Duo'),
(9, '2023-01-01', '2023-02-01', 12.99, 'Duo'),
(9, '2023-02-01', '2023-03-01', 12.99, 'Duo'),
(9, '2023-03-01', '2023-04-01', 12.99, 'Duo'),
 
(10, '2023-02-01', '2023-03-01', 12.99, 'Duo'),
(10, '2023-03-01', '2023-04-01', 12.99, 'Duo'),

# Student
(11, '2022-08-01', '2022-09-01', 4.99, 'Student'),
(11, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(11, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(11, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(11, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(11, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(12, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(12, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(13, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(13, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(13, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(13, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(13, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(13, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(13, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(14, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(14, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(14, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(14, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(15, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(15, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(15, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(15, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(15, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(15, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(15, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(16, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(16, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(16, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(16, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(16, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(16, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(16, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(17, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(17, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(17, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(17, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(17, '2023-02-01', '2023-03-01', 4.99, 'Student'),

(18, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(18, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(18, '2022-12-01', '2023-01-01', 4.99, 'Student'),

(19, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(20, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(20, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(20, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(20, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(20, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(20, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(20, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(21, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(21, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(21, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(21, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(21, '2023-02-01', '2023-03-01', 4.99, 'Student'),

(22, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(22, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(22, '2022-12-01', '2023-01-01', 4.99, 'Student'),

(23, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(23, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(23, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(23, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(23, '2023-02-01', '2023-03-01', 4.99, 'Student'),

(24, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(24, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(24, '2022-12-01', '2023-01-01', 4.99, 'Student'),

(25, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(26, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(26, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(26, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(26, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(26, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(26, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(26, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(27, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(27, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(27, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(27, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(28, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(28, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(28, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(28, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(28, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(28, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(28, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(29, '2022-12-01', '2023-01-01', 4.99, 'Student'),

(30, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(31, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(31, '2022-10-01', '2022-11-01', 4.99, 'Student'),
(31, '2022-11-01', '2022-12-01', 4.99, 'Student'),
(31, '2022-12-01', '2023-01-01', 4.99, 'Student'),
(31, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(31, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(31, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(32, '2022-09-01', '2022-10-01', 4.99, 'Student'),
(32, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(32, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(32, '2023-03-01', '2023-04-01', 4.99, 'Student'),

(33, '2023-01-01', '2023-02-01', 4.99, 'Student'),
(33, '2023-02-01', '2023-03-01', 4.99, 'Student'),
(33, '2023-03-01', '2023-04-01', 4.99, 'Student'),

# Individuals: 
(34, '2022-12-01', '2023-01-01', 9.99, 'Individual'),

(35, '2022-11-01', '2022-12-01', 9.99, 'Individual'),
(35, '2022-12-01', '2023-01-01', 9.99, 'Individual'),
(35, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(35, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(35, '2023-03-01', '2023-04-01', 9.99, 'Individual'),


(36, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(37, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(37, '2022-10-01', '2022-11-01', 9.99, 'Individual'),
(37, '2022-11-01', '2022-12-01', 9.99, 'Individual'),

(38, '2022-08-01', '2022-09-01', 9.99, 'Individual'),
(38, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(38, '2022-12-01', '2023-01-01', 9.99, 'Individual'),
(38, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(38, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(38, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(39, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(39, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(40, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(40, '2022-10-01', '2022-11-01', 9.99, 'Individual'),
(40, '2022-11-01', '2022-12-01', 9.99, 'Individual'),
(40, '2022-12-01', '2023-01-01', 9.99, 'Individual'),
(40, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(40, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(40, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(41, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(41, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(41, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(41, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(42, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(42, '2022-10-01', '2022-11-01', 9.99, 'Individual'),
(42, '2022-11-01', '2022-12-01', 9.99, 'Individual'),
(42, '2022-12-01', '2023-01-01', 9.99, 'Individual'),
(42, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(42, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(42, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(43, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(43, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(44, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(44, '2023-01-01', '2023-02-01', 9.99, 'Individual'),
(44, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(44, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(45, '2022-09-01', '2022-10-01', 9.99, 'Individual'),
(45, '2022-10-01', '2022-11-01', 9.99, 'Individual'),
(45, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(45, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

(46, '2023-02-01', '2023-03-01', 9.99, 'Individual'),
(46, '2023-03-01', '2023-04-01', 9.99, 'Individual'),

# Free
(47, '2022-01-01', '2022-02-01', 0, 'Free'),
(47, '2022-02-01', '2022-03-01', 0, 'Free'),
(47, '2022-03-01', '2022-04-01', 0, 'Free'),
(47, '2022-04-01', '2022-05-01', 0, 'Free'),
(47, '2022-05-01', '2022-06-01', 0, 'Free'),
(47, '2022-06-01', '2022-07-01', 0, 'Free'),
(47, '2022-07-01', '2022-08-01', 0, 'Free'),
(47, '2022-08-01', '2022-09-01', 0, 'Free'),
(47, '2022-09-01', '2022-10-01', 0, 'Free'),
(47, '2022-10-01', '2022-11-01', 0, 'Free'),
(47, '2022-11-01', '2022-12-01', 0, 'Free'),
(47, '2022-12-01', '2023-01-01', 0, 'Free'),
(47, '2023-01-01', '2023-02-01', 0, 'Free'),
(47, '2023-02-01', '2023-03-01', 0, 'Free'),
(47, '2023-03-01', '2023-04-01', 0, 'Free'),

(48, '2022-01-01', '2022-02-01', 0, 'Free'),
(48, '2022-02-01', '2022-03-01', 0, 'Free'),
(48, '2022-03-01', '2022-04-01', 0, 'Free'),
(48, '2022-04-01', '2022-05-01', 0, 'Free'),
(48, '2022-05-01', '2022-06-01', 0, 'Free'),
(48, '2022-06-01', '2022-07-01', 0, 'Free'),
(48, '2022-07-01', '2022-08-01', 0, 'Free'),
(48, '2022-08-01', '2022-09-01', 0, 'Free'),
(48, '2022-09-01', '2022-10-01', 0, 'Free'),
(48, '2022-10-01', '2022-11-01', 0, 'Free'),
(48, '2022-11-01', '2022-12-01', 0, 'Free'),
(48, '2022-12-01', '2023-01-01', 0, 'Free'),
(48, '2023-01-01', '2023-02-01', 0, 'Free'),
(48, '2023-02-01', '2023-03-01', 0, 'Free'),
(48, '2023-03-01', '2023-04-01', 0, 'Free'),

(49, '2022-08-01', '2022-09-01', 0, 'Free'),
(49, '2022-09-01', '2022-10-01', 0, 'Free'),
(49, '2022-10-01', '2022-11-01', 0, 'Free'),
(49, '2022-11-01', '2022-12-01', 0, 'Free'),
(49, '2022-12-01', '2023-01-01', 0, 'Free'),
(49, '2023-01-01', '2023-02-01', 0, 'Free'),
(49, '2023-02-01', '2023-03-01', 0, 'Free'),
(49, '2023-03-01', '2023-04-01', 0, 'Free'),

(50, '2022-08-01', '2022-09-01', 0, 'Free'),
(50, '2022-09-01', '2022-10-01', 0, 'Free'),
(50, '2022-10-01', '2022-11-01', 0, 'Free'),
(50, '2022-11-01', '2022-12-01', 0, 'Free'),
(50, '2022-12-01', '2023-01-01', 0, 'Free'),
(50, '2023-01-01', '2023-02-01', 0, 'Free'),
(50, '2023-02-01', '2023-03-01', 0, 'Free'),
(50, '2023-03-01', '2023-04-01', 0, 'Free'),

(51, '2022-12-01', '2023-01-01', 0, 'Free'),
(51, '2023-01-01', '2023-02-01', 0, 'Free'),
(51, '2023-02-01', '2023-03-01', 0, 'Free'),
(51, '2023-03-01', '2023-04-01', 0, 'Free'),
 
(52, '2022-12-01', '2023-01-01', 0, 'Free'),
(52, '2023-01-01', '2023-02-01', 0, 'Free'),
(52, '2023-02-01', '2023-03-01', 0, 'Free'),
(52, '2023-03-01', '2023-04-01', 0, 'Free'),

(53, '2023-01-01', '2023-02-01', 0, 'Free'),
(53, '2023-02-01', '2023-03-01', 0, 'Free'),
(53, '2023-03-01', '2023-04-01', 0, 'Free'),

(54, '2022-12-01', '2023-01-01', 0, 'Free'),
(54, '2023-01-01', '2023-02-01', 0, 'Free'),
(54, '2023-02-01', '2023-03-01', 0, 'Free'),
(54, '2023-03-01', '2023-04-01', 0, 'Free'),
 
(55, '2023-02-01', '2023-03-01', 0, 'Free'),
(55, '2023-03-01', '2023-04-01', 0, 'Free'),

(56, '2022-08-01', '2022-09-01', 0, 'Free'),
(56, '2022-09-01', '2022-10-01', 0, 'Free'),
(56, '2022-12-01', '2023-01-01', 0, 'Free'),
(56, '2023-01-01', '2023-02-01', 0, 'Free'),
(56, '2023-02-01', '2023-03-01', 0, 'Free'),
(56, '2023-03-01', '2023-04-01', 0, 'Free'),

(57, '2022-09-01', '2022-10-01', 0, 'Free'),
(57, '2023-03-01', '2023-04-01', 0, 'Free'),

(58, '2022-09-01', '2022-10-01', 0, 'Free'),
(58, '2022-10-01', '2022-11-01', 0, 'Free'),
(58, '2022-11-01', '2022-12-01', 0, 'Free'),
(58, '2022-12-01', '2023-01-01', 0, 'Free'),
(58, '2023-01-01', '2023-02-01', 0, 'Free'),
(58, '2023-02-01', '2023-03-01', 0, 'Free'),
(58, '2023-03-01', '2023-04-01', 0, 'Free'),

(59, '2022-09-01', '2022-10-01', 0, 'Free'),
(59, '2023-01-01', '2023-02-01', 0, 'Free'),
(59, '2023-02-01', '2023-03-01', 0, 'Free'),
(59, '2023-03-01', '2023-04-01', 0, 'Free'),

(60, '2022-09-01', '2022-10-01', 0, 'Free'),
(60, '2022-10-01', '2022-11-01', 0, 'Free'),
(60, '2022-11-01', '2022-12-01', 0, 'Free'),
(60, '2022-12-01', '2023-01-01', 0, 'Free'),
(60, '2023-01-01', '2023-02-01', 0, 'Free'),
(60, '2023-02-01', '2023-03-01', 0, 'Free'),
(60, '2023-03-01', '2023-04-01', 0, 'Free'),

(61, '2022-09-01', '2022-10-01', 0, 'Free'),
(61, '2022-10-01', '2022-11-01', 0, 'Free'),
(61, '2022-11-01', '2022-12-01', 0, 'Free'),
(61, '2022-12-01', '2023-01-01', 0, 'Free'),
(61, '2023-01-01', '2023-02-01', 0, 'Free'),
(61, '2023-02-01', '2023-03-01', 0, 'Free'),
(61, '2023-03-01', '2023-04-01', 0, 'Free'),

(62, '2022-10-01', '2022-11-01', 0, 'Free'),
(62, '2022-11-01', '2022-12-01', 0, 'Free'),
(62, '2022-12-01', '2023-01-01', 0, 'Free'),
(62, '2023-01-01', '2023-02-01', 0, 'Free'),
(62, '2023-02-01', '2023-03-01', 0, 'Free'),

(63, '2022-10-01', '2022-11-01', 0, 'Free'),
(63, '2022-11-01', '2022-12-01', 0, 'Free'),
(63, '2022-12-01', '2023-01-01', 0, 'Free'),

(64, '2023-03-01', '2023-04-01', 0, 'Free'),

(65, '2022-09-01', '2022-10-01', 0, 'Free'),
(65, '2022-10-01', '2022-11-01', 0, 'Free'),
(65, '2022-11-01', '2022-12-01', 0, 'Free'),
(65, '2022-12-01', '2023-01-01', 0, 'Free'),
(65, '2023-01-01', '2023-02-01', 0, 'Free'),
(65, '2023-02-01', '2023-03-01', 0, 'Free'),
(65, '2023-03-01', '2023-04-01', 0, 'Free'),

(66, '2022-10-01', '2022-11-01', 0, 'Free'),
(66, '2022-11-01', '2022-12-01', 0, 'Free'),
(66, '2022-12-01', '2023-01-01', 0, 'Free'),
(66, '2023-01-01', '2023-02-01', 0, 'Free'),
(66, '2023-02-01', '2023-03-01', 0, 'Free'),

(67, '2022-10-01', '2022-11-01', 0, 'Free'),
(67, '2022-11-01', '2022-12-01', 0, 'Free'),
(67, '2022-12-01', '2023-01-01', 0, 'Free'),

(68, '2022-10-01', '2022-11-01', 0, 'Free'),
(68, '2022-11-01', '2022-12-01', 0, 'Free'),
(68, '2022-12-01', '2023-01-01', 0, 'Free'),
(68, '2023-01-01', '2023-02-01', 0, 'Free'),
(68, '2023-02-01', '2023-03-01', 0, 'Free'),

(69, '2022-10-01', '2022-11-01', 0, 'Free'),
(69, '2022-11-01', '2022-12-01', 0, 'Free'),
(69, '2022-12-01', '2023-01-01', 0, 'Free'),

(70, '2023-03-01', '2023-04-01', 0, 'Free'),

(71, '2022-09-01', '2022-10-01', 0, 'Free'),
(71, '2022-10-01', '2022-11-01', 0, 'Free'),
(71, '2022-11-01', '2022-12-01', 0, 'Free'),
(71, '2022-12-01', '2023-01-01', 0, 'Free'),
(71, '2023-01-01', '2023-02-01', 0, 'Free'),
(71, '2023-02-01', '2023-03-01', 0, 'Free'),
(71, '2023-03-01', '2023-04-01', 0, 'Free'),

(72, '2022-09-01', '2022-10-01', 0, 'Free'),
(72, '2023-01-01', '2023-02-01', 0, 'Free'),
(72, '2023-02-01', '2023-03-01', 0, 'Free'),
(72, '2023-03-01', '2023-04-01', 0, 'Free'),

(73, '2022-09-01', '2022-10-01', 0, 'Free'),
(73, '2022-10-01', '2022-11-01', 0, 'Free'),
(73, '2022-11-01', '2022-12-01', 0, 'Free'),
(73, '2022-12-01', '2023-01-01', 0, 'Free'),
(73, '2023-01-01', '2023-02-01', 0, 'Free'),
(73, '2023-02-01', '2023-03-01', 0, 'Free'),
(73, '2023-03-01', '2023-04-01', 0, 'Free'),

(74, '2022-12-01', '2023-01-01', 0, 'Free'),

(75, '2023-03-01', '2023-04-01', 0, 'Free'),

(76, '2022-12-01', '2023-01-01', 0, 'Free'),
(76, '2022-02-01', '2022-03-01', 0, 'Free'),
(76, '2022-03-01', '2022-04-01', 0, 'Free'),
(76, '2022-04-01', '2022-05-01', 0, 'Free'),
(76, '2022-05-01', '2022-06-01', 0, 'Free'),
(76, '2022-06-01', '2022-07-01', 0, 'Free'),
(76, '2022-07-01', '2022-08-01', 0, 'Free'),
(76, '2022-08-01', '2022-09-01', 0, 'Free'),
(76, '2022-09-01', '2022-10-01', 0, 'Free'),
(76, '2022-10-01', '2022-11-01', 0, 'Free'),
(76, '2022-11-01', '2022-12-01', 0, 'Free'),
(76, '2022-12-01', '2023-01-01', 0, 'Free'),
(76, '2023-01-01', '2023-02-01', 0, 'Free'),
(76, '2023-02-01', '2023-03-01', 0, 'Free'),
(76, '2023-03-01', '2023-04-01', 0, 'Free'),

(77, '2023-01-01', '2023-02-01', 0, 'Free'),
(77, '2023-02-01', '2023-03-01', 0, 'Free'),
(77, '2023-03-01', '2023-04-01', 0, 'Free');

# Spotify_User

INSERT INTO `Spotify_User` (`Account_ID`,`Name`,`Birthday`,`User_Password_Hash`,`Email`,`Address`,`ZIP_Code`,`Country`)
VALUES 
(1,'Niko Brodey', '2001-11-18', '1234', 'brodey.niko@gmail.com', 'Mühlbachergasse, 12', '1130', 'Austria'),
(1,'Anna Brodey', '1998-09-5', 'asdf', 'brodey.anna@gmail.com', 'Mühlbachergasse, 12', '1130', 'Austria'),
(2,'Mikolaj Rozkrut', '2002-08-27', 'Arft64892', 'mikolaj.rizzkrut@gmail.com', 'Jarowita, 12', '7175', 'Poland'),
(2,'Dominik Rozkrut', '1980-05-25', 'wixfixsix3456', 'domino.rizzkrut@gmail.com', 'Jarowita, 12', '7175', 'Poland'),
(2,'Monika Rozkrut', '1980-03-08', 'chyabty123', 'monia.rizzkrut@gmail.com', 'Jarowita, 12', '7175', 'Poland'),
(2,'Dominika Rozkrut', '2004-09-27', 'joljol*3748', 'doma.rizzkrut@gmail.com', 'Jarowita, 12', '7175', 'Poland'),
(3,'Fernando Sanchez', '1999-11-25', 'meksykancehihi23', 'fer.san@gmail.com', 'Saint Monica, 55', '5654', 'Mexico'),
(3,'Sainz Sanchez', '2013-11-25', 'jakieshaslo2', 'sai.san@gmail.com', 'Saint Monica, 55', '5654', 'Mexico'),
(3,'Mona Sanchez', '2011-12-31', 'ololcojest876', 'mon.san@gmail.com', 'Saint Monica, 55', '5654', 'Mexico'),
(4,'Sofia Milk', '1976-07-27', 'gghdsjsiduthrbn4678', 'sofi.milk@gmail.com', 'Premier Street, 51', '5678', 'Austria'),
(4,'Alvarez Milk', '1976-05-22', 'kupajajjd4903', 'alvi.milk@gmail.com', 'Premier Street, 51', '5678', 'Austria'),
(4,'Jung Milk', '2000-05-07', 'hruidknby3u74', 'jung.milk@gmail.com', 'Premier Street, 51', '5678', 'Austria'),
(5,'Jon Eriksen', '1955-06-17', 'msirjj3owk44', 'jon.eriksen@gmail.com', 'Bier, 17', '1118', 'Poland'),
(5,'Thor Eriksen', '1979-08-07', 'frtyu7654', 'thor.eriksen@gmail.com', 'Montro, 91', '1668', 'Poland'),
(5,'Otilla Eriksen', '1985-06-01', 'vftyuiuh567', 'otilla.eriksen@gmail.com', 'Montro, 91', '8908', 'Poland'),
(6,'Kim Zhou', '1988-08-17', 'hguiejwfiioti45', 'kim.zhou@gmail.com', 'Gimir-ro, 1', '1118', 'USA'),
(6,'Chan Zhou', '2002-03-17', 'smiesznykor2425', 'chan.zhou@gmail.com', 'Gimir-ro, 1', '1118', 'USA'),
(6,'Cho Zhou', '1986-06-13', 'hgrthgfrtyyt67', 'cho.zhou@gmail.com', 'Gimir-ro, 1', '1118', 'USA'),

(7,'John Sin', '1995-07-12', 'abcd', 'johnnyy@smit.hotmail', 'Cloverlane, 7', '10001', 'USA'),
(7,'Jane Sin', '1995-07-12', 'sdfs', 'jane@smit.hotmail', 'Cloverlane, 7', '10001', 'USA'),

(8, 'Emily Blunt', '1999-03-20', 'efgh', 'emily.johnson@gmail.com', '123 Main St', '90210', 'USA'),
(8,'Jessica Jones', '1994-11-29', 'ijkl', 'jessica.chan@gmail.com', '1234 Main St', 'V5Y 1J6', 'USA'),

(9,'Takeshi Nakamura', '1990-05-10', 'mnop', 'takeshi.nakamura@gmail.com', 'Tokyostreet, 555', '106-6101', 'Poland'),
(9,'Carlos Ruiz', '1996-02-15', 'password123', 'carlos.ruiz@example.com', 'Calle Alcala, 123', '28009', 'Poland'),

(10,'Ana Silva', '1993-08-27', 'abc123', 'ana.silva@example.com', 'Avenida Paulista, 1234', '01310-100', 'Poland'),
(10,'Francesca Rossi', '1998-06-02', 'password456', 'francesca.rossi@example.com', 'Via del Corso, 567', '00186', 'Poland'),


(11,'Rahul Patel', '1990-11-10', 'qwerty123', 'rahul.patel@example.com', 'S. V. Road, 1234', '400056', 'China'),
(12,'Emily O Connor', '1992-09-15', 'password789', 'emily.oconnor@example.com', '123 Main St', '10001', 'USA'),
(13,'Michael Chen', '1997-04-25', 'password101', 'michael.chen@example.com', '123 George St', '2000', 'Austria'),
(14,'Sophie Mueller', '1994-01-02', 'pass1234', 'sophie.mueller@example.com', 'Kurfürstendamm 123', '10709', 'Austria'),
(15,'Sibusiso Ndlovu', '1991-11-17', 'mysecretpassword', 'sibusiso.ndlovu@example.com', '123 Main St', '2196', 'Austria'),
(16,'Jan Bart', '2001-01-25', 'wegryhaj1421', 'jan.bart@gmail.com', 'Szabadi, 56', '9981', 'China'),
(17,'Henryk Acs', '2004-06-13', 'pasiruw194', 'henri.acs@gmail.com', 'Gangadi, 05', '9986', 'China'),
(18,'Kylien Mesiue', '2004-03-15', 'zeslimein456', 'kyl.mes@gmail.com', 'Park de Poru, 116', '3341', 'China'),
(19,'Baka Saka', '2000-01-01', 'lubiebajke1315', 'baka.saka@gmail.com', 'Croissaint, 11', '3348', 'China'),
(20,'Zinedine Giroud', '1975-09-01', 'walezdynki5', 'zindi.giroud@gmail.com', 'CoffieBrodje, 10', '3249', 'China'),
(21,'Kaas Monete', '1973-01-26', 'smierdziser99389', 'kas.monete@gmail.com', 'Chockobrodje, 36', '6348', 'China'),
(22,'Tom Bagiete', '1996-10-10', 'agietrzajet42*', 'tom.bagietka@gmail.com', 'Salomon Caus, 100', '3498', 'China'),

(23,'Tommy Shelby', '1950-09-13', 'pekyslepvy145', 'tom.shelby@gmail.com', 'Cup of Tea Street, 11', '7758', 'Austria'),
(24,'Harry Grealish', '1989-05-05', 'fosbalespielen214', 'harry.gre@gmail.com', 'Queen Street, 66', '7799', 'Poland'),
(26,'Arthur King', '2000-01-01', 'smiesznehaselkoh424', 'art.kinga@gmail.com', 'King Street, 51', '8888', 'Austria'),
(27,'Ron Potter', '1966-04-23', 'magicznysdfghkq24', 'ron.potter@gmail.com', 'Bus Street, 1', '7748', 'Poland'),
(28,'Johan Ludbruk', '1979-09-23', 'mkikjnbhygfr56', 'johan.ludbruk@gmail.com', 'Oderberg, 191', '1855', 'Poland'),
(29,'Zeid Habibi', '1996-08-23', '234567ygy8', 'zeid.habibi@gmail.com', 'Kebab, 91', '5973', 'Poland'),
(30,'Mohamed Ara', '1999-09-13', 'vdgu8376578', 'moh.ara@gmail.com', 'Shuarma, 667', '5444', 'Poland'),
(31,'Fredericco Bonucci', '1995-03-03', '17248h399', 'fred.bon@gmail.com', 'Pizza, 33', '2903', 'Austria'),
(32,'Fredericco Bonucci', '1995-03-03', '17248h399', 'fred.bon@gmail.com', 'Pizza, 33', '2903', 'Austria'),
(33,"John Doe", "1990-01-01", "password1", "johndoe@email.com", "123 Main St", "12345", "USA"),

# Individual 
(34,"Jane Smith", "1995-02-14", "password2", "janesmith@email.com", "456 Elm St", "67890", "Mexico"),
(35,"Bob Johnson", "1985-05-10", "password3", "bobjohnson@email.com", "789 Oak St", "13579", "Mexico"),
(36,"Emily Davis", "1998-12-31", "password100", "emilydavis@email.com", "111 Pine St", "24680", "Mexico"),
(37,'John Smith', '1990-05-25', 'mypassword123', 'john.smith@example.com', '123 Main St', '10001', 'USA'),
(38,'Jane Doe', '1985-11-12', 'janedoe123', 'jane.doe@example.com', '456 Oak Ave', '90210', 'USA'),
(39,'Mike Johnson', '1995-07-08', 'password1234', 'mike.johnson@example.com', '789 Maple Rd', 'M6G 1M1', 'USA'),
(40,'Emily Thompson', '2001-03-15', 'emilyt123', 'emily.thompson@example.com', '987 Elm St', '90210', 'USA'),
(41,'David Lee', '1992-09-02', 'davidlee123', 'david.lee@example.com', '567 Pine Ave', 'H4C 1G1', 'USA'),
(42,'Karen Williams', '1980-12-01', 'karenw456', 'karen.williams@example.com', '246 Broadway', '10001', 'USA'),
(43,'Michael Kim', '1989-06-10', 'mkim1234', 'michael.kim@example.com', '321 Oak St', 'M6G 1M1', 'USA'),
(44,'Sarah Chang', '1996-01-22', 'sarahc123', 'sarah.chang@example.com', '555 Main St', '90210', 'USA'),
(45,'Alex Rodriguez', '1987-08-07', 'alexrod123', 'alex.rodriguez@example.com', '789 Maple Ave', 'H4C 1G1', 'USA'),
(46,'Grace Lee', '2000-04-05', 'gracelee123', 'grace.lee@example.com', '999 Park Rd', 'M6G 1M1', 'USA'),

# Free
(47,'Steven Chen', '1986-11-30', 'stevenchen123', 'steven.chen@example.com', '456 Elm St', '10001', 'USA'),
(48,'Lucy Lee', '1991-07-18', 'lucylee456', 'lucy.lee@example.com', '789 Maple Rd', 'M6G 1M1', 'Mexico'),
(49,'John Kim', '1998-02-10', 'johnk1234', 'john.kim@example.com', '111 Pine Ave', 'H4C 1G1', 'Mexico'),
(50,'Rachel Smith', '1994-10-07', 'rachels123', 'rachel.smith@example.com', '246 Broadway', '10001', 'USA'),
(51,'Erica Davis', '1983-05-12', 'ericad123', 'erica.davis@example.com', '555 Main St', '90210', 'USA'),
(52,'Daniel Kim', '1988-03-25', 'dkim456', 'daniel.kim@example.com', '789 Maple Ave', 'H4C 1G1', 'Mexico'),
(53,'Sophia Lee', '1997-09-18', 'sophial123', 'sophia.lee@example.com', '999 Park Rd', 'M6G 1M1', 'Poland'),
(54,'Juan Perez', '1991-06-28', 'juanp123', 'juan.perez@example.com', '123 Calle Principal', '28001', 'Poland'),
(55,'Luisa Rodriguez', '1993-09-15', 'luisar123', 'luisa.rodriguez@example.com', '456 Carrera 7', '050022', 'Poland'),
(56,'Mario Rossi', '1985-12-10', 'marior456', 'mario.rossi@example.com', 'Via Roma 123', '00100', 'Italy'),
(57,'Sara Andersen', '1997-03-05', 'saraa1234', 'sara.andersen@example.com', 'Kobmagergade 3', '1150', 'Denmark'),
(58,'Jan Nowak', '1992-08-22', 'jannowak123', 'jan.nowak@example.com', 'ul. Marszalkowska 1', '00-001', 'Poland'),
(59,'Maria Hernandez', '1989-01-12', 'mariah456', 'maria.hernandez@example.com', 'Av. Principal 789', '10200', 'Mexico'),
(60,'Johan Andersson', '1995-05-18', 'johana123', 'johan.andersson@example.com', 'Drottninggatan 10', '111 51', 'USA'),
(61,'Giovanni Russo', '1990-02-27', 'giovannir123', 'giovanni.russo@example.com', 'Via Garibaldi 10', '20121', 'Poland'),
(62,'Ana Silva', '1998-07-08', 'anas456', 'ana.silva@example.com', 'Rua Augusta 123', '1100-048', 'Austria'),
(63,'Kim Lee', '1993-10-15', 'kimm123', 'kim.lee@example.com', 'Gangnam-gu 123', '06001', 'South Korea'),
(64,'Fabio Costa', '1986-04-25', 'fabioc123', 'fabio.costa@example.com', 'Rua do Comercio 456', '01311-020', 'Austria'),
(65,'Sofie Jensen', '1996-11-30', 'sofiej123', 'sofie.jensen@example.com', 'Vesterbrogade 15', '1620', 'Austria'),
(66,'Maximilian Bauer', '1991-02-12', 'maxb1234', 'maximilian.bauer@example.com', 'Schlossplatz 1', '10178', 'Austria'),
(67,'Isabel Martinez', '1990-08-03', 'isabelm456', 'isabel.martinez@example.com', 'Av. 9 de Julio 789', 'C1073ABA', 'USA'),
(68,'Nina Kovac', '1987-05-20', 'ninak123', 'nina.kovac@example.com', 'Trg bana Josipa Jelacica 1', '10000', 'Austria'),
(69,'Luca Ferrari', '1999-12-31', 'lucaf123', 'luca.ferrari@example.com', 'Via della Conciliazione 10', '00193', 'Austria'),
(71,'Hiroshi Yamamoto', '1990-09-23', 'hiroy123', 'hiroshi.yamamoto@example.com', '3-1-1 Marunouchi', '100-0005', 'Austria'),
(72,'Sophie Dubois', '1998-01-04', 'sophied123', 'sophie.dubois@example.com', 'Rue de Rivoli 123', '75001', 'Austria'),
(73,'Pedro Gómez', '1992-07-12', 'pedrog123', 'pedro.gomez@example.com', 'Calle Gran Vía 456', '28013', 'Mexico'),
(74,'Eliza Smith', '1996-04-11', 'elizas123', 'eliza.smith@example.com', '14 Kingsway', 'WC2B 6XF', 'Mexico'),
(75,'Gustav Andersson', '1989-11-02', 'gustava123', 'gustav.andersson@example.com', 'Stora gatan 1', '111 20', 'Mexico'),
(76,'Alessandro Rossi', '1994-06-17', 'alessandror123', 'alessandro.rossi@example.com', 'Piazza del Popolo 10', '00187', 'Mexico'),
(77,'Julia Schmidt', '1997-03-02', 'julias123', 'julia.schmidt@example.com', 'Friedrichstraße 123', '10117', 'Poland');




# TEMPLATE FOR Artist
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Cro', 'Germany');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Ed Sheeran', 'United Kingdom');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Adele', 'United Kingdom');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Beyoncé', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Taylor Swift', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Justin Bieber', 'Canada');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Coldplay', 'United Kingdom');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Drake', 'Canada');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Kendrick Lamar', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Billie Eilish', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Daft Punk', 'France');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Elvis Presley', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Frank Sinatra', 'USA');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Johann Sebastian Bach', 'Germany');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Queen', 'United Kingdom');
INSERT INTO `Artist` (`Name`, `Country`) VALUES ('Louis Armstrong', 'USA');



#TEMPLATE FOR Albums


# 1, Cro
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (1, 'tru.', '2017-09-08', 'Hip-hop', 'Fourth studio album by German rapper Cro.');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (1, 'Melodie', '2014-06-06', 'Hip-hop', 'Third studio album by German rapper Cro.');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (1, 'Raop', '2012-07-06', 'Hip-hop', 'Debut studio album by German rapper Cro, released under Chimperator Productions.');


# 2, Ed Sheeran
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (2, 'Divide', '2017-03-03', 'Pop', 'Third studio album by Ed Sheeran');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (2, 'x', '2014-06-23', 'Pop', 'Second studio album by Ed Sheeran');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (2, '+', '2011-09-09', 'Pop', 'Debut studio album by Ed Sheeran');


#3, Adele 
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(3, '19', '2008-01-28', 'Soul', 'Debut album by British singer-songwriter Adele, featuring the hit single "Chasing Pavements".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(3, '21', '2011-01-24', 'Soul', 'Second studio album by British singer-songwriter Adele, featuring the hit singles "Rolling in the Deep", "Someone Like You", and "Set Fire to the Rain".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (3, '25', '2015-11-20', 'Pop', 'Third studio album by British singer-songwriter Adele, featuring the hit singles "Hello", "Send My Love (To Your New Lover)", and "When We Were Young".');


#4, Beyonce 
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES
(4, 'Dangerously in Love', '2003-06-23', 'R&B', 'Debut studio album by American singer Beyonce, featuring the hit singles "Crazy in Love" and "Baby Boy".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(4, 'B Day', '2006-09-01', 'Pop', 'Second studio album by American singer Beyonce, featuring the hit singles "Irreplaceable", "Déjà Vu", and "Beautiful Liar".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(4, 'I Am... Sasha Fierce', '2008-11-18', 'Pop', 'Third studio album by American singer Beyonce, featuring the hit singles "Single Ladies (Put a Ring on It)", "If I Were a Boy", and "Halo".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(4, '4', '2011-06-24', 'R&B', 'Fourth studio album by American singer Beyonce, featuring the hit singles "Run the World (Girls)", "Best Thing I Never Had", and "Love on Top".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (4, 'Beyonce', '2013-12-13', 'R&B', 'Fifth studio album by American singer Beyonce, featuring the hit singles "Drunk in Love", "Partition", and "XO".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (4, 'Lemonade', '2016-04-23', 'Pop', 'Sixth studio album by American singer Beyonce, featuring the hit singles "Formation", "Sorry", and "Hold Up".');


#5, Taylor Swift
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(5, 'Taylor Swift', '2006-10-24', 'Country', 'Debut studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Tim McGraw", "Teardrops on My Guitar", and "Our Song".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Fearless', '2008-11-11', 'Country', 'Second studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Love Story", "You Belong with Me", and "Fearless".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES(5, 'Speak Now', '2010-10-25', 'Country', 'Third studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Mine", "Back to December", and "Mean".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Red', '2012-10-22', 'Country', 'Fourth studio album by American singer-songwriter Taylor Swift, featuring the hit singles "We Are Never Ever Getting Back Together", "I Knew You Were Trouble", and "22".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, '1989', '2014-10-27', 'Pop', 'Fifth studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Shake It Off", "Blank Space", and "Bad Blood".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Reputation', '2017-11-10', 'Pop', 'Sixth studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Look What You Made Me Do", "Ready for It?", and "End Game".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Lover', '2019-08-23', 'Pop', 'Seventh studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Me!", "You Need to Calm Down", and "Lover".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Folklore', '2020-07-24', 'Alternative', 'Eighth studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Cardigan", "The 1", and "Exile".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (5, 'Evermore', '2020-12-11', 'Alternative', 'Ninth studio album by American singer-songwriter Taylor Swift, featuring the hit singles "Willow", "Champagne Problems", and "No Body, No Crime".');


#6, Justin Bieber 
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (6, 'My World 2.0', '2010-03-23', 'Pop', 'Second studio album by Justin Bieber featuring hit songs such as "Baby" and "Somebody to Love".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (6, 'Believe', '2012-06-15', 'Pop', 'Third studio album by Justin Bieber featuring hit songs such as "Boyfriend" and "As Long As You Love Me".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (6, 'Purpose', '2015-11-13', 'Pop', 'Fourth studio album by Justin Bieber featuring hit songs such as "Sorry" and "Love Yourself".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (6, 'Changes', '2020-02-14', 'Pop', 'Fifth studio album by Justin Bieber featuring hit songs such as "Yummy" and "Intentions".');


#7, Coldplay
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (7, 'Parachutes', '2000-07-10', 'Alternative rock', 'Debut studio album by Coldplay featuring hit songs such as "Yellow" and "Trouble".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (7, 'A Rush of Blood to the Head', '2002-08-26', 'Alternative rock', 'Second studio album by Coldplay featuring hit songs such as "The Scientist" and "Clocks".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (7, 'X&Y', '2005-06-06', 'Alternative rock', 'Third studio album by Coldplay featuring hit songs such as "Speed of Sound" and "Fix You".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (7, 'Viva la Vida or Death and All His Friends', '2008-06-12', 'Alternative rock', 'Fourth studio album by Coldplay featuring hit songs such as "Viva la Vida" and "Violet Hill".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (7, 'Mylo Xyloto', '2011-10-24', 'Alternative rock', 'Fifth studio album by Coldplay featuring hit songs such as "Paradise" and "Every Teardrop Is a Waterfall".');


#8, Drake
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (8, 'Thank Me Later', '2010-06-15', 'Hip hop', 'Debut studio album by Drake featuring hit songs such as "Find Your Love" and "Fancy".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (8, 'Take Care', '2011-11-15', 'Hip hop', 'Second studio album by Drake featuring hit songs such as "Headlines" and "The Motto".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (8, 'Nothing Was the Same', '2013-09-24', 'Hip hop', 'Third studio album by Drake featuring hit songs such as "Started from the Bottom" and "Hold On, We re Going Home".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (8, 'Views', '2016-04-29', 'Hip hop', 'Fourth studio album by Drake featuring hit songs such as "One Dance" and "Hotline Bling".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (8, 'Scorpion', '2018-06-29', 'Hip hop', 'Fifth studio album by Drake featuring hit songs such as "Gods Plan" and "In My Feelings".');


#9, Kendrick Lamar
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (9, 'Section.80', '2011-07-02', 'Hip hop', 'Debut studio album by Kendrick Lamar featuring hit songs such as "HiiiPoWeR" and "A.D.H.D".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (9, 'good kid, m.A.A.d city', '2012-10-22', 'Hip hop', 'Second studio album by Kendrick Lamar featuring hit songs such as "Swimming Pools (Drank)" and "Bitch, Dont Kill My Vibe".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (9, 'To Pimp a Butterfly', '2015-03-15', 'Hip hop', 'Third studio album by Kendrick Lamar featuring hit songs such as "Alright" and "King Kunta".');


#10, Billie Eilish
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (10, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29', 'Pop', 'Debut album by Billie Eilish, featuring hit singles like "Bad Guy", "When the Partys Over", and "Bury a Friend".') ;
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (10, 'Happier Than Ever', '2021-07-30', 'Alternative', 'Second studio album by Billie Eilish, featuring hit singles like "Therefore I Am", "Your Power", and "NDA".');


# 11, Daft Punk
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (11, 'Homework', '1997-01-17', 'House', 'Debut album by Daft Punk, featuring hit singles like "Da Funk" and "Around the World".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (11, 'Discovery', '2001-03-12', 'House', 'Second studio album by Daft Punk, featuring hit singles like "One More Time" and "Harder, Better, Faster, Stronger".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (11, 'Human After All', '2005-03-14', 'Electronic', 'Third studio album by Daft Punk, featuring hit singles like "Robot Rock" and "Technologic".');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (11, 'Random Access Memories', '2013-05-17', 'Electronic', 'Fourth studio album by Daft Punk, featuring hit singles like "Get Lucky" and "Instant Crush".');


#12, Elvis Presley 
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (12, 'Elvis Presley', '1956-03-23', 'Rock and roll', 'Elvis Presleys debut album, featuring hits like "Blue Suede Shoes" and "Heartbreak Hotel."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (12, 'Elvis Is Back!', '1960-04-08', 'Rock and roll', 'Elvis Presleys first album after serving in the army, featuring hits like "Its Now or Never" and "Are You Lonesome Tonight?"');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (12, 'From Elvis in Memphis', '1969-06-17', 'Rock, soul', 'A critically acclaimed album that marked a return to form for Elvis Presley, featuring hits like "Suspicious Minds" and "In the Ghetto."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (12, 'Elvis Country (Im 10,000 Years Old)', '1971-01-02', 'Country', 'An album that showcased Elvis Presleys versatility as a performer, featuring covers of country classics like "Snowbird" and "I Really Dont Want to Know."');


#13, Frank Sinatra 
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (13, 'In the Wee Small Hours', '1955-04-25', 'Traditional pop', 'An album of ballads and torch songs, often regarded as one of Frank Sinatras greatest works.');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (13, 'Come Fly with Me', '1958-01-06', 'Traditional pop', 'A concept album featuring songs about travel and exotic locations, arranged by Billy May.');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (13, 'Strangers in the Night', '1966-06-01', 'Traditional pop', 'An album featuring the hit title track, as well as covers of songs like "Call Me" and "Downtown."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (13, 'Duets', '1993-11-02', 'Traditional pop', 'An album featuring duets between Frank Sinatra and a variety of other artists, including Bono, Aretha Franklin, and Barbra Streisand.');


#14, Johann Sebastian Bach
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (14, 'Brandenburg Concertos', '1721-03-24', 'Classic', 'A collection of six instrumental concertos, considered some of Bachs finest work.');

INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (14, 'St. Matthew Passion', '1727-01-01', 'Classic', 'A large-scale oratorio based on the Passion of Christ, considered one of the greatest achievements of Western classical music.');



#15, Queen
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (15, 'Queen', '1973-07-13', 'Rock', 'Queens debut album, featuring hits like "Keep Yourself Alive" and "Liar."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (15, 'A Night at the Opera', '1975-11-21', 'Rock', 'Queens fourth album, featuring the hit single "Bohemian Rhapsody" and other fan favorites like "You re My Best Friend" and "Love of My Life."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (15, 'The Game', '1980-06-30', 'Rock', 'An album that marked a change in Queens sound, featuring hits like "Another One Bites the Dust" and "Crazy Little Thing Called Love."');


#16, Louis Armstrong
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (16, 'What a Wonderful World', '1968-09-25', 'Jazz', 'An album featuring the hit title track and other popular songs like "Hello, Dolly!" and "Cabaret."');
INSERT INTO `Album`(`Artist_ID`, `Name`, `Release_Date`, `Genre`, `Description`)
VALUES (16, 'Louis Armstrong and His Friends', '1970-01-01', 'Jazz', 'An album featuring collaborations with a variety of artists, including Duke Ellington, Bing Crosby, and Bobby Hackett.');


#Template for Title/Songs


INSERT INTO `Title` (`Name`, `Album_ID`, `Duration`, `Title_Language`, `Quality`)
VALUES 
	('tru.', 1, 194, 'German', 320),
	('Unendlichkeit', 1, 254, 'German', 320),
	('Baum', 1, 233, 'German', 320),
	('Hi Kids', 1, 250, 'German', 320),
	('Egal', 1, 228, 'German', 320),
	('Wie ich bin', 1, 225, 'German', 320),
	('Das alles', 1, 262, 'German', 320),
	('Alien', 1, 212, 'German', 320),
	('Wohlstand', 1, 224, 'German', 320),
	('Tranen', 1, 242, 'German', 320),
	('Alles vorbei', 1, 240, 'German', 320),
	('Hey Girl', 1, 192, 'German', 320),
    
    ('Intro', 2, 65, 'German', 320),
	('Unendlichkeit', 2, 248, 'German', 320),
	('Jeder Tag', 2, 200, 'German', 320),
	('Hey Mensch', 2, 195, 'German', 320),
	('Einfach so', 2, 206, 'German', 320),
	('Du', 2, 203, 'German', 320),
	('Lange her', 2, 228, 'German', 320),
	('Wie du', 2, 237, 'German', 320),
	('Baum', 2, 225, 'German', 320),
	('Melodie', 2, 253, 'German', 320),
	('Einmal um die Welt', 2, 214, 'German', 320),
	('Traum', 2, 219, 'German', 320),
	('Ein Teil', 2, 224, 'German', 320),
	('Wir waren hier', 2, 205, 'German', 320),
	('Outro', 2, 61, 'German', 320),
    
    ('Intro', 3, 85, 'German', 320),
	('Easy', 3, 206, 'German', 320),
	('Du', 3, 215, 'German', 320),
	('King of Raop', 3, 219, 'German', 320),
	('Einmal um die Welt', 3, 214, 'German', 320),
	('Nie mehr', 3, 187, 'German', 320),
	('Bad Chick', 3, 207, 'German', 320),
	('Traum', 3, 219, 'German', 320),
	('Meine Zeit', 3, 221, 'German', 320),
	('Wir waren hier', 3, 205, 'German', 320),
	('Einmal um die Welt (Remix)', 3, 228, 'German', 320),
	('Easy (Remix)', 3, 205, 'German', 320),
	('Einmal um die Welt (Instrumental)', 3, 215, 'Instrumental', 320),

	('Eraser', 4, 227, 'English', 320),
	('Castle on the Hill', 4, 261, 'English', 320),
	('Dive', 4, 238, 'English', 320),
	('Shape of You', 4, 233, 'English', 320),
	('Perfect', 4, 263, 'English', 320),
	('Galway Girl', 4, 170, 'English', 320),
	('Happier', 4, 207, 'English', 320),
	('New Man', 4, 189, 'English', 320),
	('Hearts Don''t Break Around Here', 4, 258, 'English', 320),
	('What Do I Know?', 4, 237, 'English', 320),
	('How Would You Feel (Paean)', 4, 279, 'English', 320),
	('Supermarket Flowers', 4, 221, 'English', 320),

	('One', 5, 253, 'English', 350),
	('I m a Mess', 5, 246, 'English', 350),
	('Sing', 5, 235, 'English', 350),
	('Dont', 5, 219, 'English', 350),
	('Nina', 5, 240, 'English', 350),
	('Photograph', 5, 258, 'English', 350),
	('Bloodstream', 5, 300, 'English', 350),
	('Tenerife Sea', 5, 241, 'English', 350),
	('Runaway', 5, 205, 'English', 350),
	('The Man', 5, 250, 'English', 350),
	('Thinking Out Loud', 5, 281, 'English', 350),
	('Afire Love', 5, 315, 'English', 350),
    
    ('The A Team', 6, 261, 'English', 350),
	('Drunk', 6, 200, 'English', 350),
	('U.N.I.', 6, 228, 'English', 350),
	('Grade 8', 6, 179, 'English', 350),
	('Wake Me Up', 6, 229, 'English', 350),
	('Small Bump', 6, 259, 'English', 350),
	('This', 6, 185, 'English', 350),
	('The City', 6, 224, 'English', 350),
	('Lego House', 6, 304, 'English', 350),
	('You Need Me, I Dont Need You', 6, 278, 'English', 350 ),
    
 
	('Daydreamer', 7, 221, 'English', 270),
	('Best for Last', 7, 259, 'English', 270),
	('Chasing Pavements', 7, 211, 'English', 270),
	('Cold Shoulder', 7, 191, 'English', 270),
	('Crazy for You', 7, 208, 'English', 270),
	('Melt My Heart to Stone', 7, 203, 'English', 270),
	('First Love', 7, 190, 'English', 270),
	('Right as Rain', 7, 197, 'English', 270),
	('Make You Feel My Love', 7, 221, 'English', 270),
	('My Same', 7, 186, 'English', 270),
	('Tired', 7, 259, 'English', 270),
	('Hometown Glory', 7, 271, 'English', 270),
    
  ('Rolling in the Deep', 8, 229, 'English', 270),
	('Rumour Has It', 8, 223, 'English', 270),
	('Turning Tables', 8, 250, 'English', 270),
	('Dont You Remember', 8, 243, 'English', 270),
	('Set Fire to the Rain', 8, 242, 'English', 270),
	('He Wont Go', 8, 278, 'English', 270),
	('Take It All', 8, 228, 'English', 270),
	('I ll Be Waiting', 8, 241, 'English', 270),
	('One and Only', 8, 346, 'English', 270),
	('Lovesong', 8, 317, 'English', 270),
	('Someone Like You', 8, 285, 'English', 270),
    
    ('Hello', 9, 295, 'English', 320),
	('Send My Love (To Your New Lover)', 9, 215, 'English', 320),
	('I Miss You', 9, 366, 'English', 320),
	('When We Were Young', 9, 290, 'English', 320),
	('Remedy', 9, 284, 'English', 320),
	('Water Under the Bridge', 9, 240, 'English', 320),
	('River Lea', 9, 238, 'English', 320),
	('Love in the Dark', 9, 281, 'English', 320),
	('Million Years Ago', 9, 227, 'English', 320),
	('All I Ask', 9, 271, 'English', 320),
	('Sweetest Devotion', 9, 256, 'English', 320),
    
    ('Crazy in Love', 10, 222, 'English', 320),
	('Naughty Girl', 10, 225, 'English', 320),
	('Baby Boy', 10, 256, 'English', 320),
	('Hip Hop Star', 10, 210, 'English', 320),
	('Be with You', 10, 223, 'English', 320),
	('Me, Myself and I', 10, 263, 'English', 320),	
	('Yes', 10, 219, 'English', 320),
	('Signs', 10, 293, 'English', 320),
	('Speechless', 10, 391, 'English', 320),
	('That s How You Like It', 10, 229, 'English', 320),
	('The Closer I Get to You', 10, 272, 'English', 320),
	('Dangerously in Love 2', 10, 304, 'English', 320),
	('Beyoncé Interlude', 10, 28, 'English', 320),
	('Gift from Virgo', 10, 222, 'English', 320),
	('Daddy', 10, 294, 'English', 320),
	('What s It Gonna Be', 10, 259, 'English', 320),
	('Summertime', 10, 258, 'English', 320),
    
   ('Beautiful Liar', 11, 194, 'English', 320),
   ('Déjà Vu', 11, 238, 'English', 320),
	('Get Me Bodied', 11, 356, 'English', 320),
	('Suga Mama', 11, 207, 'English', 320),
	('Upgrade U', 11, 295, 'English', 320),
	('Ring the Alarm', 11, 251, 'English', 320),
	('Kitty Kat', 11, 195, 'English', 320),
	('Freakum Dress', 11, 226, 'English', 320),
	('Green Light', 11, 214, 'English', 320),
	('Irreplaceable', 11, 223, 'English', 320),
	('Resentment', 11, 301, 'English', 320),
    
	('If I Were a Boy', 12, 287, 'English', 320),
	('Halo', 12, 235, 'English', 320),
	('Disappear', 12, 271, 'English', 320),
	('Broken-Hearted Girl', 12, 254, 'English', 320),
	('Ave Maria', 12, 192, 'English', 320),
	('Satellites', 12, 192, 'English', 320),
	('Single Ladies (Put a Ring on It)', 12, 203, 'English', 320),
	('Radio', 12, 202, 'English', 320),
	('Diva', 12, 227, 'English', 320),
	('Sweet Dreams', 12, 226, 'English', 320),
	('Video Phone', 12, 221, 'English', 320),
	('Hello', 12, 241, 'English', 320),
	('Ego', 12, 233, 'English', 320),
	('Scared of Lonely', 12, 259, 'English', 320),
    
	('1+1', 13, 288, 'English', 320),
	('I Care', 13, 231, 'English', 320),
	('I Miss You', 13, 205, 'English', 320),
	('Best Thing I Never Had', 13, 259, 'English', 320),
	('Party', 13, 240, 'English', 320),
	('Rather Die Young', 13, 213, 'English', 320),
	('Start Over', 13, 225, 'English', 320),
	('Love On Top', 13, 239, 'English', 320),
	('Countdown', 13, 212, 'English', 320),
	('End Of Time', 13, 229, 'English', 320),
	('I Was Here', 13, 201, 'English', 320),
	('Run The World (Girls)', 13, 226, 'English', 320),
    
    ('Pretty Hurts', 14, 239, 'English', 320),
	('Haunted', 14, 267, 'English', 320),
	('Drunk in Love', 14, 330, 'English', 320),
	('Blow', 14, 318, 'English', 320),
	('No Angel', 14, 233, 'English', 320),
	('Partition', 14, 325, 'English', 320),
	('Jealous', 14, 226, 'English', 320),
	('Rocket', 14, 344, 'English', 320),
	('Mine', 14, 286, 'English', 320),
	('XO', 14, 218, 'English', 320),
    
    ('Pray You Catch Me', 15, 204, 'English', 375),
    ('Hold Up', 15, 212, 'English', 375),
    ('Don t Hurt Yourself', 15, 181, 'English', 375),
    ('Sorry', 15, 232, 'English', 375),
    ('6 Inch', 15, 221, 'English', 375),
    ('Daddy Lessons', 15, 245, 'English', 375),
    ('Love Drought', 15, 233, 'English', 375),
    ('Sandcastles', 15, 236, 'English', 375),
    ('Forward', 15, 63, 'English', 375),
    ('Freedom', 15, 296, 'English', 375),
    
    ('Tim McGraw', 16, 244, 'English', 320),
    ('Picture to Burn', 16, 162, 'English', 320),
    ('Teardrops on My Guitar', 16, 216, 'English', 320),
    ('A Place in This World', 16, 184, 'English', 320),
    ('Cold as You', 16, 236, 'English', 320),
    ('The Outside', 16, 228, 'English', 320),
    ('Tied Together with a Smile', 16, 256, 'English', 320),
    ('Stay Beautiful', 16, 192, 'English', 320),
    ('Should ve Said No', 16, 244, 'English', 320),
    ('Marys Song (Oh My My My)', 16, 197, 'English', 320),
    
    ('Fearless', 17, 252, 'English', 320),
    ('Fifteen', 17, 257, 'English', 320),
    ('Love Story', 17, 235, 'English', 320),
    ('Hey Stephen', 17, 244, 'English', 320),
    ('White Horse', 17, 228, 'English', 320),
    ('You Belong With Me', 17, 231, 'English', 320),
    ('Breathe', 17, 261, 'English', 320),
    ('Tell Me Why', 17, 211, 'English', 320),
    ('Forever & Always', 17, 230, 'English', 320),
    ('The Best Day', 17, 260, 'English', 320),
   
	('Mine', 18, 228, 'English', 320),
    ('Sparks Fly', 18, 247, 'English', 320),
    ('Back to December', 18, 271, 'English', 320),
    ('Speak Now', 18, 259, 'English', 320),
    ('Dear John', 18, 376, 'English', 320),
    ('Mean', 18, 223, 'English', 320),
    ('The Story of Us', 18, 244, 'English', 320),
    ('Never Grow Up', 18, 248, 'English', 320),
    ('Enchanted', 18, 303, 'English', 320),
    ('Better Than Revenge', 18, 201, 'English', 320),
    
    ('State of Grace', 19, 268, 'English', 320),
	('Red', 19, 231, 'English', 320),
	('Treacherous', 19, 230, 'English', 320),
	('I Knew You Were Trouble', 19, 218, 'English', 320),
	('All Too Well', 19, 327, 'English', 320),
	('22', 19, 207, 'English', 320),
	('I Almost Do', 19, 249, 'English', 320),
	('We Are Never Ever Getting Back Together', 19, 193, 'English', 320),
	('Stay Stay Stay', 19, 188, 'English', 320),
	('The Last Time', 19, 289, 'English', 320),
	('Holy Ground', 19, 202, 'English', 320),
	('Sad Beautiful Tragic', 19, 274, 'English', 320),
	('The Lucky One', 19, 249, 'English', 320),
	('Everything Has Changed', 19, 235, 'English', 320),
	('Starlight', 19, 219, 'English', 320),
	('Begin Again', 19, 239, 'English', 320),
    
    ('Welcome to New York', 20, 212, 'English', 320),	
	('Blank Space', 20, 231, 'English', 320),
	('Style', 20, 232, 'English', 320),
	('Out of the Woods', 20, 231, 'English', 320),
	('All You Had to Do Was Stay', 20, 190, 'English', 320),
	('Shake It Off', 20, 219, 'English', 320),
	('I Wish You Would', 20, 218, 'English', 320),
	('Bad Blood', 20, 231, 'English', 320),
	('Wildest Dreams', 20, 231, 'English', 320),
	('How You Get the Girl', 20, 247, 'English', 320),
	('This Love', 20, 240, 'English', 320),
	('I Know Places', 20, 227, 'English', 320),
	('Clean', 20, 251, 'English', 320),
    
    ('...Ready for It?', 21, 208, 'English', 320),
	('End Game', 21, 256, 'English', 320),
	('I Did Something Bad', 21, 238, 'English', 320),
	('Don’t Blame Me', 21, 231, 'English', 320),
	('Delicate', 21, 232, 'English', 320),
	('Look What You Made Me Do', 21, 211, 'English', 320),
	('So It Goes...', 21, 245, 'English', 320),
	('Gorgeous', 21, 173, 'English', 320),
	('Getaway Car', 21, 229, 'English', 320),
	('King of My Heart', 21, 213, 'English', 320),
	('Dancing with Our Hands Tied', 21, 201, 'English', 320),
	('Dress', 21, 220, 'English', 320),
	('This Is Why We Can’t Have Nice Things', 21, 207, 'English', 320),
	('Call It What You Want', 21, 203, 'English', 320),
	('New Year’s Day', 21, 210, 'English', 320),
    
    ('I Forgot That You Existed', 22, 168, 'English', 370),
	('Cruel Summer', 22, 178, 'English', 370),
	('Lover', 22, 221, 'English', 370),
	('The Man', 22, 190, 'English', 370),
	('The Archer', 22, 212, 'English', 370),
	('I Think He Knows', 22, 170, 'English', 370),
	('Miss Americana & The Heartbreak Prince', 22, 229, 'English', 370),
	('Paper Rings', 22, 191, 'English', 370),
	('Cornelia Street', 22, 244, 'English', 370),
	('Death By A Thousand Cuts', 22, 198, 'English', 370),
	("London Boy", 22, 185, 'English', 370),
	('Soon You\'ll Get Better', 22, 231, 'English', 370),
	('False God', 22, 210, 'English', 370),
	('You Need To Calm Down', 22, 171, 'English', 370),
	('Afterglow', 22, 223, 'English', 370),
	('Me!', 22, 186, 'English', 370),
	('It\'s Nice To Have A Friend', 22, 135, 'English', 370),
	('Daylight', 22, 238, 'English', 370),
    
    
    ('the 1', 23, 229, 'English', 320),
	('cardigan', 23, 239, 'English', 320),
	('the last great american dynasty', 23, 235, 'English', 320),
	('exile (feat. Bon Iver)', 23, 285, 'English', 320),
	('my tears ricochet', 23, 255, 'English', 320),
	('mirrorball', 23, 202, 'English', 320),
	('seven', 23, 212, 'English', 320),
	('august', 23, 254, 'English', 320),
	('this is me trying', 23, 225, 'English', 320),
	('illicit affairs', 23, 227, 'English', 320),
	('invisible string', 23, 245, 'English', 320),
	('mad woman', 23, 224, 'English', 320),
	('epiphany', 23, 270, 'English', 320),
	('betty', 23, 302, 'English', 320),
	('peace', 23, 249, 'English', 320),
    
    ('willow', 24, 213, 'English', 320),
    ('champagne problems', 24, 247, 'English', 320),
    ('gold rush', 24, 204, 'English', 320),
    ('tis the damn season', 24, 239, 'English', 320),
    ('tolerate it', 24, 242, 'English', 320),
    ('no body, no crime', 24, 218, 'English', 320),
    ('happiness', 24, 290, 'English', 320),
    ('dorothea', 24, 238, 'English', 320),
    ('coney island', 24, 290, 'English', 320),
    ('ivy', 24, 285, 'English', 320),
    ('cowboy like me', 24, 272, 'English', 320),
    ('long story short', 24, 211, 'English', 320),
    ('marjorie', 24, 289, 'English', 320),
    ('closure', 24, 226, 'English', 320),
    
    ('Baby', 25, 215, 'English', 320),
	('Somebody to Love', 25, 216, 'English', 320),
	('Stuck in the Moment', 25, 232, 'English', 320),
	('U Smile', 25, 227, 'English', 320),
	('Runaway Love', 25, 226, 'English', 320),
	('Never Let You Go', 25, 244, 'English', 320),
	('Overboard', 25, 235, 'English', 320),
	('Eenie Meenie', 25, 206, 'English', 320),
	('Up', 25, 196, 'English', 320),
	('That Should Be Me', 25, 222, 'English', 320),
    
    ('All Around the World', 26, 235, 'English', 320),
    ('Boyfriend', 26, 168, 'English', 320),
    ('As Long as You Love Me', 26, 229, 'English', 320),
    ('Catching Feelings', 26, 204, 'English', 320),
    ('Take You', 26, 217, 'English', 320),
    ('Right Here', 26, 248, 'English', 320),
    ('Fall', 26, 238, 'English', 320),
    ('Die in Your Arms', 26, 191, 'English', 320),
    ('Thought of You', 26, 202, 'English', 320),
    ('Beauty and a Beat', 26, 223, 'English', 320),
    ('One Love', 26, 198, 'English', 320),
    ('Be Alright', 26, 204, 'English', 320),
    ('Believe', 26, 238, 'English', 320),
    
    ('Mark My Words', 27, 177, 'English', 320),
	('I ll Show You', 27, 207, 'English', 320),
	('What Do You Mean?', 27, 208, 'English', 320),
	('Sorry', 27, 200, 'English', 320),
	('Love Yourself', 27, 233, 'English', 320),
	('Company', 27, 205, 'English', 320),
	('No Pressure (feat. Big Sean)', 27, 294, 'English', 320),
	('No Sense (feat. Travis Scott)', 27, 227, 'English', 320),
	('The Feeling (feat. Halsey)', 27, 244, 'English', 320),
	('Life Is Worth Living', 27, 234, 'English', 320),
	('Where Are Ü Now (with Skrillex & Diplo)', 27, 250, 'English', 320),
	('Children', 27, 226, 'English', 320),
	('Purpose', 27, 220, 'English', 320),
    
    ('All Around Me', 28, 181, 'English', 400),
	('Habitual', 28, 174, 'English', 400),
	('Come Around Me', 28, 189, 'English', 400),
	('Intentions (feat. Quavo)', 28, 202, 'English', 400),
	('Yummy', 28, 210, 'English', 400),
	('Available', 28, 199, 'English', 400),
	('Forever (feat. Post Malone & Clever)', 28, 268, 'English', 400),
	('Running Over (feat. Lil Dicky)', 28, 181, 'English', 400),
	('Take It Out On Me', 28, 203, 'English', 400),
	('Second Emotion (feat. Travis Scott)', 28, 208, 'English', 400),
	('Get Me (feat. Kehlani)', 28, 211, 'English', 400),
	('ETA', 28, 156, 'English', 400),
	('Changes', 28, 128, 'English', 400),
	('Confirmation', 28, 165, 'English', 400),
	('That’s What Love Is', 28, 198, 'English', 400),
	('At Least For Now', 28, 177, 'English', 400),
    
    
    ('Don''t Panic', 29, 155, 'English', 300),
	('Shiver', 29, 259, 'English', 300),
	('Spies', 29, 326, 'English', 300),
	('Sparks', 29, 197, 'English', 300),
	('Yellow', 29, 268, 'English', 300),
	('Trouble', 29, 285, 'English', 300),
	('Parachutes', 29, 245, 'English', 300),
	('High Speed', 29, 281, 'English', 300),
	('We Never Change', 29, 255, 'English', 300),
	('Everything''s Not Lost', 29, 433, 'English', 300),
    
    ('Politik', 30, 322, 'English', 300),
	('In My Place', 30, 211, 'English', 300),
	('God Put a Smile upon Your Face', 30, 240, 'English', 300),
	('The Scientist', 30, 309, 'English', 300),
	('Clocks', 30, 307, 'English', 300),
	('Daylight', 30, 303, 'English', 300),
	('Green Eyes', 30, 233, 'English', 300),
	('Warning Sign', 30, 314, 'English', 300),
	('A Whisper', 30, 240, 'English', 300),
	('A Rush of Blood to the Head', 30, 355, 'English', 300),
	('Amsterdam', 30, 301, 'English', 300),
    
    ('Square One', 31, 263, 'English', 320),
	('What If', 31, 248, 'English', 320),
	('White Shadows', 31, 331, 'English', 320),
	('Fix You', 31, 294, 'English', 320),
	('Talk', 31, 303, 'English', 320),
	('X&Y', 31, 268, 'English', 320),
	('Speed of Sound', 31, 284, 'English', 320),
	('A Message', 31, 287, 'English', 320),
	('Low', 31, 385, 'English', 320),
	('The Hardest Part', 31, 268, 'English', 320),
	('Swallowed in the Sea', 31, 233, 'English', 320),
	('Twisted Logic', 31, 269, 'English', 320),
    
    ('Life in Technicolor', 32, 172, 'English', 320),
	('Cemeteries of London', 32, 191, 'English', 320),
	('Lost!', 32, 236, 'English', 320),
	('42', 32, 239, 'English', 320),
	('Lovers in Japan / Reign of Love', 32, 362, 'English', 320),
	('Yes', 32, 423, 'English', 320),
	('Viva la Vida', 32, 242, 'English', 320),
	('Violet Hill', 32, 224, 'English', 320),
	('Strawberry Swing', 32, 242, 'English', 320),
	('Death and All His Friends', 32, 392, 'English', 320),
    
    ('Mylo Xyloto', 33, 245, 'English', 320),
	('Hurts Like Heaven', 33, 253, 'English', 320),
	('Paradise', 33, 278, 'English', 320),
	('Charlie Brown', 33, 246, 'English', 320),
	('Us Against the World', 33, 238, 'English', 320),
	('M.M.I.X.', 33, 36, 'Instrumental', 320),
	('Every Teardrop Is a Waterfall', 33, 242, 'English', 320),
	('Major Minus', 33, 199, 'English', 320),
	('U.F.O.', 33, 157, 'English', 320),
	('Princess of China', 33, 232, 'English', 320),
	('Up with the Birds', 33, 248, 'English', 320),
    
    
    ('Fireworks', 34, 243, 'English', 320),
	('Karaoke', 34, 230, 'English', 320),
	('The Resistance', 34, 249, 'English', 320),
	('Over', 34, 233, 'English', 320),
	('Show Me a Good Time', 34, 217, 'English', 320),
	('Up All Night', 34, 225, 'English', 320),
	('Fancy', 34, 300, 'English', 320),
	('Shut It Down', 34, 360, 'English', 320),
	('Unforgettable', 34, 222, 'English', 320),
	('Light Up', 34, 267, 'English', 320),
	('Miss Me', 34, 288, 'English', 320),
	('Cece\'s Interlude', 34, 118, 'English', 320),
	('Find Your Love', 34, 214, 'English', 320),
	('Thank Me Now', 34, 295, 'English', 320),
    
    ('Over My Dead Body', 35, 231, 'English', 320),
	('Shot for Me', 35, 237, 'English', 320),
	('Headlines', 35, 231, 'English', 320),
	('Crew Love', 35, 237, 'English', 320),
	('Take Care', 35, 262, 'English', 320),
	('Marvins Room', 35, 274, 'English', 320),
	('Under Ground Kings', 35, 210, 'English', 320),
	('We’ll Be Fine', 35, 238, 'English', 320),
	('Make Me Proud', 35, 219, 'English', 320),
	('Lord Knows', 35, 315, 'English', 320),
	('Cameras', 35, 249, 'English', 320),
	('Doing It Wrong', 35, 251, 'English', 320),
	('The Real Her', 35, 318, 'English', 320),
	('Look What You’ve Done', 35, 267, 'English', 320),
	('HYFR (Hell Ya Fucking Right)', 35, 221, 'English', 320),
	('Practice', 35, 237, 'English', 320),
	('The Ride', 35, 326, 'English', 320),
    
    ('Tuscan Leather', 36, 361, 'English', 320),
	('Furthest Thing', 36, 274, 'English', 320),
	('Started from the Bottom', 36, 245, 'English', 320),
	('Wu-Tang Forever', 36, 307, 'English', 320),
	('Own It', 36, 252, 'English', 320),
	('Worst Behavior', 36, 272, 'English', 320),
	('From Time', 36, 398, 'English', 320),
	('Hold On, We\'re Going Home', 36, 228, 'English', 320),
	('Connect', 36, 250, 'English', 320),
	('The Language', 36, 213, 'English', 320),
	('305 to My City', 36, 250, 'English', 320),
	('Too Much', 36, 266, 'English', 320),
	('Pound Cake / Paris Morton Music 2', 36, 464, 'English', 320),
    
    ('Keep the Family Close', 37, 301, 'English', 320),
	('9', 37, 232, 'English', 320),
	('U With Me?', 37, 277, 'English', 320),
	('Feel No Ways', 37, 239, 'English', 320),
	('Hype', 37, 190, 'English', 320),
	('Weston Road Flows', 37, 305, 'English', 320),
	('Redemption', 37, 314, 'English', 320),
	('With You', 37, 233, 'English', 320),
	('Faithful', 37, 258, 'English', 320),
	('Still Here', 37, 191, 'English', 320),
	('Controlla', 37, 245, 'English', 320),
	('One Dance', 37, 173, 'English', 320),
	('Grammys', 37, 223, 'English', 320),
	('Childs Play', 37, 242, 'English', 320),
	('Pop Style', 37, 210, 'English', 320),
	('Too Good', 37, 263, 'English', 320),
	('Summers Over Interlude', 37, 87, 'English', 320),
	('Fire & Desire', 37, 240, 'English', 320),
	('Views', 37, 266, 'English', 320),
    
    ('Survival', 38, 289, 'English', 370),
	('Nonstop', 38, 227, 'English', 370),
	('Elevate', 38, 193, 'English', 370),
	('Emotionless', 38, 315, 'English', 370),
	('God\'s Plan', 38, 198, 'English', 370),
	('I\'m Upset', 38, 204, 'English', 370),
	('8 Out Of 10', 38, 193, 'English', 370),
	('Mob Ties', 38, 206, 'English', 370),
	('Can\'t Take A Joke', 38, 172, 'English', 370),
	('Sandra\'s Rose', 38, 310, 'English', 370),
	('Talk Up', 38, 225, 'English', 370),
	('Is There More', 38, 311, 'English', 370),
	('Peak', 38, 228, 'English', 370),
	('Summer Games', 38, 252, 'English', 370),
	('Jaded', 38, 270, 'English', 370),
	('Nice For What', 38, 210, 'English', 370),
	('Finesse', 38, 165, 'English', 370),
	('Ratchet Happy Birthday', 38, 149, 'English', 370),
	('That\'s How You Feel', 38, 210, 'English', 370),
	('Blue Tint', 38, 151, 'English', 370),
	('In My Feelings', 38, 217, 'English', 370),
	('Don\'t Matter To Me', 38, 263, 'English', 370),
	('After Dark', 38, 249, 'English', 370),
	('Final Fantasy', 38, 190, 'English', 370),
	('March 14', 38, 305, 'English', 370),
    
    ('Fuck Your Ethnicity', 39, 243, 'English', 320),
	('Hol Up', 39, 170, 'English', 320),
	('A.D.H.D', 39, 222, 'English', 320),
	('No Make-Up (Her Vice)', 39, 237, 'English', 320),
	('Tammys Song (Her Evils)', 39, 239, 'English', 320),
	('Chapter Six', 39, 238, 'English', 320),
	('Ronald Reagan Era (His Evils)', 39, 187, 'English', 320),
	('Poe Mans Dreams (His Vice)', 39, 276, 'English', 320),
	('The Spiteful Chant', 39, 236, 'English', 320),
	('Chapter Ten', 39, 207, 'English', 320),
	('Keishas Song (Her Pain)', 39, 300, 'English', 320),
	('Rigamortis', 39, 153, 'English', 320),
	('Kush & Corinthians (His Pain)', 39, 268, 'English', 320),
	('Blow My High (Members Only)', 39, 213, 'English', 320),
	('Ab-Souls Outro', 39, 181, 'English', 320),
	    
    
    ('Sherane a.k.a Master Splinter’s Daughter', 40, 272, 'English', 320),
	('Bitch, Don’t Kill My Vibe', 40, 314, 'English', 320),
	('Backseat Freestyle', 40, 201, 'English', 320),
	('The Art of Peer Pressure', 40, 345, 'English', 320),
	('Money Trees (feat. Jay Rock)', 40, 391, 'English', 320),
	('Poetic Justice (feat. Drake)', 40, 304, 'English', 320),
	('good kid', 40, 232, 'English', 320),
	('m.A.A.d city (feat. MC Eiht)', 40, 354, 'English', 320),
	('Swimming Pools (Drank) [Extended Version]', 40, 340, 'English', 320),
	('Sing About Me, I’m Dying of Thirst', 40, 810, 'English', 320),
	('Real (feat. Anna Wise)', 40, 451, 'English', 320),
	('Compton (feat. Dr. Dre)', 40, 293, 'English', 320),
    
    ('Wesley’s Theory (feat. George Clinton & Thundercat)', 41, 295, 'English', 320),
	('For Free? (Interlude)', 41, 52, 'English', 320),
	('King Kunta', 41, 234, 'English', 320),
	('Institutionalized (feat. Bilal, Anna Wise & Snoop Dogg)', 41, 462, 'English', 320),
	('These Walls (feat. Bilal, Anna Wise & Thundercat)', 41, 394, 'English', 320),
	('U', 41, 278, 'English', 320),
	('Alright', 41, 295, 'English', 320),
	('For Sale? (Interlude)', 41, 81, 'English', 320),
	('Momma', 41, 316, 'English', 320),
	('Hood Politics', 41, 276, 'English', 320),
	('How Much a Dollar Cost (feat. James Fauntleroy & Ronald Isley)', 41, 448, 'English', 320),
	('Complexion (A Zulu Love) [feat. Rapsody]', 41, 289, 'English', 320),
	('The Blacker the Berry', 41, 223, 'English', 320),
	('You Ain’t Gotta Lie (Momma Said)', 41, 254, 'English', 320),
	('i', 41, 227, 'English', 320),
	('Mortal Man', 41, 920, 'English', 320),
    
    ('!!!!!!!', 42, 14, 'English', 320),
	('bad guy', 42, 194, 'English', 320),
	('xanny', 42, 243, 'English', 320),
	('you should see me in a crown', 42, 201, 'English', 320),
	('all the good girls go to hell', 42, 167, 'English', 320),
	('wish you were gay', 42, 240, 'English', 320),
	('when the party’s over', 42, 196, 'English', 320),
	('8', 42, 199, 'English', 320),
	('my strange addiction', 42, 190, 'English', 320),
	('bury a friend', 42, 193, 'English', 320),
	('ilomilo', 42, 168, 'English', 320),
	('listen before i go', 42, 243, 'English', 320),
	('i love you', 42, 294, 'English', 320),
	('goodbye', 42, 62, 'English', 320),
    
    ('Getting Older', 43, 295, 'English', 270),
	('I Didn''t Change My Number', 43, 198, 'English', 270),
	('Billie Bossa Nova', 43, 193, 'English', 270),
	('my future', 43, 208, 'English', 270),
	('Oxytocin', 43, 223, 'English', 270),
	('GOLDWING', 43, 225, 'English', 270),
	('Lost Cause', 43, 222, 'English', 270),
	('Halley''s Comet', 43, 192, 'English', 270),
	('Not My Responsibility', 43, 57, 'English', 270),
	('OverHeated', 43, 219, 'English', 270),
	('Everybody Dies', 43, 221, 'English', 270),
	('Your Power', 43, 242, 'English', 270),
	('NDA', 43, 174, 'English', 270),
	('Therefore I Am', 43, 174, 'English', 270),
	('Happier Than Ever', 43, 293, 'English', 270),
    	
    ('Daftendirekt', 44, 68, 'Instrumental', 270),
	('WDPK 83.7 FM', 44, 28, 'English', 270),
	('Revolution 909', 44, 326, 'English', 270),
	('Da Funk', 44, 327, 'Instrumental', 270),
	('Phoenix', 44, 238, 'Instrumental', 270),
	('Fresh', 44, 244, 'Instrumental', 270),
	('Around the World', 44, 431, 'English', 270),
	('Rollin\' & Scratchin\'', 44, 452, 'Instrumental', 270),
	('Teachers', 44, 163, 'English', 270),
	('High Fidelity', 44, 257, 'Instrumental', 270),
	('Rock\'n Roll', 44, 247, 'Instrumental', 270),
	('Oh Yeah', 44, 120, 'English', 270),
	('Burnin\'', 44, 397, 'Instrumental', 270),
	('Indo Silver Club', 44, 236, 'Instrumental', 270),
	('Alive', 44, 341, 'Instrumental', 270),
	('Funk Ad', 44, 52, 'Instrumental', 270),
    
	('One More Time', 45, 320, 'English', 270),
    ('Aerodynamic', 45, 217, 'English', 270),
    ('Digital Love', 45, 319, 'English', 270),
    ('Harder, Better, Faster, Stronger', 45, 223, 'English', 270),
    ('Crescendolls', 45, 207, 'English', 270),
    ('Nightvision', 45, 101, 'Instrumental', 270),
    ('Superheroes', 45, 231, 'English', 270),
    ('High Life', 45, 203, 'English', 270),
    ('Something About Us', 45, 228, 'English', 270),
    ('Voyager', 45, 224, 'English', 270),
    ('Veridis Quo', 45, 342, 'English', 270),
    ('Short Circuit', 45, 200, 'English', 270),
    ('Face to Face', 45, 240, 'English', 270),
    ('Too Long', 45, 600, 'English', 270),
    
    ('Human After All', 46, 322, 'English', 320),
	('The Prime Time of Your Life', 46, 238, 'English', 320),
	('Robot Rock', 46, 242, 'English', 320),
	('Steam Machine', 46, 287, 'Instrumental', 320),
	('Make Love', 46, 239, 'Instrumental', 320),
	('The Brainwasher', 46, 265, 'English', 320),
	('On/Off', 46, 71, 'Instrumental', 320),
	('Television Rules the Nation', 46, 238, 'Instrumental', 320),
	('Technologic', 46, 242, 'English', 320),
	('Emotion', 46, 254, 'Instrumental', 320),
    
	('Give Life Back to Music', 47, 269, 'English', 250),
	('The Game of Love', 47, 307, 'English', 250),
	('Giorgio by Moroder', 47, 588, 'English', 250),
	('Within', 47, 225, 'English', 250),
	('Instant Crush', 47, 320, 'English', 250),
	('Lose Yourself to Dance', 47, 352, 'English', 250),
	('Touch', 47, 493, 'English',250),
	('Get Lucky', 47, 369, 'English', 250),
	('Beyond', 47, 284, 'English', 250),
	('Motherboard', 47, 341, 'English', 250),
	('Fragments of Time', 47, 273, 'English', 250),
	('Doin It Right', 47, 247, 'English', 250),
	('Contact', 47, 368, 'English', 250),
 	
    ('Blue Suede Shoes', 48, 119, 'English', 250),
	('I\'m Counting on You', 48, 161, 'English', 250),
	('I Got a Woman', 48, 163, 'English', 250),
	('One-Sided Love Affair', 48, 134, 'English', 250),
	('I Love You Because', 48, 149, 'English', 250),
	('Just Because', 48, 125, 'English', 250),
	('Tutti Frutti', 48, 117, 'English', 250),
	('Trying to Get to You', 48, 142, 'English', 250),
	('I\'m Gonna Sit Right Down and Cry (Over You)', 48, 126, 'English', 250),
	('I\'ll Never Let You Go (Little Darlin\')', 48, 141, 'English', 250),
	('Blue Moon', 48, 123, 'English', 250),
	('Money Honey', 48, 149, 'English', 250),
    
	('Make Me Know It', 49, 134, 'English', 250),
	('Fever', 49, 181, 'English', 250),
	('The Girl of My Best Friend', 49, 139, 'English', 250),
	('I Will Be Home Again', 49, 163, 'English', 250),
	('Dirty, Dirty Feeling', 49, 102, 'English', 250),
	('Thrill of Your Love', 49, 178, 'English', 250),
	('Soldier Boy', 49, 146, 'English', 250),
	('Such a Night', 49, 168, 'English', 250),
	('It Feels So Right', 49, 127, 'English', 250),
	('Girl Next Door Went A Walking', 49, 142, 'English', 250),
	('Like A Baby', 49, 150, 'English', 250),
	('Reconsider Baby', 49, 207, 'English', 250),
    
    ('Wearin That Loved On Look', 50, 173, 'English', 250),
	('Only the Strong Survive', 50, 130, 'English', 250),
	('I ll Hold You in My Heart (Till I Can Hold You in My Arms)', 50, 170, 'English', 250),
	('Long Black Limousine', 50, 210, 'English', 250),
	('It Keeps Right On A-Hurtin', 50, 149, 'English', 250),
	('I m Movin  On', 50, 147, 'English', 250),
	('Power of My Love', 50, 148, 'English', 250),
	('Gentle on My Mind', 50, 221, 'English', 250),
	('After Loving You', 50, 156, 'English', 250),
	('True Love Travels on a Gravel Road', 50, 182, 'English', 250),
	('Any Day Now', 50, 177, 'English', 250),
	('In the Ghetto', 50, 150, 'English', 250),
    
	('Snowbird', 51, 170, 'English', 320),
	('Tomorrow Never Comes', 51, 168, 'English', 320),
	('Little Cabin On The Hill', 51, 153, 'English', 320),
	('Whole Lotta Shakin Goin On', 51, 226, 'English', 320),
	('Funny How Time Slips Away', 51, 256, 'English', 320),
	('I Really Don T Want To Know', 51, 166, 'English', 320),
	('There Goes My Everything', 51, 177, 'English', 320),
	('It S Your Baby, You Rock It', 51, 127, 'English', 320),
	('The Fool', 51, 179, 'English', 320),
	('Faded Love', 51, 214, 'English', 320),
	('I Washed My Hands In Muddy Water', 51, 200, 'English', 320),
	('Make The World Go Away', 51, 166, 'English', 320),
    
    ('In the Wee Small Hours of the Morning', 52, 187, 'English', 320),
	('Mood Indigo', 52, 239, 'English', 320),
	('Glad to Be Unhappy', 52, 142, 'English', 320),
	('I Get Along Without You Very Well', 52, 232, 'English', 320),
	('Deep in a Dream', 52, 170, 'English', 320),
	('I See Your Face Before Me', 52, 167, 'English', 320),
	('Can t We Be Friends?', 52, 119, 'English', 320),
	('When Your Lover Has Gone', 52, 173, 'English', 320),
	('What Is This Thing Called Love?', 52, 110, 'English', 320),
	('Last Night When We Were Young', 52, 194, 'English', 320),
	('Ill Be Around', 52, 155, 'English', 320),
	('Ill Wind', 52, 237, 'English', 320),
	('It Never Entered My Mind', 52, 181, 'English', 320),
	('Dancing on the Ceiling', 52, 154, 'English', 320),
	('Ill Never Be the Same', 52, 217, 'English', 320),
	('This Love of Mine', 52, 204, 'English', 320),
    
    ('Come Fly with Me', 53, 189, 'English', 320),
	('Around the World', 53, 179, 'English', 320),
	('Isle of Capri', 53, 149, 'English', 320),
	('Moonlight in Vermont', 53, 210, 'English', 320),
	('Autumn in New York', 53, 287, 'English', 320),
	('On the Road to Mandalay', 53, 178, 'English', 320),
	('Let''s Get Away from It All', 53, 194, 'English', 320),
	('April in Paris', 53, 190, 'English', 320),
	('London by Night', 53, 202, 'English', 320),
	('Brazil', 53, 149, 'English', 320),
	('Blue Hawaii', 53, 155, 'English', 320),
	('It s Nice to Go Trav''ling', 53, 202, 'English', 320),
    
    ('Strangers in the Night', 54, 172, 'English', 320),
	('Summer Wind', 54, 165, 'English', 320),
	('All or Nothing at All', 54, 232, 'English', 320),
	('Call Me', 54, 238, 'English', 320),
	('You re Driving Me Crazy!', 54, 128, 'English', 320),
	('On a Clear Day (You Can See Forever)', 54, 150, 'English', 320),
	('My Baby Just Cares for Me', 54, 183, 'English', 320),
	('Downtown', 54, 183, 'English', 320),
	('Yes Sir, That''s My Baby', 54, 147, 'English', 320),
	('The Most Beautiful Girl in the World', 54, 217, 'English', 320),
	('A Man Alone', 54, 246, 'English', 320),
    
    ('The Lady Is A Tramp', 55, 196, 'English', 320),
	('What Now My Love', 55, 178, 'English', 320),
	('Ive Got A Crush On You', 55, 184, 'English', 320),
	('Summer Wind', 55, 173, 'English', 320),
	('Come Rain Or Come Shine', 55, 238, 'English', 320),
	('New York, New York', 55, 225, 'English', 320),
	('They Cant Take That Away From Me', 55, 227, 'English', 320),
	('You Make Me Feel So Young', 55, 194, 'English', 320),
	('Guess Ill Hang My Tears Out To Dry In The Wee Small Hours Of The Morning', 55, 321, 'English', 320),
	('Ive Got The World On A String', 55, 141, 'English', 320),
	('Witchcraft', 55, 157, 'English', 320),
	('I ve Got You Under My Skin', 55, 185, 'English', 320),
	('All The Way  One For My Baby (And One More For The Road)', 55, 333, 'English', 320),
    
	('Brandenburg Concerto No. 1 in F major - I. Allegro', 56, 250, 'Instrumental', 320),
	('Brandenburg Concerto No. 1 in F major - II. Adagio', 56, 259, 'Instrumental', 320),
	('Brandenburg Concerto No. 1 in F major - III. Allegro', 56, 322, 'Instrumental', 320),
	('Brandenburg Concerto No. 2 in F major - I. Allegro', 56, 318, 'Instrumental', 320),
	('Brandenburg Concerto No. 2 in F major - II. Andante', 56, 238, 'Instrumental', 320),
	('Brandenburg Concerto No. 2 in F major - III. Allegro assai', 56, 208, 'Instrumental', 320),
	('Brandenburg Concerto No. 3 in G major - I. Allegro', 56, 313, 'Instrumental', 320),
	('Brandenburg Concerto No. 3 in G major - II. Adagio', 56, 328, 'Instrumental', 320),
	('Brandenburg Concerto No. 3 in G major - III. Allegro', 56, 298, 'Instrumental', 320),
	('Brandenburg Concerto No. 4 in G major - I. Allegro', 56, 283, 'Instrumental', 320),
	('Brandenburg Concerto No. 4 in G major - II. Andante', 56, 226, 'Instrumental', 320),
	('Brandenburg Concerto No. 4 in G major - III. Presto', 56, 254, 'Instrumental', 320),
	('Brandenburg Concerto No. 5 in D major - I. Allegro', 56, 356, 'Instrumental', 320),
	('Brandenburg Concerto No. 5 in D major - II. Affettuoso', 56, 386, 'Instrumental', 320),
	('Brandenburg Concerto No. 5 in D major - III. Allegro', 56, 242, 	'Instrumental', 320),
	('Brandenburg Concerto No. 5 in D major - IV. Allegro', 56, 297, 'Instrumental', 320),
	('Brandenburg Concerto No. 6 in B-flat major - I. Allegro', 56, 431, 'Instrumental', 320),
	('Brandenburg Concerto No. 6 in B-flat major - II. Adagio', 56, 234, 'Instrumental', 320),
    
    ('Kommt, ihr Töchter, helft mir klagen', 57, 601, 'German', 320),
	('Da Jesus an dem Kreuze stund', 57, 391, 'German', 320),
	('Buß und Reu', 57, 144, 'German', 320),
	('Blute nur, du liebes Herz', 57, 149, 'German', 320),
	('Wie wunderbarlich ist doch diese Strafe!', 57, 203, 'German', 320),
	('Er hat uns allen wohl getan', 57, 221, 'German', 320),
	('Aus Liebe will mein Heiland sterben', 58, 352, 'German', 320),
	('Erbarme dich, mein Gott', 57, 380, 'German', 320),
	('Können Tränen meiner Wangen', 57, 309, 'German', 320),
	('Ich will bei meinem Jesu wachen', 57, 344, 'German', 320),
	('Geduld! Wenn mich falsche Zungen stechen', 58, 150, 'German', 320),
	('Mache dich, mein Herze, rein', 57, 299, 'German', 320),
    
    ('Keep Yourself Alive', 58, 180, 'English', 320),
	('Doing All Right', 58, 201, 'English', 320),
	('Great King Rat', 58, 354, 'English', 320),
	('My Fairy King', 58, 251, 'English', 320),
	('Liar', 58, 369, 'English', 320),
	('The Night Comes Down', 58, 256, 'English', 320),
	('Modern Times Rock n Roll', 58, 106, 'English', 320),
	('Son and Daughter', 58, 229, 'English', 320),
	('Jesus', 58, 216, 'English', 320),
	('Seven Seas of Rhye', 58, 174, 'English', 320),

	('Death on Two Legs', 59, 210, 'English', 320),
	('Lazing on a Sunday Afternoon', 59, 66, 'English', 320),
	('Im in Love with My Car', 59, 219, 'English', 320),
	('Youre My Best Friend', 59, 170, 'English', 320),
	('39', 59, 224, 'English', 320),
	('Sweet Lady', 59, 242, 'English', 320),
	('Seaside Rendezvous', 59, 120, 'English', 320),
	('The Prophets Song', 59, 543, 'English', 320),
	('Love of My Life', 59, 207, 'English', 320),
	('Good Company', 59, 226, 'English', 320),
	('Bohemian Rhapsody', 59, 355, 'English', 320),
	('God Save the Queen', 59, 62, 'Instrumental', 320),
    
    ('Play the Game', 60, 215, 'English', 320),
	('Dragon Attack', 60, 238, 'English', 320),
	('Another One Bites the Dust', 60, 219, 'English', 320),
	('Need Your Loving Tonight', 60, 182, 'English', 320),
	('Crazy Little Thing Called Love', 60, 163, 'English', 320),
	('Rock It (Prime Jive)', 60, 244, 'English', 320),
	('Dont Try Suicide', 60, 187, 'English', 320),
	('Sail Away Sweet Sister', 60, 200, 'English', 320),
	('Coming Soon', 60, 121, 'English', 320),
	('Save Me', 60, 233, 'English', 320),
    
    ('What a Wonderful World', 61, 142, 'English', 320),
	('Cabaret', 61, 173, 'English', 320),
	('The Home Fire', 61, 189, 'English', 320),
	('Dream a Little Dream of Me', 61, 303, 'English', 320),
	('Give Me Your Kisses', 61, 137, 'English', 320),
	('The Sunshine of Love', 61, 163, 'English', 320),
	('Hello Brother', 61, 158, 'English', 320),
	('There Must Be a Way', 61, 182, 'English', 320),
	('Fantastic, Thats You', 61, 178, 'English', 320),
	('I Guess Ill Take the Papers and Go Home', 61, 178, 'English', 320),
    
    ('Give Peace a Chance', 62, 309, 'English', 320),
	('What a Wonderful World', 62, 142, 'English', 320),
	('Cabaret', 62, 173, 'English', 320),
	('The Home Fire', 62, 189, 'English', 320),
	('Dream a Little Dream of Me', 62, 303, 'English', 320),
	('Give Me Your Kisses', 62, 137, 'English', 320),
	('The Sunshine of Love', 62, 163, 'English', 320),	
	('Hello Brother', 62, 158, 'English', 320),
	('There Must Be a Way', 62, 182, 'English', 320),
	('Fantastic, Thats You', 62, 178, 'English', 320),
	('I Guess Ill Take the Papers and Go Home', 62, 178, 'English', 320),
	('Hellzapoppin', 62, 186, 'English', 320),
	('Life is Just a Bowl of Cherries', 62, 150, 'English', 320),
	('Dont Worry About Me', 62, 212, 'English', 320),
	('Ding-Dong! The Witch Is Dead', 62, 136, 'English', 320),
	('Blueberry Hill', 62, 166, 'English', 320),
	('Nobody Knows the Trouble Ive Seen', 62, 200, 'English', 320),
	('We Shall Overcome', 62, 283, 'English', 320);
    


# TEMPLATE FOR Listening_table - Niko Brodey USER
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 102, '2022-03-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2022-10-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 98, '2022-07-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 74, '2023-02-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 93, '2022-09-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 65, '2022-07-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 56, '2022-04-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 45, '2022-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 80, '2022-01-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-01-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 100, '2022-11-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 102, '2022-05-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 92, '2022-11-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-04-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 52, '2022-05-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 68, '2022-01-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 56, '2023-02-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-08-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2022-02-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-11-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2022-10-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 92, '2022-12-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 52, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2022-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-05-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 94, '2022-09-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2022-12-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-07-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2022-02-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 89, '2022-04-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 96, '2022-11-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 73, '2022-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 65, '2022-02-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-10-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 47, '2022-06-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 99, '2022-09-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 104, '2022-05-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 90, '2022-08-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2022-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 58, '2022-02-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 47, '2022-04-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 56, '2023-01-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 51, '2022-06-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2022-07-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 106, '2022-07-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2022-11-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-10-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 75, '2022-01-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 91, '2022-02-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-08-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 104, '2023-01-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 93, '2022-09-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2022-05-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 41, '2022-04-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 96, '2022-12-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 63, '2023-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-08-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 68, '2022-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 77, '2022-12-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-06-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 46, '2022-08-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-10-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 77, '2022-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-05-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2022-08-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 99, '2022-10-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 68, '2022-10-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2023-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 105, '2022-11-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 46, '2022-08-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 74, '2022-08-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 42, '2022-08-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 75, '2022-06-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 74, '2022-08-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2023-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 97, '2022-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 105, '2023-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2022-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-07-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 71, '2022-09-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 53, '2022-09-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-03-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 52, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-07-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 106, '2023-02-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-01-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-09-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 84, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 41, '2022-09-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 98, '2022-08-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 49, '2022-08-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-06-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-05-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-10-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 97, '2022-12-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 93, '2022-05-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 71, '2023-02-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 91, '2022-11-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 85, '2022-08-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 86, '2022-06-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2022-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 68, '2022-04-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-02-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2022-09-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 84, '2022-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-02-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 90, '2022-09-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-06-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 70, '2022-05-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 104, '2023-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2022-02-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 87, '2022-06-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-07-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 65, '2022-12-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 49, '2022-08-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 85, '2022-09-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 85, '2022-06-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-11-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-10-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-07-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 75, '2022-10-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 85, '2022-08-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-05-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-07-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 101, '2022-02-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 47, '2022-03-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 41, '2022-07-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-11-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-06-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 79, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 95, '2023-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 55, '2022-11-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2022-02-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2022-07-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 70, '2022-05-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 51, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2023-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 57, '2022-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 79, '2022-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 91, '2022-04-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 42, '2022-02-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 75, '2022-08-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-01-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-11-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 52, '2022-11-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 73, '2022-11-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 56, '2023-02-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 42, '2022-07-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2022-05-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 107, '2022-08-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2023-02-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 85, '2022-12-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 89, '2022-09-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 78, '2022-06-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 64, '2022-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 46, '2022-11-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 41, '2022-12-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 83, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 78, '2022-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 93, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2022-07-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 47, '2022-01-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 78, '2022-09-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 103, '2022-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 95, '2022-10-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 95, '2022-11-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 99, '2022-10-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 91, '2022-10-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 71, '2022-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2022-09-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 92, '2022-10-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 90, '2022-06-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 107, '2022-06-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 73, '2022-05-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 107, '2022-10-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-11-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 96, '2022-12-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 54, '2022-06-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 75, '2022-04-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2023-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-05-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 66, '2022-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2023-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2023-02-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 94, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 65, '2022-06-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 74, '2022-06-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 98, '2022-04-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 70, '2022-07-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 43, '2022-05-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 48, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 94, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 100, '2022-10-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-04-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 104, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 101, '2023-01-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 65, '2022-02-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 63, '2022-09-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-07-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 58, '2022-12-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 68, '2022-08-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 62, '2022-08-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 55, '2023-02-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-10-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-12-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-06-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 89, '2022-08-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 58, '2022-07-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 47, '2022-04-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 98, '2022-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 105, '2022-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 94, '2023-01-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 56, '2023-01-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-03-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 106, '2023-01-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2022-12-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 100, '2022-05-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-10-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 49, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 53, '2022-11-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2022-04-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 105, '2022-01-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 86, '2022-11-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 96, '2022-01-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 61, '2023-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 95, '2022-08-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 49, '2023-02-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 102, '2022-07-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 60, '2022-04-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 67, '2022-04-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2022-05-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 326, '2022-12-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 330, '2022-07-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2023-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2022-09-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 322, '2022-07-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 346, '2023-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-03-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 312, '2022-08-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-10-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 343, '2022-02-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 305, '2022-07-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 328, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2023-02-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 328, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-08-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-12-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 355, '2022-12-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 347, '2022-10-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-05-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-05-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2022-08-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2022-04-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2022-07-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 338, '2023-02-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 306, '2022-05-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-08-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 309, '2022-03-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 363, '2022-06-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-05-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 333, '2022-02-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2023-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-10-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 355, '2022-07-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2022-10-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-09-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 336, '2023-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-08-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 307, '2022-09-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 316, '2022-05-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 335, '2022-04-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-07-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 339, '2022-07-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-08-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 340, '2022-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 311, '2022-12-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2023-02-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2022-06-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 317, '2022-07-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 310, '2023-02-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-02-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-10-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 352, '2022-10-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2023-01-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 363, '2022-08-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 347, '2022-12-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 318, '2022-11-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-06-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-10-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-08-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 319, '2022-05-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-12-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2022-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 321, '2022-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 324, '2022-04-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 366, '2022-05-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 349, '2022-05-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 372, '2022-10-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-07-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2023-01-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 308, '2023-02-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-12-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 335, '2022-01-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 343, '2022-05-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 339, '2023-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 319, '2022-11-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-09-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-01-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-11-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2022-11-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-09-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 318, '2022-08-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 349, '2022-01-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 330, '2022-02-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 342, '2022-08-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2023-01-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-11-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 305, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 318, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 344, '2022-01-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 366, '2022-05-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 342, '2022-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 370, '2023-01-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-09-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 316, '2022-06-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 337, '2022-06-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 311, '2022-09-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-08-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 308, '2023-01-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-11-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 328, '2022-05-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-04-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-02-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 329, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2023-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 316, '2022-04-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 321, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 333, '2022-07-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 340, '2022-05-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-09-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 354, '2022-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 366, '2022-01-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2023-01-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2022-10-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-05-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2022-01-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-10-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2023-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 373, '2022-11-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-07-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2022-08-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-06-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 306, '2022-01-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 308, '2022-09-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 317, '2022-07-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 343, '2022-12-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 328, '2022-11-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 364, '2022-12-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 370, '2022-04-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2022-12-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-08-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 320, '2022-06-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 352, '2022-11-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 346, '2022-03-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 309, '2022-08-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 308, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2022-04-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-02-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2023-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 349, '2023-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 343, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2022-09-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2022-06-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 322, '2022-11-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 321, '2022-04-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-06-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-12-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-06-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2023-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 336, '2022-08-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 352, '2022-07-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 343, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-10-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-10-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 347, '2022-05-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 355, '2022-06-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-04-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 342, '2023-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 312, '2022-09-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-11-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 319, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2022-02-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2023-01-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 320, '2022-01-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2022-11-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 349, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2022-10-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2022-06-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 323, '2022-06-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-11-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 315, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-09-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 338, '2022-07-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 339, '2022-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 326, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-07-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 307, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-05-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 352, '2022-11-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 339, '2022-12-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-11-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 305, '2022-11-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-03-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 307, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 314, '2022-12-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 324, '2022-04-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-06-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 323, '2022-01-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 337, '2022-10-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 340, '2022-12-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2023-02-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 320, '2023-01-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 319, '2022-08-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-10-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2023-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-08-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-10-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-03-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 317, '2022-02-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 339, '2022-10-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-11-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 345, '2022-10-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-11-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-06-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 305, '2022-01-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-01-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2022-12-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 330, '2022-02-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 327, '2022-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-07-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 308, '2022-05-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 336, '2022-06-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-10-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 373, '2022-04-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 304, '2022-10-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-04-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 338, '2022-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2023-02-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 351, '2022-05-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 342, '2022-02-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-09-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-09-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 353, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-09-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-05-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 323, '2022-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 319, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 332, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 332, '2023-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 324, '2022-10-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 169, '2022-06-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 422, '2022-08-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 161, '2022-12-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 283, '2022-12-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 306, '2022-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 438, '2022-07-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 296, '2022-09-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 455, '2022-08-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 11, '2022-11-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 147, '2022-10-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 200, '2022-02-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 412, '2022-03-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 172, '2023-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 188, '2022-02-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 363, '2022-11-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 537, '2022-08-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 411, '2022-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-03-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2022-09-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 176, '2022-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 154, '2022-07-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 39, '2023-01-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 23, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 497, '2022-03-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 92, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 335, '2022-09-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 246, '2022-10-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2023-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 41, '2022-12-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 424, '2022-01-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 262, '2022-10-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 170, '2022-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2022-11-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 108, '2022-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 496, '2022-04-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 196, '2023-01-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-05-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 383, '2022-11-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 245, '2022-09-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 509, '2022-06-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 497, '2022-12-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 526, '2022-11-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-03-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 224, '2022-12-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-07-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 189, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 123, '2022-09-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 423, '2022-06-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 436, '2022-08-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 454, '2022-06-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 59, '2022-08-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 349, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 32, '2022-09-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 454, '2022-07-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 5, '2022-07-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 283, '2022-12-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 313, '2022-07-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 336, '2022-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-09-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 13, '2022-08-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2023-02-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 295, '2023-01-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 459, '2023-02-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 341, '2022-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 399, '2023-02-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 257, '2022-04-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 180, '2022-07-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 76, '2022-08-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 288, '2022-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 94, '2023-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2023-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 309, '2022-11-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2022-01-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 413, '2022-12-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 72, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 118, '2022-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 353, '2022-04-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 23, '2022-08-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 184, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 20, '2022-04-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2022-06-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-01-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 245, '2022-11-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 325, '2023-02-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 123, '2022-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-09-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 197, '2023-01-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 122, '2022-11-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 83, '2023-02-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 530, '2023-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 88, '2022-04-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 227, '2022-01-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 99, '2022-05-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 91, '2022-07-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 51, '2022-04-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 417, '2022-05-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 172, '2022-12-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 24, '2022-04-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 533, '2022-08-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 285, '2022-10-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 69, '2022-04-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 433, '2023-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 33, '2022-07-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 24, '2022-09-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 50, '2022-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 184, '2022-08-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 467, '2022-05-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 205, '2022-09-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 147, '2022-05-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 203, '2022-09-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 494, '2022-07-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 470, '2022-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 268, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 152, '2023-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-06-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 488, '2022-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 468, '2023-01-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 53, '2022-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 238, '2022-04-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 268, '2022-01-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 147, '2022-03-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-03-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 414, '2022-10-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 159, '2022-05-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 184, '2022-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 113, '2022-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 36, '2022-08-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 194, '2023-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-10-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 107, '2022-10-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 95, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 484, '2022-02-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 80, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 309, '2022-10-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 517, '2022-06-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 80, '2022-12-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-09-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 471, '2022-08-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 260, '2022-05-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 539, '2022-06-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 55, '2022-04-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 294, '2022-09-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 77, '2022-10-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 55, '2022-11-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 11, '2022-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 301, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 439, '2022-05-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 17, '2022-11-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 372, '2022-01-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 355, '2022-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 189, '2022-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 470, '2022-09-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 482, '2022-01-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 121, '2022-12-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2022-03-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 482, '2022-05-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 1, '2022-04-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 110, '2022-05-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 18, '2022-07-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 405, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 255, '2022-09-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 492, '2022-08-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 162, '2022-10-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 14, '2022-05-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 434, '2022-05-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 258, '2022-04-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 58, '2022-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 466, '2022-07-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 536, '2022-07-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 104, '2022-03-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 116, '2022-09-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 183, '2022-05-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 275, '2022-12-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 181, '2022-05-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 19, '2022-07-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 460, '2023-01-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-01-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-04-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 86, '2022-05-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 35, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 127, '2022-05-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 51, '2022-11-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 179, '2022-07-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 495, '2022-06-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 252, '2022-06-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 522, '2022-05-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 411, '2022-12-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 290, '2023-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 329, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 420, '2022-06-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 422, '2022-03-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 33, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 257, '2022-09-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 194, '2022-12-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 33, '2023-02-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 1, '2022-06-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 255, '2022-09-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 399, '2022-12-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 92, '2022-10-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 239, '2022-04-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 334, '2022-04-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 239, '2022-04-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 193, '2023-02-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 202, '2022-07-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 21, '2022-06-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 244, '2022-12-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 473, '2023-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 466, '2022-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 167, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 348, '2022-05-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 262, '2022-11-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 433, '2022-10-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 172, '2022-06-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 100, '2022-02-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 529, '2022-08-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 180, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-04-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 238, '2022-05-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 263, '2022-09-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 8, '2022-02-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 81, '2022-12-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 401, '2022-01-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 7, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 192, '2022-11-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 124, '2022-12-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 168, '2022-12-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 500, '2022-05-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 264, '2022-09-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 312, '2023-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2022-10-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 183, '2022-06-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 205, '2022-05-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 394, '2022-10-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 280, '2022-04-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-05-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-08-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 350, '2022-07-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 258, '2022-09-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 415, '2022-11-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 199, '2022-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 206, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 155, '2022-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 472, '2022-11-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 230, '2022-05-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 186, '2023-01-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-06-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2023-02-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-07-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-11-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-05-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2022-08-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-09-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-07-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-07-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-06-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 372, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 390, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 399, '2022-04-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 394, '2023-01-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-02-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 372, '2022-02-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-09-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 386, '2022-02-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2023-01-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2022-05-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 364, '2022-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-11-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 393, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-10-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-04-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2023-02-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-11-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 366, '2022-07-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-08-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-09-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2022-10-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-05-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 401, '2022-07-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 408, '2022-08-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 395, '2022-09-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-10-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-06-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 391, '2022-04-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-06-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 405, '2022-08-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2022-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-09-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2023-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-05-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-08-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-08-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 388, '2022-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2022-01-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-08-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-03-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2023-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-08-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-11-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 398, '2022-08-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-12-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-04-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2022-04-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-06-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2022-11-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 405, '2023-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 364, '2022-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-01-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-06-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-08-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 392, '2022-11-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-10-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 383, '2022-02-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2022-11-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-02-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-07-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-08-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2022-11-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 392, '2022-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-08-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-08-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-10-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-07-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-04-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2023-02-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-04-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-03-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 388, '2022-11-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2023-01-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-11-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-02-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2023-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-05-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-04-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2022-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-01-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-06-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 388, '2022-10-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 398, '2023-02-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-06-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2022-10-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 363, '2022-01-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-02-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 405, '2022-10-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 382, '2022-10-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2023-01-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 398, '2022-06-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 408, '2022-04-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 373, '2022-08-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-10-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-01-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-10-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2022-09-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-10-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 382, '2022-08-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 401, '2022-11-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 390, '2022-06-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-09-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2023-02-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-09-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 408, '2022-05-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-09-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-05-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-01-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2022-05-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-12-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 383, '2022-08-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-07-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 379, '2022-12-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-09-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-05-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2022-07-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 361, '2022-10-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-07-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 396, '2022-06-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 386, '2023-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2022-07-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2023-01-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-01-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-02-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-08-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2022-04-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2022-01-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-06-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-11-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-01-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 394, '2022-04-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-02-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2022-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 384, '2022-04-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 392, '2022-05-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-09-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-05-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2022-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2023-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 396, '2022-08-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-08-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-01-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 386, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 399, '2022-02-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2023-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2022-08-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2023-02-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 363, '2022-01-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 371, '2022-11-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 393, '2022-09-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2022-11-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-12-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 409, '2022-08-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 385, '2023-01-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-04-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 396, '2022-04-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 401, '2022-07-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 391, '2022-02-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 375, '2022-04-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-04-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2022-06-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 377, '2022-01-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 386, '2022-01-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 358, '2022-12-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2023-01-26');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 392, '2022-11-27');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 378, '2022-08-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-01-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 405, '2022-04-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-06-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-07-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-09-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-12-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 394, '2022-09-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 376, '2022-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 364, '2022-11-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2023-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 381, '2022-05-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 390, '2022-05-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 400, '2022-02-23');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-04-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 388, '2022-09-30');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 359, '2022-08-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-01-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-02-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 368, '2022-11-29');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 404, '2022-01-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-04-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 395, '2022-02-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 366, '2023-01-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2023-02-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 365, '2022-10-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 407, '2022-06-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 374, '2022-10-31');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 402, '2022-11-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-12-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 362, '2022-02-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 393, '2023-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 398, '2022-11-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 389, '2022-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 393, '2022-09-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 360, '2022-11-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 406, '2022-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 403, '2022-07-28');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 397, '2022-05-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 408, '2022-09-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 357, '2022-05-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 372, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 387, '2023-02-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 388, '2022-12-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 356, '2023-01-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 369, '2022-07-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 395, '2022-04-25');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 396, '2023-02-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 367, '2022-09-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 380, '2022-11-24');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 383, '2022-04-24');

# TEMPLATE FOR Listening_table other USERS 
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 209, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 534, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 272, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 204, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 101, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 440, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 92, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 274, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 495, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 84, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 203, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 532, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 262, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 513, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 235, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 185, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 273, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 35, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 322, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 97, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 330, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 296, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 388, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 21, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 427, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (4, 167, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 58, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 390, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 131, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (16, 516, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 131, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 230, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 103, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 320, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 36, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 320, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 69, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 385, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 187, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 207, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (9, 463, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (4, 113, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (9, 132, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 172, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 430, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 115, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 410, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 278, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 116, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 409, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 102, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 505, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 389, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (16, 358, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 204, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 175, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 246, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 537, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 45, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 260, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 233, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 57, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 304, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (3, 320, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 341, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 15, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (4, 390, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 50, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 30, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 130, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 254, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 372, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 238, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 107, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (9, 444, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 120, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (7, 325, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 139, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (9, 156, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (5, 446, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (15, 72, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 523, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 268, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 430, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 345, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 270, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (9, 245, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 105, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 198, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 477, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 228, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 489, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (11, 112, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (4, 366, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 233, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 296, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (14, 329, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (6, 518, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (13, 103, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (8, 275, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 393, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 438, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 138, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 392, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 281, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 129, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 219, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 137, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 227, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 294, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 337, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 502, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 123, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 296, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 335, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 228, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 473, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 152, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 207, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 472, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 452, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 101, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 527, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 235, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 129, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 261, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 442, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 32, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 185, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 175, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 101, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 283, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 53, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 317, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 8, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 440, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 167, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 335, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 95, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 45, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 383, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 121, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 109, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 403, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 463, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 133, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 14, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 39, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (20, 134, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (19, 44, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 383, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 150, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 254, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 455, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 6, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 340, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 205, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 94, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 323, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 534, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 304, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 176, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 445, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 119, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 371, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 471, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 236, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 91, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 161, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 158, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 219, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 380, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 231, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 463, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 489, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 239, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 358, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 332, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 336, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 377, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 271, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 147, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (28, 73, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 96, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 516, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 221, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 14, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 519, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 386, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 9, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 19, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 407, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (27, 269, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 408, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 159, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 139, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 137, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 285, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (26, 259, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (25, 265, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 307, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 512, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 168, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 209, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 189, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 456, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 511, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 25, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 149, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 54, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 43, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 11, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 492, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 467, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 369, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 442, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 299, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 481, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 252, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 452, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 83, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 17, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 503, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 468, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 513, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 318, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 323, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 509, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 292, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 61, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 66, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 279, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 266, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 513, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 452, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 87, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 18, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 506, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 306, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 331, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 221, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 43, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 85, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (33, 420, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 467, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 368, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 215, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 227, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 462, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (30, 396, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 272, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 120, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 528, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 410, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 277, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 37, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 88, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 88, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 144, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 307, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 326, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 269, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 11, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 170, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 263, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 263, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 266, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 206, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 538, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 331, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 502, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 277, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 168, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 131, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 504, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 286, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 323, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 293, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 170, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 497, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 262, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 480, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (37, 517, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 182, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 480, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 60, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 138, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 299, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 488, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (35, 378, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (36, 459, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 659, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 732, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 780, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 707, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 593, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 616, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 674, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 655, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 761, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 575, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 682, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 636, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 721, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 626, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 762, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 678, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 804, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 633, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 792, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 647, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 783, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 786, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 805, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 636, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 637, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 572, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 726, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 684, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 658, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 809, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 626, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 635, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 720, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 812, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 593, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 758, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 692, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 573, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 565, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 763, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 753, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 799, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 685, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 649, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 611, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 667, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 700, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 549, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 794, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 677, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 744, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 674, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 652, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 775, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 780, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 655, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 693, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 603, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 558, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 797, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 629, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 587, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 746, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 586, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 599, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 629, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 575, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 728, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 729, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 788, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 688, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 597, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 725, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 716, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 743, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 780, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 603, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 753, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 585, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 602, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 550, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 567, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 611, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 670, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 710, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 787, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 640, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 641, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 589, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 694, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 578, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 752, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 692, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 733, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 743, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 776, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 709, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 590, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 614, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 549, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 668, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 563, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 699, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 699, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 572, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 595, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 809, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 597, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 697, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 717, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 666, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 749, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 710, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 724, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 769, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 579, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 769, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 798, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 656, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 793, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 600, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 776, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 771, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 728, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 565, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 732, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 674, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 658, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 580, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 710, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 641, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 569, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 719, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 576, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 672, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 704, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 720, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 797, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 544, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 689, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 749, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 599, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 699, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 801, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 631, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 779, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 738, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 555, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 627, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 656, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 665, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 766, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 731, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 594, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 560, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 683, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 543, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 764, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 543, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 568, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 638, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 782, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 793, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 738, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 669, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 587, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 633, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 556, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 608, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 550, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 593, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 732, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 812, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 624, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 560, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 708, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 682, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 790, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 740, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 724, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 587, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 661, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 593, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 730, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 670, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 708, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 799, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 594, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 782, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 622, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 667, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 619, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 603, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 761, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 704, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 794, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 700, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 788, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 582, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 624, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 713, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 808, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 664, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 749, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 717, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 583, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 542, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 742, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 687, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 641, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 598, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 717, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 655, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 811, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 586, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 751, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 643, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 543, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 581, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 705, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 611, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 650, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 672, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 716, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 759, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 666, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 808, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 682, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 812, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 732, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 672, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 565, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 738, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 574, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 632, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 728, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 701, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 664, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 605, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 804, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 710, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 550, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 633, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 648, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 610, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 724, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 805, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 749, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 787, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 758, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 645, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 760, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 785, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 545, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 618, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 555, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 633, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 665, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 784, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 636, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 630, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 608, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 810, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 542, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 763, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (45, 638, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 545, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 590, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 564, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (48, 792, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 555, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 784, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 609, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 784, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 669, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 606, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 631, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 787, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 554, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 599, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 572, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (55, 685, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 807, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (51, 685, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 810, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 801, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 566, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 662, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 600, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (42, 683, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 608, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 711, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 686, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (49, 794, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 803, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (39, 738, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 771, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (38, 690, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 731, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 576, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 718, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 648, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (41, 740, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 603, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (46, 665, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 646, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (54, 573, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (53, 771, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (47, 571, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 149, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 487, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 265, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 386, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 44, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 439, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 402, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 29, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 326, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 509, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 84, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 478, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 80, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 288, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 106, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 288, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 352, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 143, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 425, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 399, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 308, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 86, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 271, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 200, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 466, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 444, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 279, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 173, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 446, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 376, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 102, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 292, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 453, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 358, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 5, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 323, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 219, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 152, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 71, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 178, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 477, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 43, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 168, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 14, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 425, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 95, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 388, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 499, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 356, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 47, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 474, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 22, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 231, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 495, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 44, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 381, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 329, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 315, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 383, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 374, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 284, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 298, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 325, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 214, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 361, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 120, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 173, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 293, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 178, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 135, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 235, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 456, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 427, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 82, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 405, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 511, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 459, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 329, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 373, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 137, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 385, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 162, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 187, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 329, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (56, 483, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 329, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 121, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 503, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 439, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (59, 424, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 483, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 488, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 329, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 329, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 329, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 329, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 329, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (60, 7, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (58, 204, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (57, 342, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 414, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 422, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 246, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 381, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 144, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 123, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 303, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 292, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 214, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 220, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 480, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 9, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 424, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 525, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 57, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 199, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 95, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 64, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 433, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 333, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 188, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 13, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 156, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 208, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 46, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 250, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 477, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 477, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 82, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 477, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 477, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 352, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 477, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 477, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 379, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 477, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 329, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 477, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 477, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 477, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 302, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 134, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 55, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 165, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 400, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 94, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 419, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 100, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 371, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 114, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 304, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 270, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 232, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 56, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 314, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 408, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 283, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 160, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 144, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 25, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 338, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 212, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 245, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 6, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 303, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 247, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 483, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 390, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 40, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 178, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 76, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 93, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 346, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 33, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 119, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 206, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 172, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 27, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 53, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 293, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 132, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 460, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 388, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 533, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 277, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 282, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 389, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 151, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 520, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 460, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 5, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 209, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 182, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 303, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 518, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 135, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 428, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (64, 328, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 270, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (65, 247, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 232, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 203, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 162, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 258, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 28, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 354, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 460, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 128, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 133, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 308, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 343, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 452, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 136, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 267, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 44, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 383, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 513, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 57, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 212, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 87, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 57, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 319, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 158, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 7, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 26, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 358, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 311, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 457, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 490, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 170, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 329, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 524, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 149, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 150, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 36, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 227, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 531, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 34, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 467, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 44, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 368, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 137, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 527, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 271, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 59, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 242, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 61, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 97, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 410, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 235, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 518, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 353, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 435, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 372, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 95, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 501, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 252, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 128, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 192, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 215, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 327, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 292, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 30, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 528, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 260, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 458, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 495, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 44, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 322, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 395, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 527, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 66, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 84, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 91, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 33, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 477, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 477, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 477, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 277, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 405, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 91, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 318, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 222, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 437, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 404, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 138, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 416, '2023-03-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 365, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 91, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 424, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 317, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 33, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 286, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 43, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 473, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 84, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 359, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 99, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 294, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 439, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 302, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 5, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 148, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 480, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 510, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 354, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 422, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 389, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 494, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 537, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 195, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 349, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 159, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 339, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 136, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 266, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 230, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 486, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 145, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 44, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 307, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 322, '2023-03-16');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 101, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 129, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 188, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 272, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 316, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 371, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 159, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 406, '2023-03-04');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 499, '2023-03-21');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 482, '2023-03-22');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 17, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 140, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 482, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 128, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 216, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 349, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 280, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 420, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 90, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 437, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 18, '2023-03-11');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 91, '2023-03-10');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 424, '2023-03-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 63, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 193, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 177, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 286, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 210, '2023-03-03');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 175, '2023-03-02');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 425, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 509, '2023-03-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 60, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 477, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 197, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 5, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 416, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 96, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 188, '2023-03-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 42, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 414, '2023-03-18');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 39, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 221, '2023-02-12');

INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 534, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 362, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 449, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 82, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 463, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 105, '2023-03-17');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 325, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 375, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 137, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 197, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 509, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 348, '2023-03-15');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 471, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 16, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 188, '2023-01-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 434, '2023-03-01');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 234, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (24, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 234, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 234, '2023-03-07');

INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 477, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 477, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 477, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 477, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 477, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 477, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 477, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 477, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (21, 477, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 477, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 477, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 477, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 477, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 477, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 477, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 477, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 477, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 477, '2023-02-1');


INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 137, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 137, '2023-03-06');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 137, '2023-03-09');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 137, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 137, '2023-02-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 137, '2023-02-20');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 137, '2023-02-1');

INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 234, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 234, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 234, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (21, 234, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 234, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 234, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 234, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 234, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 234, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (24, 234, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 234, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (12, 234, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (10, 234, '2023-03-07');

INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (70, 44, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 44, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 44, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 44, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (73, 44, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (71, 44, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (1, 44, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (2, 44, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (21, 44, '2023-03-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (32, 44, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (50, 44, '2023-03-07');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (52, 44, '2023-03-08');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (31, 44, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (40, 44, '2023-02-19');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 44, '2023-02-14');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (74, 44, '2023-02-12');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (72, 44, '2023-03-05');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (43, 44, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (61, 44, '2023-02-13');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (44, 44, '2023-02-1');
INSERT INTO `Listening_table` (User_Id , Title_Id, `Last_played_date`) VALUES (24, 44, '2023-02-12');



## TEMPLATE FOR Artist_follower_list


INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 7);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 6);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 3);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 4);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 6);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (4, 10);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 1);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 10);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 6);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 4);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (10, 6);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 6);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 2);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 9);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 4);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (10, 2);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 1);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 7);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 4);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 1);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 19);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 14);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 16);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 18);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (4, 18);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 20);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 18);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 10);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 15);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 16);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 16);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 19);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 15);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 15);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 17);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 15);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 16);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 19);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 20);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 13);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 24);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 21);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 26);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 26);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (10, 24);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 30);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (10, 23);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 21);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 27);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 28);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 25);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 28);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 29);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 23);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 20);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 40);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 31);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 36);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 40);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 40);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 40);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 40);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 37);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 35);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 30);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 30);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 36);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 32);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 31);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 30);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 36);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 30);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 33);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 39);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 34);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 43);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 44);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 46);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 50);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 47);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 41);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 47);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 46);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 50);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 46);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 41);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (10, 44);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 55);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (4, 52);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 42);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 41);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 51);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 41);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 56);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 43);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 61);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (11, 72);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 82);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 66);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 88);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 89);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 62);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 70);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 90);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 78);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 63);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 86);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 63);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (6, 70);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 64);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 65);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (3, 65);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 69);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 68);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 62);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 86);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (2, 76);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 61);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 74);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 74);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (1, 65);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (12, 85);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 90);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 88);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 77);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (7, 75);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 80);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 61);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (15, 78);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (13, 72);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (5, 82);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (14, 76);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (8, 85);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (16, 75);
INSERT INTO `Artist_Follower_list` (`Artist_ID`, `User_ID`) VALUES (9, 75);


#TEMPLATE FOR Playlist

INSERT INTO `Playlist` (`User_ID`,`Name`, `Type`, `Creation_Date`) VALUES (1, 'FAVORITE', 'Private', '2022-05-11');
INSERT INTO `Playlist` (`User_ID`,`Name`, `Type`, `Creation_Date`) VALUES (1, 'BRITHDAY_PARTY', 'Private', '2022-06-28');
INSERT INTO `Playlist` (`User_ID`,`Name`, `Type`, `Creation_Date`) VALUES (1, 'Pop-music', 'Public', '2022-11-21');
INSERT INTO `Playlist` (`User_ID`,`Name`, `Type`, `Creation_Date`) VALUES (1, 'Rap', 'Public', '2023-01-05');


#TEMPLATE FOR Playlist_line

INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 320);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 188);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 343);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 490);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 327);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 179);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 223);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 19);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 151);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 328);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 310);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 194);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 331);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 500);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 421);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 240);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 163);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 200);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 2);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 318);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 427);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 304);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 531);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 15);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 224);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 383);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 359);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 87);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 177);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 394);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 506);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 504);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 164);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 461);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 56);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 384);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 353);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 171);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 145);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 377);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 530);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 408);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 108);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 147);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 33);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 483);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 6);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 478);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 350);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 465);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 379);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 191);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 130);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 507);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 365);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 207);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 311);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 387);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 248);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 344);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 136);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 325);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 3);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 288);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 246);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 332);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 439);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 5);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 71);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 8);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 366);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 180);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 428);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 333);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 442);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 210);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 10);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 290);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 149);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 357);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 221);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 61);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 492);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 11);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 185);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 127);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 374);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 7);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 410);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 475);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 4);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 13);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 132);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 524);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 257);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 385);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 460);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 1);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 83);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (1, 452);

INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 710);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 112);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 761);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 577);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 600);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 568);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 534);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 782);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 118);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 685);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 723);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 22);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 381);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 276);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 208);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 293);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 88);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 165);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 320);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 750);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 666);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 797);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 694);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 268);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 510);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 382);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 676);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 78);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 103);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 255);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 246);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 635);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 615);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 489);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 70);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 427);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 23);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 755);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 798);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 329);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 812);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 688);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 91);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 213);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 181);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 507);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 141);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 253);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 248);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (2, 363);


INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 192);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 294);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 160);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 226);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 233);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 158);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 237);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 78);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 202);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 180);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 270);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 42);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 92);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 284);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 172);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 108);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 257);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 131);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 203);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 105);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 87);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 298);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 127);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 311);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (3, 343);

INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 473);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 471);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 489);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 499);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 477);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 504);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 490);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 422);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 464);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 516);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 467);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 410);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 512);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 521);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 462);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 540);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 456);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 526);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 437);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 524);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 465);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 500);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 509);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 534);
INSERT INTO `Playlist_line` (`Playlist_ID`, `Title_ID`) VALUES (4, 492);


#TEMPLATE FOR Playlist_Follower_list


INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 79);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 25);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 87);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 39);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 2);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 50);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 66);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 72);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 86);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 91);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 22);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 78);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 55);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 41);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 83);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 18);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 26);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 35);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 71);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 3);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 32);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 77);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 90);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 19);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (3, 20);


INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 27);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 82);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 89);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 2);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 62);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 49);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 36);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 44);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 91);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 42);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 81);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 88);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 79);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 8);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 41);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 74);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 70);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 48);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 16);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 4);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 9);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 5);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 87);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 25);
INSERT INTO `Playlist_Follower_list` (`Playlist_ID`, `User_ID`) VALUES (4, 10);