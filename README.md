# Calculating and Analysis Free-to-Paid Conversion Rate with SQL

OBJECTIVES:

•	What is the free-to-paid conversion rate of students who have watched a lecture on the 365 platform?

•	What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)?

•	What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?

•	How can we interpret these results, and what are their implications?


1.	Observe the dataset
   
student_info

![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture1.png?raw=true)
 
student_engagement

![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture2.png?raw=true)
 
student_purchases

![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture3.png?raw=true)

Generate the subquery to get a table like this:

![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture4.png?raw=true)


Use the last query as a subquery and get the results:

![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture6.png?raw=true)

Conversion rate is 6%
First, consider the conversion rate and compare this metric to industry benchmarks or historical data. 
![image alt](https://github.com/allenissuperme/Calculating-Free-to-Paid-Conversion-Rate-with-SQL/blob/main/Picture5.png?raw=true) 

Possible Interpretation:

•	The conversion rate is low, meaning most students engage with free content but don't buy.

•	There could be barriers to purchase (e.g., pricing, lack of trust, or competitors offering better deals).

•	The content may not be engaging enough to lead to a purchase.

Recommendations:

•	Improve marketing efforts (email campaigns, follow-ups).

•	Offer discounts or incentives for first-time buyers.

•	Enhance the content experience to make users want to buy more.



On average, students take 3.44 days after registering to watch content.

Possible Interpretation:

•	This suggests that students don't watch immediately after registering.

•	There might be a lack of engagement or reminders pushing them to start watching.

•	Some students may register but never watch any content.

Recommendations:

•	Send welcome emails with reminders to start watching.

•	Implement a personalized recommendation system to suggest content.

•	Run A/B testing to see what strategies encourage users to start watching sooner.



students take a long time (~52 days) from watching their first content to making a purchase.

 Possible Interpretation:
 
•	There is a long decision-making process before purchasing.

•	Students may be waiting for promotions, discounts, or free trials to end.

•	The purchase process may not be intuitive, leading to delays.

Recommendations:

•	Reduce the decision-making time by offering limited-time discounts.

•	Send personalized email follow-ups encouraging purchases.

•	Improve the checkout process and highlight the value of paid content.

