SELECT Ticket_Type,
COUNT(*) AS Total_Tickets,

ROUND(
	COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
	2
) AS Percentage_of_Total_Tickets

FROM dbo.customer_support_tickets
GROUP BY Ticket_Type
ORDER BY Total_Tickets DESC;