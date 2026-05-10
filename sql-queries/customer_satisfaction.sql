SELECT
Ticket_Type,
COUNT(*) AS Total_Tickets,

ROUND(
	AVG(Customer_Satisfaction_Rating),
	2
) AS Avg_Customer_Satisfaction

FROM dbo.customer_support_tickets

WHERE Customer_Satisfaction_Rating IS NOT NULL
GROUP BY Ticket_Type
ORDER BY Avg_Customer_Satisfaction DESC;
