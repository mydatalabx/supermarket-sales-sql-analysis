# Supermarket Sales Analysis (Excel, SQL & Tableau)

## Overview
This project analyses supermarket transaction data to identify key revenue drivers, customer behaviour patterns, and product performance across branches.

The workflow includes data cleaning, SQL-based analysis, and dashboard visualisation in Tableau.

---

## Objectives
- Analyse revenue performance by branch  
- Understand customer type behaviour (Member vs Normal)  
- Evaluate product line performance  
- Explore payment method distribution  
- Compare customer satisfaction across branches  

---

## Tools Used
- Excel — data cleaning and preparation  
- SQL — data analysis and aggregation  
- Tableau — dashboard creation and visualisation  

---

## Dataset
The dataset contains supermarket transaction records including:
- Branch  
- City  
- Customer Type  
- Product Line  
- Total Sales  
- Payment Method  
- Rating  

---

## Key Insights
- Giza is the highest revenue-generating branch  
- Members spend more than normal customers  
- Food & Beverages is the top-performing product line  
- Customer satisfaction varies across branches  
- Payment methods differ by branch, with cash contributing the highest revenue  

---

## Dashboard
![Dashboard](dashboard/Dashboard 1.png)

---

## SQL Analysis
Sample query:

```sql
SELECT branch, SUM(total) AS revenue
FROM sales
GROUP BY branch
ORDER BY revenue DESC;
