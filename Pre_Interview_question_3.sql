/*3)  Please write one SQL SELECT query for each of the following results:
a)  The number of clicks and registrations per day in 2020
b)  The number of clicks and registrations per click day in 2020
Explain in writing: What would be measured with a) and what with b)?
*/
SELECT COUNT(  informations.info_clicks) , users.user_registration_timestamp 
FROM informations
JOIN contacts  ON users.user_ID = contacts.contact_user_ID 
JOIN channels  ON channels.contact_channel_ID = channels.channel_ID 
JOIN informations ON channels.channel_ID= informations.info_channel_ID
WHERE informations. info_timestamp= ‘2020’
GROUP BY informations.info_timestamp:: DATE; 
/* I am using ::DATE to extract only dates with no time values like 20:23:12. So, this query only extracts the Date values.*/



 SELECT COUNT(  informations.info_clicks) , users.user_registration_timestamp 
FROM informations
JOIN contacts  ON users.user_ID = contacts.contact_user_ID 
JOIN channels  ON channels.contact_channel_ID = channels.channel_ID 
JOIN informations ON channels.channel_ID= informations.info_channel_ID
WHERE informations. info_timestamp= ‘2020’
GROUP BY informations.info_timestamp:: DATE, informations.info_clicks; 
/* I used the GROUP BY function to aggregate all of those results with passing two variable conditions. */
