
 /*2)  Please write one SQL SELECT query for each of the following results:
a)  The total pay_amount per city for sales in 2020
b)  The number of users, for whom the last contact has channel_name “SEM”,
but who have also at least one additional contact with another channel
c)  Per registration date and last channel, the number of users and the number of sales done by
users within 3 days after the registration*/

 select SUM(payments.pay_amount) 
FROM payments 
 JOIN sales ON payments.pay_sale_ID = sales.sale_ID
 JOIN users ON sales.sale_user_ID = users.user_ID 
WHERE payments.pay_timestamp = '2020' 
GROUP BY users.user_city;

 SELECT COUNT(users.user_ID), users.user_registration_timestamp
 FROM users 
 JOIN contacts ON users.user_ID = contacts.contact_user_ID 
JOIN channels  on contacts.contact_channel_ID = channels.channel_ID 
WHERE channels.channel_name = 'SEM' 
GROUP BY users.user_ID HAVING COUNT(contacts.contact_channel_id) > 1;




SELECT Number_of_Users.Count_1, Number_of_Sales.Count_2
FROM ( SELECT COUNT( DISTINCT users.user_ID) AS Count_1 FROM users) AS Number_of_Users,
 ( SELECT COUNT(sales.sale_ID) AS Count_2 FROM sales) AS Number_of_Sales
JOIN users ON sales.sale_user_ID = users.user_ID 
WHERE DAYS(sales.sale_timestamp)-DAYS(users.user_registration_timestamp)> 3
GROUP BY users.user_registration_timestamp AND MAX(channels.channel_ID)
);
