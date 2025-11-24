-- QUERY 1 

-- We at Spotify are constantly trying to improve our work and put all our efforts in enhancing our listeners's experience.
-- Listening to music is one of the most sensational experieces we as humans get to live through.
-- We want to give something back to our comminity, by allowing them to live through their past moments again.
-- With Spotify Wrap Users get the oportunity to see some cool statistics about their listening patterns, like favourite artists, songs or genre, how much time they are listening music each day and etc.
-- This is additionally a strategric marketing campaign that promotes unharmful data-useage while allowing Listeners to share their statistics on social media platforms to interact with their following.
-- This will also be mutually beneficial to artists using our site.

-- In our Spotify Warp we show favourite artists, songs and genres.
-- Additionally we porvide information about minutes spent with those 3 favourties( artist, song, genre).
-- There is also genral information about total minutes spent on Spotify and Avarage number of minutes per day.
-- At the end we find information about how much user payed for Spotify last year
-- We are confident that our service is worth the amount paid. Henceforth we believe that this open relationship towards the money will be benefit the trust in our company.
-- Lastly we will show the % of all avaliable love songs our user listened. This is only example which can be extended to other keywords.
-- This may be a stepping stone in improving our recommendation algorithm

-- The following will be a SPORTIFY WRAP for User_ID=1 ( Niko Brodey )

SELECT 
	Time_Table.Name AS `Name`,
	Time_Table.`Total Minutes Listened By Niko` AS `Total Time Listening to Music Last Year (min)`,
	Time_Table.`Avarage Time Spend Per Day On Listening By Niko` AS `Avg Time per Day Spent Listening to Music Last Year`,
	Favourite_Artist.`Artist Name` AS `Favourite Artist Listened to Last Year`,
 	Favourite_Artist.`Total Minutes Listened To Artist By Niko` AS `Minutes Spent Listening to Favourite Artist Last Year`,
	Favourite_Song.`Song Title`  AS `Favourite Song Listened to Last Year`,
	Favourite_Song.`Total Minutes Listened To Song By Niko`  AS `Minutes Spent Listening to Favourite Song Last Year`,
	Favourite_Genre.`Genre`  AS `Favourite Genre Listened to Last Year`,
	Favourite_Genre.`Total Minutes Listened To Genre By Niko`  AS `Minutes Spent Listening to Favourite Genre Last Year`,
	Love_Theme_Table.`Proportion of Songs with Love` AS `How much % of All Avaliable Love Songs Were Listened to `,
	Payment_Table.`Amount Paid Per User` AS `Amount paid for Spotify by User Last Year`
FROM (
	SELECT 
 		Spotify_User.Name AS Name, 
		ROUND(SUM(Title.Duration)/60, 0)AS `Total Minutes Listened By Niko`,
		ROUND(SUM(Title.Duration)/60/365,0) AS `Avarage Time Spend Per Day On Listening By Niko`
	FROM Listening_table
	INNER JOIN Title ON Listening_table.Title_ID = Title.ID
	INNER JOIN Spotify_User ON Listening_table.User_ID = Spotify_User.ID
	WHERE Listening_table.User_ID = 1
		AND Listening_table.Last_played_date BETWEEN '2022-01-01' AND '2022-12-31') Time_Table
INNER JOIN (
	SELECT 
		Spotify_User.Name AS Name,
 		Artist.Name AS `Artist Name`,
 		ROUND(SUM(Title.Duration)/60, 0) AS `Total Minutes Listened To Artist By Niko`
	FROM Artist
	INNER JOIN Album ON Artist.ID = Album.Artist_ID
	INNER JOIN Title ON Album.ID = Title.Album_ID
	INNER JOIN Listening_table ON Title.ID = Listening_table.Title_ID
	INNER JOIN Spotify_User ON Listening_table.User_ID = Spotify_User.ID
	WHERE Listening_table.User_ID = 1
		AND Listening_table.Last_played_date BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY Artist.Name
	ORDER BY `Total Minutes Listened To Artist By Niko` DESC LIMIT 1
 ) Favourite_Artist ON Favourite_Artist.Name = Time_Table.Name
 
INNER JOIN (
	SELECT 
    	Spotify_User.Name AS Name,
    	Title.Name AS `Song Title`,
		ROUND(SUM(Title.Duration)/60, 0) AS `Total Minutes Listened To Song By Niko`
	FROM Title
	INNER JOIN Listening_table ON Listening_table.Title_ID = Title.ID
	INNER JOIN Spotify_User ON Listening_table.User_ID = Spotify_User.ID
	WHERE Listening_table.User_ID = 1
		AND Listening_table.Last_played_date BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY Title.Name
	ORDER BY `Total Minutes Listened To Song By Niko` DESC LIMIT 1
 ) Favourite_Song ON Favourite_Song.Name = Time_Table.Name
  
INNER JOIN(
	SELECT 
    	Spotify_User.Name AS Name,
    	Album.Genre AS `Genre`,
     	COUNT(*) AS `Number Listening To The Genre By Niko`,
     	ROUND(SUM(Title.Duration)/60, 0) AS `Total Minutes Listened To Genre By Niko`
	FROM Album
	INNER JOIN Title ON Album.ID = Title.Album_ID
	INNER JOIN Listening_table ON Title.ID = Listening_table.Title_ID
	INNER JOIN Spotify_User ON Listening_table.User_ID = Spotify_User.ID
	WHERE Listening_table.User_ID = 1
		AND Listening_table.Last_played_date BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY Album.Genre
	ORDER BY `Number Listening To The Genre By Niko` DESC LIMIT 1
) Favourite_Genre ON Favourite_Genre.Name = Time_Table.Name

INNER JOIN(
	SELECT 
    	Spotify_User.Name AS Name, 
     	COUNT(DISTINCT Title.Name) AS `Number of Songs with Love`,
     	CONCAT(ROUND(COUNT(DISTINCT Title.Name)/Total_Love_Songs.total_love_songs*100,2), ' %') AS `Proportion of Songs with Love`
	FROM Title
	INNER JOIN Listening_table ON Listening_table.Title_ID = Title.ID
	INNER JOIN Spotify_User ON Listening_table.User_ID = Spotify_User.ID
	CROSS JOIN (
     	SELECT COUNT(*) AS total_love_songs 
    	FROM Title 
    	WHERE Name LIKE '%love%'
	) Total_Love_Songs
	WHERE Title.Name LIKE '%love%'
		AND Spotify_User.ID = 1
		AND Listening_table.Last_played_date BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY Spotify_User.Name, Total_Love_Songs.total_love_songs
	ORDER BY `Number of Songs with Love` DESC
) Love_Theme_Table ON Love_Theme_Table.Name = Time_Table.Name

INNER JOIN(
	SELECT 
     	Spotify_User.Name AS Name, 
     	CONCAT(ROUND(SUM(Subscription.Amount_Payed) / Account_Table.Num_Users, 2), ' $') AS `Amount Paid Per User`
	FROM Spotify_User
    INNER JOIN Account ON Spotify_User.Account_ID = Account.ID
    INNER JOIN Subscription ON Account.ID = Subscription.Account_ID
    INNER JOIN (
        SELECT 
             Account.ID AS Account_ID, 
             COUNT(DISTINCT Spotify_User.ID) AS Num_Users
         FROM Account 
         INNER JOIN Subscription  ON Account.ID = Subscription.Account_ID
         INNER JOIN Spotify_User  ON Account.ID = Spotify_User.Account_ID
         WHERE Subscription.Subscription_Payment_Date_Start BETWEEN '2022-01-01' AND '2022-12-31'
         GROUP BY Account.ID
    ) Account_Table ON Spotify_User.Account_ID = Account_Table.Account_ID
	WHERE Subscription.Subscription_Payment_Date_Start BETWEEN '2022-01-01' AND '2022-12-31'
		AND Spotify_User.ID=1
	GROUP BY Spotify_User.ID
) Payment_Table ON Payment_Table.Name = Time_Table.Name;

-- QUERY 2 

-- We strive for creating a platform that enriches all parties envolved in the music industry: Creators, Listeners and Distributors.
-- In our second query we decided to prove a valueable insight for Listeners and Creators by sharing perfomance statistics.
-- This is indeed quite similar to normal charts, but we also provide Artis with the insight of the count of listeners, that have not yet hit the following button.
-- By adding this feature Creators get a feeling on a regular basis on how many new people they've reached in the previous months.
-- The benefit for users is here that they can get to know upcoming artists that may have never heard of before.

SELECT 
	Table_March.Times_Song_was_played AS `Top Listened to Songs in March`, 
	Table_March.Name AS `Song Name`, 
    Table_March.Artist_Name AS `Artist Name`, 
    Table_March.Distinct_listeners AS `Distinct Users in March`,
    Table_March.Distinct_non_followers AS `Distinct Non-Followers in March`,
    Followers.Number_of_Followers AS `Number of Followers`,
  	Table_February.Times_Song_was_played AS `Song's Performance in February` 
FROM (
	SELECT 
 	COUNT(Title.Name) AS Times_Song_was_played,
     	COUNT(DISTINCT Listening_table.User_ID) AS Distinct_listeners,
     	COUNT(DISTINCT CASE WHEN Artist_Follower_list.User_ID IS NULL THEN Listening_table.User_ID END) AS Distinct_non_followers,
     	Title.Name, 
     	Artist.Name AS Artist_Name,
     	Artist.ID
    FROM Artist
    INNER JOIN Album ON Album.Artist_ID = Artist.ID
    INNER JOIN Title ON Title.Album_ID = Album.ID
    INNER JOIN Listening_table ON Listening_table.Title_ID = Title.ID
    INNER JOIN Spotify_User ON Spotify_User.ID = Listening_table.User_ID
    LEFT JOIN Artist_Follower_list ON Artist_Follower_list.Artist_ID = Artist.ID AND Artist_Follower_list.User_ID = Listening_table.User_ID
    WHERE Listening_table.Last_played_date BETWEEN '2023-03-01' AND '2023-04-1'
    GROUP BY Title.ID, Artist.ID
    ORDER BY Times_Song_was_played DESC LIMIT 10
  ) Table_March

LEFT JOIN (
	SELECT 
    	COUNT(Title.Name) AS Times_Song_was_played, 
     	Title.Name
	FROM Artist
     	INNER JOIN Album ON Album.Artist_ID = Artist.ID
    	INNER JOIN Title ON Title.Album_ID = Album.ID
      	INNER JOIN Listening_table ON Listening_table.Title_ID = Title.ID
     	INNER JOIN Spotify_User ON Spotify_User.ID = Listening_table.User_ID
    WHERE Listening_table.Last_played_date BETWEEN '2023-02-01' AND '2023-03-1'
    GROUP BY Title.ID
) Table_February ON Table_February.Name = Table_March.Name

INNER JOIN (
	SELECT 
    	COUNT(Artist_Follower_list.User_ID) AS Number_of_Followers, 
     	Artist.ID 
    	FROM Artist
     INNER JOIN Artist_Follower_list ON Artist_Follower_list.Artist_ID = Artist.ID
     GROUP BY Artist.ID
   ) Followers ON Followers.ID = Table_March.ID;
 
 

-- QUERY 3

-- Query diclaimer: 
-- We as a company fear that an increasing amount of accounts claim to be students, in order to obtain services at a lower price.
-- This poses an issue to our compnay as we may loose potential reveneu. 
-- In order to adress this issue, we have decided to query our database, classifying "Student" accounts by their liklihood of being an actual student. 
-- For time efficiency and complecity of our servers, we added the filter to only look for "Students" above 30 years of age.
-- The reason for this filter is that we believe studying until you're 30 is not all too unusal. Everything above may be questionable. 
-- We do not only retrieve the email of Users but also an estiamte of the loss occured due to these potential fraudulent accounts. 
-- As a result of this query we may better understand the severity of this issue as well as send out emails to the student accounts, asking for a proof of enrollment. 

SELECT 
	Potential_Fraud.Email_PF AS `Email Adress of potential Fraud`,
	Potential_Fraud.Age AS `Actual age`,
	Potential_Fraud.Fraud_Likelihood AS `Likelihood of being a "Student"`,
	Potential_Fraud.Distinct_Payments AS `Total Number of Payments`,
    CONCAT(FORMAT(Potential_Fraud.Total_Cash_from_User, 2), ' $') AS `Total Amount received from User`,
    CONCAT(FORMAT(Potential_Fraud.Potential_accumulated_Loss, 2), ' $') AS `Accumulated Loss if User != Student`,
	CONCAT(FORMAT(Revenue_from_Potential_Fraud.Total_Paid, 2), ' $') AS `Amount received from User in 2023`,
	CONCAT(FORMAT(Revenue_from_Potential_Fraud.Potential_accumulated_Loss, 2), ' $') AS `Accumulated Loss if User != Student in 2023`,       
	CONCAT(FORMAT(Revenue_Table.Total_Revenue_2023, 2), ' $') AS `Total Revenue in 2023`,
	CONCAT(ROUND(Potential_Fraud.Total_Cash_from_User / Revenue_Table.Total_Revenue_2023*100,2), ' %') AS `Revenue Contribution of this User`    
FROM (
	SELECT SUM(Subscription.Amount_Payed) AS Total_Revenue_2023 
	FROM Subscription
	WHERE Subscription.Subscription_Payment_Date_Start BETWEEN '2023-01-01' AND '2023-04-01'
) Revenue_Table

INNER JOIN (
	SELECT 	
	    Spotify_User.Email AS Email_PF, 
	    TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) AS Age, 
	    CASE
	        WHEN TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) >= 10 AND TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) <= 20 THEN 'very likely'
	        WHEN TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) > 20 AND TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) <= 30 THEN 'likely'
	        WHEN TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) > 30 AND TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) <= 35 THEN 'rather unliekly'
	        WHEN TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) > 35 AND TIMESTAMPDIFF(YEAR,Birthday,CURDATE()) <= 40 THEN 'unlikely'
	        ELSE 'very unlikely'
	    END AS Fraud_Likelihood, 
	    COUNT(DISTINCT DATE_FORMAT(Subscription_Payment_Date_Start, '%Y-%m')) AS Distinct_Payments,
	    SUM(Subscription.Amount_Payed) AS Total_Cash_from_User, 
	    SUM(Subscription.Amount_Payed) - COUNT(Subscription.ID)*9.99 AS Potential_accumulated_Loss
	FROM Spotify_User
	INNER JOIN Account ON Spotify_User.Account_ID = Account.ID
	Inner JOIN Subscription ON Subscription.Account_ID = Account.ID
	WHERE YEAR(Spotify_User.Birthday) <= YEAR(NOW()) - 30 AND Subscription.Description = 'Student'
	GROUP BY Spotify_User.ID
	ORDER BY Age DESC
) Potential_Fraud
INNER JOIN (
	SELECT 
		Spotify_User.Email,
		SUM(Subscription.Amount_Payed) AS Total_Paid, 
		SUM(Subscription.Amount_Payed) - COUNT(Subscription.ID)*9.99 AS Potential_accumulated_Loss
	FROM Spotify_User
	INNER JOIN Account ON Spotify_User.Account_ID = Account.ID
	Inner JOIN Subscription ON Subscription.Account_ID = Account.ID
	WHERE Subscription.Subscription_Payment_Date_Start BETWEEN '2023-01-01' AND '2023-04-01'
	GROUP BY Spotify_User.Email
) Revenue_from_Potential_Fraud ON  Potential_Fraud.Email_PF =  Revenue_from_Potential_Fraud.Email;