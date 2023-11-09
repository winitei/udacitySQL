/*Q6.What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, than the average of all orders.*/
WITH t1 AS (
		    SELECT AVG(o.total_amt_usd) avg_all
             FROM orders AS o
             ORDER BY 1 DESC),        
	  t2 AS(SELECT o.account_id, AVG(o.total_amt_usd)avg_amt
            FROM orders AS o
            GROUP BY 1
            HAVING AVG(o.total_amt_usd)>(SELECT*
										 FROM t1))
SELECT AVG(avg_amt)
FROM t2;
			
		

