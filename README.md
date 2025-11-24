# 🎵 Spotify Data Analysis and Fraud Detection Project

**SQL Database Design & Analytical Querying**

***

## Project Overview

This repository contains the complete SQL database structure and a set of analytical queries designed to derive key business insights from a mock Spotify/music streaming dataset. The project demonstrates advanced SQL techniques for reporting, performance analysis, and crucial fraud detection efforts.

The database is structured to capture detailed user listening habits, subscription data, artist followers, and title information. The queries use complex joins, subqueries, and conditional logic to provide high-value data reports.

***

## Repository Contents

The project is structured with two main SQL files:

| File Name | Description |
| :--- | :--- |
| **`Spotify_Database.sql`** | Contains the **full database schema** (`CREATE TABLE` statements) for all tables (e.g., `Spotify_User`, `Account`, `Listening_table`, `Artist`, `Title`) and all necessary **initial `INSERT` statements** to populate the tables with sample data. This is the setup file. |
| **`Queries.sql`** | Contains **three main analytical queries**, complete with comprehensive in-query documentation explaining the business objective, methodology, and key metrics for each report. |

***

## Analytical Queries Description

The `Queries.sql` file includes three distinct reports aimed at different business functions: user engagement, artist performance, and risk management.

### 1. QUERY 1: Spotify Wrap (User Engagement)

This query is designed to generate a personalized "Spotify Wrap"-style annual report for a specific user (**User\_ID = 1, Niko Brodey**) for the year 2022.

* **Objective:** Provide a fun, shareable summary of a user's listening habits to enhance engagement and promote transparency.
* **Key Metrics Calculated:**
    * **Total Minutes Listened** and **Average Minutes Per Day** listened last year.
    * Favourite **Artist**, **Song**, and **Genre** (with total minutes spent on each).
    * **Proportion of Love Songs** listened to (based on a keyword search).
    * Total **Amount Paid** for Spotify by the user last year.

### 2. QUERY 2: Charts Overview (Artist Performance & Growth)

This query generates a performance chart comparing two consecutive months (March vs. February 2023), focusing on metrics valuable to creators.

* **Objective:** Provide artists with actionable statistics on song performance and audience growth beyond simple play counts.
* **Key Metrics Calculated:**
    * **Top 10 Listened-to Songs** in March.
    * **Distinct Listeners** for each song in March.
    * **Distinct Non-Followers:** The count of unique users who listened to the song but are **not yet followers** of the artist. This helps artists track new audience reach.
    * Comparison of play count against the song's **Performance in February**.

### 3. QUERY 3: Fraud Detection (Risk Management)

This query focuses on identifying and assessing the risk posed by potentially fraudulent 'Student' subscription accounts.

* **Objective:** Flag "Student" accounts that are statistically less likely to be actual students to prompt further verification, mitigating potential revenue loss.
* **Key Criteria:** Filters accounts with the 'Student' subscription description where the user's **Actual Age is over 30** years old.
* **Risk Metrics Calculated:**
    * **Fraud Likelihood Score** (categorized based on age).
    * **Total Amount Received** from the user to date.
    * **Potential Accumulated Loss** if the user is confirmed to not be a student (calculated by difference between student price paid and full-price assumption of $9.99).
    * The user's **Revenue Contribution** to the total 2023 revenue.

***

## Setup and Execution

To run this project, you need a MySQL or compatible SQL database environment (e.g., local server, XAMPP, or a cloud instance).

### Step 1: Create the Database Schema and Populate Data

1.  Connect to your MySQL server.
2.  Execute the entire contents of the **`Spotify_Database.sql`** file. This will create all necessary tables and populate them with the sample data required for the queries to run.

### Step 2: Run Analytical Queries

1.  Keep the same connection open.
2.  Execute the queries in the **`Queries.sql`** file one by one.

Each query in `Queries.sql` is fully self-contained and will return the complete analytical report as described above.
