WITH monthly_revenue AS (
    select
    	date(date_trunc('month', payment_date)) AS payment_month,
        user_id,
        game_name,
        SUM(revenue_amount_usd) AS total_revenue
    FROM project.games_payments gp
    GROUP BY  user_id, game_name, payment_month
),

 payment_months as (
select 
	mr.payment_month,
	mr.user_id,
	mr.game_name,
	mr.total_revenue,
	lag(payment_month) OVER (partition BY user_id ORDER BY payment_month)  AS previous_paid_month,
	lead(payment_month) OVER (partition BY user_id ORDER BY payment_month) AS next_paid_month,
	lag(total_revenue) OVER (partition BY user_id ORDER BY payment_month) AS previous_paid_month_revenue,
	
	date(payment_month - interval '1' month) as previous_calendar_month,
	date(payment_month + interval '1' month) as next_calendar_month

	from monthly_revenue mr
),	
metrics as (
select 
	payment_month AS month,
	game_name,
	mr.total_revenue,
	 -- Expansion і Contraction
	 CASE 
            WHEN previous_paid_month = previous_calendar_month AND total_revenue > previous_paid_month_revenue 
            THEN total_revenue - previous_paid_month_revenue
        END AS expansion_mrr,
        
        CASE 
            WHEN previous_paid_month = previous_calendar_month AND total_revenue < previous_paid_month_revenue 
            THEN previous_paid_month_revenue - total_revenue
        END AS contraction_mrr,
        
    CASE WHEN previous_paid_month IS NULL THEN total_revenue
              END AS new_mrr,
              
	CASE WHEN previous_paid_month IS NULL THEN 1
              END AS new_paid_users,  
     
              -- Churned Users і Churned Revenue
	CASE WHEN next_paid_month IS NULL
                     OR next_paid_month != next_calendar_month THEN total_revenue
              END AS churned_revenue,
        
	CASE WHEN next_paid_month IS NULL
                     OR next_paid_month != next_calendar_month THEN 1
              END AS churned_users
   FROM payment_months
   )
select* FROM metrics;
