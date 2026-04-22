drop database paytm;
 create database funnel;
 use funnel;
 
 select * from customer_journey;
 
 -- How many total users are there?
 
 select count( distinct userid) as  total_users from customer_journey;
 
 -- What is the average time spent ?
 
 select  avg(TimeOnPage_seconds ) as avg_time_spent from customer_journey;
 
 -- which device type is most used?
 
 select devicetype, count(*) as total  from customer_journey
 group by devicetype
 order by total desc 
 limit 1;
 
 -- which referral sources brings most users?
 
 select ReferralSource , count(*) as total_users from customer_journey
 group by referralsource
 order by total_users desc
 limit 1;
 
 -- what is the conversion rate?
 
 select count(distinct case when purchased = 1 then sessionid end)* 100.0/
 count(distinct sessionid) as conversion_rate
 from customer_journey;
 
 -- funnel drop-off 
 
 select pagetype, count(distinct sessionid) as users
 from customer_journey
 group by pagetype
 order by users desc;
 
 -- what % of users who add to cart actually purchase?
 
 select count(distinct case when itemsincart >= 1 then sessionid end)*100.0/
 count(distinct case when purchased = 1 then sessionid end) as cart_to_purchase_rate
 from customer_journey;
 
 -- how many sessions end without reaching product page?
 
 select count(distinct case when pagetype <> "product_page" then sessionid end )  
 as sessions_not_reaching_product_page
 from customer_journey;
 
 -- types of devices
 
 select distinct devicetype , count(devicetype) as total from customer_journey
 group by devicetype;
 
 -- what is the highgest time spent?
 
 select max(TimeOnPage_seconds) as highest_time_spent from customer_journey;
 
 -- From which country maximum users are there?
 
 select country , count(*) as total from customer_journey
 group by country
 order by total desc 
 limit 1;
 
 -- users categorized by countries
 
 select country,  count(distinct userid) as total_users  from customer_journey
group by country 
order by total_users desc;

-- which country has maximum purchases?

select country , count( * ) as total_purchases from customer_journey
where purchased = 1
group by country
order by total_purchases desc
limit 1 ;

-- total session per user

select distinct userid , count(sessionid) as total_sessions from customer_journey
group by userid;
 
 
 
 
 
 
 