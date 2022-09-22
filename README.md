# Assignment - Meaningful User Activity

## The Process

For the following assignment, I was asked to run four queries in order to answer questions about user activity. 
In order to solve this problem I worked in a series of steps:
  1) Create a CSV containing randomized fake data 
  2) Importing the CSV into snowflake and creating a table based on the data
  3) Utilizing Snowflake and Snowsight in order to run and test quries as well as create quick graphics to visualize results
  4) And, Utilizing Sisense (A BI platform) in order to create widgets in order to better visualize results
  
  ### Creating the CSV file
  
  The CSV file was created using Microsoft Excel. I utilized the five expected columns (user_email. event_type, time_stamp, event_name, event_status), while also incoprporating a primary key that I called event_id. I created this primary key in order to provide the table with a column that contained completely unique values (I think it's important for tables to have this indetifier as to avoid any complications with future querying tasks or when it comes to utilizing BI Tools like Sisense). Every column within the CSV contained randomly generated values over a 1000 rows. The date range in the data goes from January 1st, 2021 up until December 31st, 2021.
  
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
keyword sorts the results in ascending order (ASC is not required since rder by sorts the results in ascending order by default).

The query returns an output of 31 unique user e-mails (with e-mail being a representation of the user) that have been tied
to creating capsules from the column ebent_type.

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_1_Results2.png)

If this was a real world scenario, I may be concerned as to why only 31 users, out of a total of 50, are only utilizing the capsule event. Further analysis Also shows that only a total of 44 capsules have been created by these 31 users. Is it possible that capsule creation is dificult? Is the tool that meeting the needs of the users? etc. But, even though this is randomized data, we can already see points of concern.

2) Write a query that would allow you to see the pattern of computations in the recent 30 days
(another interesting metric). 

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_2_1.png)

For this question, I wrote a query that selects on user_email, event_name, and time_stamp. Utilizing the where clause, the query selects on where event_name is categorized as a computation among the selected date timeframe. I then proceeded to order by time_stamp in order to show a linear output from the first date selected in the query up until the last date in the query. However, I took this step a bit further and created a chart out of the output in Snowsight in order to better visualize my findings.

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_2_Graph.png)

As can be seen, there is cause for concern. Only 25 computation events were performed during this 30 day period. I also notcied that as this particular 30 day time period progresses, less and less computation events are performed until a total of 6 are performed from early to mid June. This may imply that the tool itself may be too difficult for the users to use, as was suggested in the previous question.

3) Write a query for, in the last 30 days, which users have done successful runs (completed
computations).

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_3_1.png)

This query utilizes a distinct select on user_email. A where clause is then utilized to select only the values from event_name that are considered computations and the values from event_status that are considered completed. Finally, the where clause selects on the desired date range.

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_3_Results.png)

The output from the query is a result containing the unique users that have ran computations that are considered complete. Again, like the previouse questions, more concerns arise. As we saw in results from question 2, the amount of events considered as computations were slowly decreasing and becoming less aparent. The results here show that things may be even worse, since only seven out of fifty users were able to produce a computation that was considered completed. This continues to support my assumption that maybe the tool itself is too complicated for users to utilize efficiently.

4) Write a query that would measure usage across a month for all users in the table. Please
only include users that have done at least 5 computations or 10 views in the last month (an
example of how we choose to measure stickiness, determining the fraction of users within a
customer that are regularly active on the platform).

![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_4_1.png)

For the final query, a subquery was needed in order to produce the final results. The inner query selects on user_email, user_name, and produces an allias column called event_count which is produced using the count() function. The inner query then utilizes a where clause in order to select all events over the designated timeline that are not create events. Finally, the query is then grouped by user_email and event_name, thus allowing us to collapse the event_count into the required fields. If you were to run the inner query by itself, the output would be a listing of user emails, followed by the event type, followed by the total amount of times that the event occured.

The outter query is needed because it allows me to utilize the alias I created. Its purpose is to select value totals upon the specified events and within the specified value range as stated in the question. This is done by utilizing the where clause and utilizing a group by. The following outcome is produced:
![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_4_Result_1.png)

That's right! The Query produces no results. Because of the downward trend, not enough users produced enough views or computations that fall in between the range (Which continues to amplify the concern). But, in order to show that the code works, I produced a range that fits this particular 30 day period. 
![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/Quest_4_Result_What_If.png)

## Utilizing Sisense
  As a bonus, I wanted to demonstrate my familiarity  with utilizing a BI tool in order to create KPIs. The following dashboard was created using Sisense.
  
  ![](https://github.com/PNarducci1690/Take_Home_Assignment/blob/main/Assignment_Images/BI_Dashboard.png)

