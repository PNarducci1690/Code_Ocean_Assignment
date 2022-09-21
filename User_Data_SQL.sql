/* Create a table in snowflake to store demo CSV data*/

create or replace table "DEMO_DB"."PUBLIC"."USER_DATA" (
    event_id TINYINT
    ,user_email VARCHAR(50)
    ,event_type VARCHAR(50)
    ,time_stamp DATE
    ,event_name VARCHAR(50)
    ,event_status VARCHAR(50)
);

/* For this exercise we are going to assume a random start date.
The dates are randomized from January 1st 2021 to December 31st 2021.
We will assume that the date in which this data was viewed was on June 12th 2021.
We will assume 30 days in a month and the range will go from May 13th until June 12th

Notes about the data: I added an extra column entitled event_id in order to create a primary key for the table. Having a primary key for a 
table is important, especially when working with multiple tables, as to avoid M2M relationships. Doing this will come in handy when 
I utilize the BI tool- Sisense- later on in order to run queries at the widget level


1) Write a query that, given these fields in the table, will present which users are creating
capsules across a 1-month span (starting from the current date) */

select
distinct user_email
from "DEMO_DB"."PUBLIC"."USER_DATA"
where event_type = 'capsule' and time_stamp between '2021-05-13' and dateadd(day, 30, '2021-05-13')
order by user_email

/* In order to determine what users are creating capsules over a month (30 day) time span, I chose to create this list by selecting 
the users distinct e-mail. Since e-mail is not a unique value, I wanted to filter out any repeptition in the data so I could see 
which unique users were creating capsules.

In order to filter by event_type and time_stamp, I used a where clause 
that only selected event types that were equal to capsule and  a between clause in order to select a date range from 05/13/21 - 06/12/21. 

In total, according to snowflakes built in row count, 31 out of the 50 users in the database have created a capsule over the span of a month. 
I can also check the row count by running the following code bellow. When run it will give me a total user
count of 31*/

select
count(distinct user_email) as total_users
from "DEMO_DB"."PUBLIC"."USER_DATA"
where event_type = 'capsule' and time_stamp between '2021-05-13' and dateadd(day, 30, '2021-05-13')

/* 2) Write a query that would allow you to see the pattern of computations in the recent 30 days (another interesting metric) */

select
user_email
,event_name
,time_stamp
from "DEMO_DB"."PUBLIC"."USER_DATA"
where event_name = 'computation' and time_stamp between '2021-05-13' and dateadd(day, 30, '2021-05-13')
order by time_stamp

/* The code above selects the user_email, event_name, and time_stamp columns, so that an output is created that shows what users created 
a computation event over the defined 30 days. By using the where clause, I am able to select only events clasified as computations between the 
specified date range. Ordering by time_stamp allows me to view the events in order from the start date up until the current date.

The resuts show that most computations happened mid May, with the most totaling 4 on May 19.
After the 19 the computations begin to decrease until they become almost non existent in June.
The charting feature on Snowsight shows a detailed graphic of these events and and image of the chart can be found in the gitrepo*/

/* 3) Write a query for, in the last 30 days, which users have done successful runs (completed
computations). */

select
distinct user_email
from "DEMO_DB"."PUBLIC"."USER_DATA"
where (event_name = 'computation' and event_status = 'completed') and time_stamp between '2021-05-13' and dateadd(day, 30, '2021-05-13')

/* In order to solve this question, I needed to look at the distinct users over the selected 30 day time period. By using a where clause
I am able to select events that are only considered completed computations. The output provides me with a unique list of user names that were
able to accomplsh this. The total was 7 distinct users.

I also find that this answer may shed some light on the previous answer. In question two we could see that users began to perform less
and less computations until they became rare. If there are a total of 50 known users and only 7 of them are able to successfully 
perform a completed computation, then this may mean that our product may be difficult to utilize or understand. This is definitely a point
of interest and concern since so many users seem to be struggling and are becomming less likely to use the products computtional feature.

*/

/* 4) Write a query that would measure usage across a month for all users in the table. Please
only include users that have done at least 5 computations or 10 views in the last month (an
example of how we choose to measure stickiness, determining the fraction of users within a
customer that are regularly active on the platform).*/

select 
*
from 
(
    select
    user_email
    ,event_name
    ,count(*) as event_count
    from "DEMO_DB"."PUBLIC"."USER_DATA" 
    where event_name != 'create' and time_stamp between '2021-05-13' and dateadd(day, 30, '2021-05-13')
    group by user_email, event_name
) 
where (event_name = 'view' and event_count >= 10) or (event_name = 'computation' and event_count >= 5)
group by user_email, event_name, event_count

/* In order to solve this question a subquery was needed in order to utilize an alias that provided the count for the various events. 
The inner query selects the user, the event name, and provides a count of each event. It then proceeds to select events that do not 
match event type create between the specified time frame using a where clause. The inner query is then grouped by user followed by event type.

The outside query furter organizes this query by furthr filtering the event name and utilizing event_count in order to create a range 
for each events minimum occurrence. After the where clause is used, the group by is used to return a queried table that looks at users, 
the event they used and a count of how many times they created such an event.

This query, dut to the randomized results of this month, will return no results. Changing the count minimum value will roduce results, 
but since there was a declining amount of events created by users over the selected 30 days, most users totalled only 1 or 2 events.
