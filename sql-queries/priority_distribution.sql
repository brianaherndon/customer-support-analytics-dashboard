SELECT
	Ticket_Priority,
	COUNT(*) AS Total_Tickets,

	ROUND(
		COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
		2
	) AS Percentage_of_Total_Tickets,

	ROUND(
		AVG(Customer_Satisfaction_Rating),
		2
	) AS Avg_Customer_Satisfaction

FROM dbo.customer_support_tickets
WHERE Ticket_Priority IS NOT NULL
GROUP BY Ticket_Priority
ORDER BY Total_Tickets DESC;