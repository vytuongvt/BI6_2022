--Câu 1
--2
select *
from dbo.user_table as u
join
dbo.order_table as o
on u.user_id=o.user_id
where user_segment = 'Whale' and o.product_cate_id = '1' and o.order_date between '2021-04-30' AND '2021-06-01';

--3
SELECT product_cate_id, COUNT(product_cate_id) AS count, sum(order_value) as 'sum_order'
FROM dbo.order_table
WHERE order_date between '2021-07-31' AND GETDATE()
GROUP BY product_cate_id

SELECT user_segment, COUNT(user_segment) As count, sum(order_value) as 'sum_order'
FROM dbo.order_table as o, dbo.user_table as u
wHERE u.user_id = o.user_id and o.order_date between '2021-07-31' AND GETDATE()
GROUP BY  user_segment;

--4
WITH loc AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY  A.location ORDER BY A.sum) AS rank
FROM (
SELECT us.user_id, COUNT( us.user_id) As sum, us.location as location
FROM dbo.order_table as od join dbo.user_table as us
on us.user_id = od.user_id and  od.order_date between  '2021-06-30' AND '2021-08-01'
GROUP BY  us.user_id, us.location
) as A
)
SELECT * FROM loc WHERE rank =2;

SELECT us.user_id, COUNT( us.user_id) As sum, us.location as location
FROM dbo.order_table as od join dbo.user_table as us
on us.user_id = od.user_id and  od.order_date between  '2021-06-30' AND '2021-08-01'
GROUP BY  us.user_id, us.location;

--5
WITH Order_in_May AS 
(
    SELECT 
        *,
        ROW_NUMBER () OVER (PARTITION BY  user_id order by order_date ) AS "Order_in_May"            
    FROM order_table 
)

SELECT user_id, order_date, order_value 
FROM Order_in_May
WHERE Order_in_May = 1 and order_date between  '2021-04-30' AND '2021-06-01';


--6 


SELECT user_table.user_segment,order_table.order_date,
	SUM(COUNT(order_table.order_date)) OVER (PARTITION BY user_table.user_segment ORDER BY order_table.order_date) AS "Lũy Tiến"
FROM user_table
JOIN order_table
ON user_table.user_id = order_table.user_id
GROUP BY user_table.user_segment,order_table.order_date
ORDER BY user_table.user_segment,order_table.order_date


--7

WITH Occurences AS 
(
    SELECT 
        *,
        ROW_NUMBER () OVER (PARTITION BY  user_id order by order_date ) AS "Occurence"            
    FROM order_table
)

select a.s, AVG(a.date_distance) as avg_time 
from (
SELECT first.segment as s, second.user_id, second.order_date AS second_order, first.first_order, DATEDIFF(DAY, first.first_order,second.order_date) as date_distance
FROM Occurences as second
JOIN  (SELECT u.user_id as userId, MIN(order_date) as 'first_order', u.user_segment as segment
FROM Occurences as o join user_table as u on o.user_id = u.user_id
WHERE o.Occurence = 1
GROUP BY u.user_id,  u.user_segment
) as first on second.user_id = first.userId
WHERE Occurence = 2 ) as a
group by a.s
;



