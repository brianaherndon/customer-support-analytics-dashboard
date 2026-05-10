# Customer Support & Operational Performance Dashboard

## Project Description

This project analyzes customer support ticket data to identify trends in issue types, ticket distribution by channel, and customer satisfaction. The goal was to uncover operational inefficiencies and provide insights to improve business workflow and overall customer experience.

---

## Tools Used

- SQL (data querying)
- Power BI (dashboard)
- Microsoft Excel (data cleaning)

---

&nbsp;

# Key Insights

## 1. Ticket Volume Concentrated Areas

### Insight

Refund requests and technical issues represented the highest share of support tickets, indicating that customer support demand was concentrated around a small number of recurring issue categories.

### Business Impact

This suggests opportunities to:

- Improve product documentation
- Streamline refund workflows
- Reduce repetitive support requests through automation or self-service resources

### Calculating Concentration & Contribution Percentages

Formula:

(Ticket_Type / Total Ticket_Count) \* 100

### SQL Script

```sql
SELECT
    Ticket_Type,
    COUNT(*) AS Total_Tickets,

    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS Percentage_of_Total_Tickets

FROM dbo.customer_support_tickets

GROUP BY Ticket_Type

ORDER BY Total_Tickets DESC;
```

## 2. Customer Satisfaction by Ticket Type

### Insight

Average customer satisfaction scores differed across ticket categories, showing that some issue types resulted in more positive customer experiences than others.

### Business Impact

This can help support teams:

- Identify pain points in the customer journey
- Prioritize process improvements for low-satisfaction categories
- Allocate resources toward high-friction support areas

### SQL Script

```sql
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
```

## 3. Support Channel Customer Preferences

### Insight

Support traffic was evenly distributed across communication channels, with chat demonstrating the highest customer satisfaction scores among all support methods.

### Business Impact

This insight can guide:

- Staffing decisions
- Channel optimization
- Faster response strategies for heavily used support channels

### SQL Script

```sql
SELECT
	Ticket_Channel,
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
WHERE Ticket_Channel IS NOT NULL
GROUP BY Ticket_Channel
ORDER BY Total_Tickets DESC;
```

## 4. Priority Distribution Helped Identify Operational Focus Areas

### Insight

Ticket demand was evenly distributed across priority levels, while critical-priority cases showed slightly lower customer satisfaction compared to low-priority issues.

### Business Impact

This suggests opportunities to:

- Improve escalation workflows
- Monitor operational risk areas

### SQL Script

```sql
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
```

## 5. Ticket Status Monitoring Improved Visibility into Workflow Performance

### Insight

Ticket workflow volume remained evenly distributed across open, pending, and closed cases, highlighting the importance of efficient resolution processes to improve customer experience outcomes.

### Business Impact

This allows teams to:

- Monitor support backlog trends
- Identify workflow inefficiencies

### SQL Script

```sql
SELECT
	Ticket_Status,
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
WHERE Ticket_Status IS NOT NULL
GROUP BY Ticket_Status
ORDER BY Total_Tickets DESC;
```

&ensp;

# How to Open the Power BI Dashboard

Before opening the dashboard, please ensure the following are installed:

- Microsoft Power BI Desktop
- Access to the provided CSV dataset file

---

# Files Included

- `Customer_Support_Analytics_Dashboard.pbix`
- `customer_support_tickets.csv`

---

# Setup Instructions

## Step 1 — Download the Files

Download both:

- the `.pbix` Power BI dashboard file
- the `.csv` dataset file

Place both files in the same local folder on your computer.

---

## Step 2 — Open Power BI Dashboard

Open:

`Customer_Support_Analytics_Dashboard.pbix` using Microsoft Power BI Desktop.

---

## Step 3 — Reconnect the Dataset (if prompted)

If Power BI prompts for a missing data source:

1. Click:
   `Transform Data`
   or
   `Edit Queries`

2. In Power Query:
   - Select the dataset source
   - Choose:
     `Change Source`

3. Browse to:
   `customer_support_tickets.csv`

4. Select the CSV file and confirm.

---

## Step 4 — Apply Changes

After reconnecting the dataset:

1. Click:
   `Close & Apply`

2. Wait for the dashboard to refresh.

---

# Notes

- The dashboard was built using Power BI Desktop.
- All visualizations and SQL-based business insights are included within the dashboard.
- No external database connection is required once the CSV file is reconnected.
