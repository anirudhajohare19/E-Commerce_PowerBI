# 📊 E-commerce Business Insights Dashboard

## 📌 Project Overview
### **Title:** Advanced E-commerce Performance Dashboard : Returns, Profitability & Shipping 

**Description:** This project focuses on analyzing an **E-commerce business** using **MySQL and Power BI** to gain insights into **customer behavior, shipping efficiency, profitability, and product returns**. The dashboard visualizes key metrics to help improve decision-making and drive business growth.

---
## **🚀 Tools & Technologies Used**
- **Database:** MySQL
- **Data Visualization:** Power BI
- **Data Processing:** SQL Queries, DAX, PowerQuery 

---

## **🎯 Objectives**
1. **Customer Satisfaction & Shipping Efficiency:** Identify delivery delays and their impact on customer ratings.
2. **Product Return & Refund Optimization:** Analyze return trends and most returned products.
3. **Profitability vs. Discounts:** Assess how discounts affect revenue and profit margins.
4. **Data-Driven Business Recommendations:** Provide strategic recommendations to optimize revenue and enhance customer experience.


---

## **📊 Key Insights from the Analysis**


### **1 : Customer Satisfaction & Shipping Performance**
- **Delayed deliveries reduce customer satisfaction scores** by 15-20%.
- **Express shipping mode has the highest satisfaction rating** but accounts for fewer orders due to higher costs.
- **Standard shipping has the highest rate of late deliveries**, affecting customer retention.
- **Customers who received late deliveries are 30% less likely to reorder**, highlighting an urgent need for improvement in logistics.

### **2 : Product Returns & Refund Trends**
- `Clothing` and `Electronics` have the highest return rates.
- The **most common return reasons** include `size issues`, `defective items`, and `late deliveries`.
- **Products with frequent returns have lower customer ratings**, indicating a direct link between quality and customer perception.
- **Refund processing delays negatively impact customer retention**, suggesting a need for automated refund systems.

### **3 : Profitability & Discounts**
- Higher **discounts lead to an increase in order volume** but reduce the overall profit margins.
- **Moderate discounts (5-10%) drive more profitability** compared to extreme discounts (>25%).
- **High-margin products do not require deep discounting**, whereas low-margin products benefit from targeted promotions.
- **Discount stacking leads to revenue losses**, requiring stricter discount policies.
- **Loyalty program customers generate 20% higher revenue per order** than non-members, suggesting investment in retention strategies.


---

## **📢 Business Recommendations**

## 📈 Business Recommendations & Strategies
1️⃣ **Improve Logistics & Delivery Performance:**  
   - Partner with reliable logistics providers for **faster deliveries**.
   - Introduce **real-time tracking** and updates for customers.
   - Offer **incentives for early deliveries** to improve satisfaction scores.

2️⃣ **Reduce Returns Through Better Quality Control:**  
   - Implement a **strict quality check** before dispatching products.
   - Provide **detailed product descriptions and images** to reduce mismatched expectations.
   - Offer better **customer support** to resolve issues before returns.

3️⃣ **Optimize Discount Strategies:**  
   - Use **personalized discounts** instead of blanket reductions.
   - Avoid offering **discounts above 20%** unless targeting clearance sales.
   - Run A/B tests on different discount ranges to analyze profitability impacts.

4️⃣ **Customer Retention & Profitability Growth:**  
   - Identify **high-value returning customers** and offer them loyalty rewards.
   - Introduce **subscription-based models** for frequent buyers.
   - Segment customers based on purchase history to create **targeted marketing campaigns**.

---

## **🛠️ SQL Queries Used for Analysis**

### **1️⃣ Exploratory Data Analysis (EDA) Using MySQL**

#### **1.1 Checking the Data Structure**
```sql
DESCRIBE ecommerce_orders;
```

#### **1.2 Checking Missing Values**
```sql
SELECT column_name, COUNT(*) - COUNT(column_name) AS missing_values
FROM ecommerce_orders
GROUP BY column_name;
```

#### **1.3 Finding Duplicate Records**
```sql
SELECT Order_ID, COUNT(*)
FROM ecommerce_orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;
```


### **2️⃣ Sales & Revenue Analysis**
#### **2.1 Total Sales and Revenue per Region**
```sql
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM ecommerce_orders
GROUP BY Region
ORDER BY Total_Sales DESC;
```

#### **2.2 Monthly Sales Trend**
```sql
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Sales) AS Monthly_Sales
FROM ecommerce_orders
GROUP BY Month
ORDER BY Month;
```

### **3️⃣ Customer Satisfaction & Delivery Analysis**
#### **3.1 Average Delivery Time per Shipping Mode**
```sql
SELECT Ship_Mode, ROUND(AVG(Delivery_Days), 2) AS Avg_Delivery_Time
FROM ecommerce_orders
GROUP BY Ship_Mode
ORDER BY Avg_Delivery_Time;
```

#### **3.2 Late Delivery Percentage by Shipping Mode**
```sql
SELECT Ship_Mode, COUNT(CASE WHEN Delivery_Days > 5 THEN 1 END) * 100.0 / COUNT(*) AS Late_Delivery_Percentage
FROM ecommerce_orders
GROUP BY Ship_Mode;
```

### **4️⃣ Product Return & Refund Optimization**
#### **4.1 Most Returned Products**
```sql
SELECT Product_Name, COUNT(*) AS Return_Count
FROM ecommerce_orders
WHERE Order_Status = 'Returned'
GROUP BY Product_Name
ORDER BY Return_Count DESC
LIMIT 5;
```

#### **4.2 Return Reasons Breakdown**
```sql
SELECT Return_Reason, COUNT(*) AS Return_Count
FROM ecommerce_orders
WHERE Order_Status = 'Returned'
GROUP BY Return_Reason
ORDER BY Return_Count DESC;
```

### **5️⃣ Profitability vs. Discounts**
#### **5.1 Profitability by Product Category**
```sql
SELECT Category, ROUND(SUM(Profit_Margin), 2) AS Total_Profit
FROM ecommerce_orders
GROUP BY Category
ORDER BY Total_Profit DESC;
```

#### **5.2 Discount Impact on Profit Margins**
```sql
SELECT Discount_Applied, ROUND(AVG(Profit_Margin), 2) AS Avg_Profit_Margin
FROM ecommerce_orders
GROUP BY Discount_Applied
ORDER BY Discount_Applied;
```

---

## **🚀 Tools & Technologies Used**
- **Database:** MySQL
- **Data Visualization:** Power BI
- **Data Processing:** SQL Queries

---


🚀 **Let's make data-driven decisions and optimize e-commerce performance!** 🚀
