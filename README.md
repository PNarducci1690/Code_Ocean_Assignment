# Assignment - Meaningful User Activity

## The Process

For the following assignment, I was asked to run four queries in order to answer questions about user activity. 
In order to solve this problem I worked in a series of steps:
  1) Create a CSV containing randomized fake data 
  2) Importing the CSV into snowflake and creating a table based on the data
  3) Utilizing Snowflake and Snowsight in order to run and test quries as well as create quick graphics to visualize results
  4) And, Utilizing Sisense (A BI platform) in order to create widgets in order to better visualize results
  
  ### Creating the CSV file
  
  The CSV file was created using Microsoft Excel. I utilized the five expected columns (user_email. event_type, time_stamp, event_name, event_status), while also incoprporating a primary key that I called event_id. I created this primary key in order to provide the table with a column that contained completely unique values (I think it's important for tables to have this indetifier as to avoid any complications with future querying tasks or when it comes to utilizing BI Tools like Sisense). Every column within the CSV contained randomly generated values over a 1000 rows. 
  
  ### Utilizing Snowflake
    
  I decided to use snowflake in order to run my queries because it's an industry standard, and a platform that I have been utilizing for some time now. Within the snowflake intance I created a table titled USER_DATA and proceeded to file this table with data from the CSV. From there, I utilized Snowsight in order to create and utilize snowrises chart creator in order to visualize outputs if needed. The SQL code created and queried in snowflake can be found [here](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/User_Data_SQL.sql) along with comments explaining my methods and results.
    
### Utilizing Sisense

  Sisense is a BI platform that allows users to connect to their data wharehouses and, utilizing the data stored there, build KPIs. I decided to utilize Sisense since I felt that this assignment required more of a BI Analyst approach. I also use Sisense consitently at work, and I wanted to showcase my abilities when it comes to utilizing BI tools.


## Questions and results

1) Write a query that, given these fields in the table, will present which users are creating
capsules across a 1-month span (starting from the current date).

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_1_1.png)

The SQL query above provides an output of the distinct user's that have been creating capsules over the designated 30
day period. The query above selects each distinct user from within the user_email column and then, utilizing the where
clause, the query selects which of those distinct users built capsules over the selected 30 day period. Finally, the order by 
keyword sorts the results in ascending order (ASC is not required since rder by sorts the results in ascending order by default)

The query returns an output of 31 unique user e-mails (with e-mail being a representation of the user)

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_1_Results2.png)

2) Write a query that would allow you to see the pattern of computations in the recent 30 days
(another interesting metric).

3) Write a query for, in the last 30 days, which users have done successful runs (completed
computations).

4) Write a query that would measure usage across a month for all users in the table. Please
only include users that have done at least 5 computations or 10 views in the last month (an
example of how we choose to measure stickiness, determining the fraction of users within a
customer that are regularly active on the platform).
