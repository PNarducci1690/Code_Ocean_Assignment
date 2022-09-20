# Code_Ocean_Assignment

For the following assignment, I was asked to run four queries on a make believe table called user_data. In order to solve this problem I worked in a series of steps:
  1) Create a CSV containing randomized fake data 
  2) Using the CSV, create a table in Snowflake
  3) Utilizing Snowflake and Snowsight in order to run and test quries as well as create quick graphics
  4) And, Utilizing Sisense (A BI platform) in order to create widgets in order to better visualize results
  
  # Creating the CSV file
  
  The CSV file was created using Microsoft Excel. I utilized the five expected columns (user_email. event_type, time_stamp, event_name, event_status), and a made up primary key that I called event_id. I created this primary key in order to provide the table with a column that contained completely unique values (I think it's important for tables to have this indetifyer as to avoid any complications with future querying tasks or when it comes to utilizing BI Tools like Sisense). Every column contained randomly generated values and a 1000 rows were generated. 
  
  # Utilizing Snowflake
    
  I decided to use snowflake in order to run my queries because it's an industry standard, and a platform that I have been utilizing for some time now. Within the snowflake intance I created a table and then uploaded the CSV in order to fill the table. From there, I built queries in order to answer the questions provided using SQL. The SQL code can be found here, and a writen explanation for those questions can be found in the following readme.md file. Also, images of graphics created in Snowsight can be found here.
    
# Utilizing Sisense

  Sisense is a BI platform that allows users to connect to their data wharehouses and, utilizing the data stored there, build KPIs. I decided to utilize Sisense since I felt that this assignment allowed me to take more of a BI analyst approach to solving the problem. I also use Sisense consitently at work, and I wanted to showcase my abilities when it comes to utilizing BI tools.
