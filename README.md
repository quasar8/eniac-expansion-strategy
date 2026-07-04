# E-Commerce Market Expansion Analysis: Evaluating Eniac's Strategic Partnership with Magist

## 📌 Project Overview
This project evaluates the strategic 3-year expansion plan of **Eniac** (a prominent European e-commerce site specializing in premium Apple-compatible accessories) into the Brazilian market. To bypass logistical bureaucracy, Eniac is considering a partnership with **Magist**, a Brazilian SaaS company handling logistics and marketplace integrations. By exploring a snapshot of Magist’s SQL database, this analysis evaluates whether Magist can support high-end technology products and meet Eniac's strict fast-delivery performance benchmarks to safeguard brand equity.

---

## 🔍 Business Challenges & Core Objectives
Eniac’s board demanded expansion within a year, but internal stakeholders raised two major concerns that this data-driven investigation aims to solve:
1. **Product Fit & Portfolio Alignment:** Eniac’s catalog consists 100% of high-end tech products. *Does Magist's platform currently attract tech buyers, and can it support premium-priced items?*
2. **Delivery Performance Risk:** Fast delivery is vital for Eniac's customer satisfaction. Magist relies on the public Post Office. *Are their delivery speeds fast and reliable enough for premium consumer expectations?*

---

## 📊 Dataset & Sources
* **Source:** Magist E-Commerce Database Snapshot (WBS Coding School Internal Data)
* **Size:** 99,441 orders, 48 features across 9 relational tables
* **Time Period:** September 2016 - October 2018 (2 years 1 month)
* **Key Features Explored:** Customer demographics and location, product categories and specifications, Order lifecycle and delivery dates, seller information, payment methods and transaction values, customer review scores, geographic data (city, state, coordinates)
* **Notes:** Screened out canceled orders to focus on completed lifecycles, and mapped Portuguese category names to English for precise tech-sector filtering.

---

## 💡 Key Findings & Business Insights

### 1. Technology Market & Pricing Misalignment
* **Low Tech Penetration:** High-end tech products represent a mere **3.29% of total sales** across the platform, indicating a limited existing customer base for Eniac's core catalog.
* **Severe Price Discrepancy:** The average tech product price on Magist is only **$120.65**, which is heavily concentrated in the low-price range (< €500). 
* **Premium Benchmarking:** This average price is roughly **7x lower** than the benchmark price of core premium hardware of the era (e.g., an iPhone in 2018 retailed at around \$849), demonstrating that Magist's user base is not accustomed to high-ticket electronics.

### 2. Delivery Speeds & Regional Bottlenecks
* **Strong Baseline Performance:** On average, **93% of deliveries are completed on time**, showing general infrastructure stability.
* **Competitive Advantage:** Magist boasts an average delivery time of **12 days**, which heavily outperforms the wider Brazilian e-commerce market average of **21 days** (via Statista, March 2020).
* **Critical Regional Risks:** Despite strong general metrics, severe delivery delays and localized issues persist in critical geographic locations, presenting isolated supply chain risks.

---

## 🚀 Strategic Recommendations for Eniac's Leadership
* **Proceed with Caution (Due Diligence Required):** Magist offers a viable logistical gateway to enter Brazil quickly, but significant structural risks remain.
* **Pivot to Mid-Range Tech or Establish Premium Sub-Brands:** Due to the remarkably low sales volume of high-end, premium tech products on the platform, Magist is currently perceived as a budget-to-mid-range marketplace. To attract high-ticket electronics like Eniac's catalog, Magist must either invest heavily in a dedicated, high-trust "Premium Tech" sub-vertical with specialized customer service, or Eniac should initially launch only its mid-tier product lines to test market appetite.
* **Geographic Mitigation:** Before signing the 3-year contract, negotiate specific Service Level Agreements (SLAs) with Magist to mitigate the identified delivery issues in high-risk regional zones.

---

## 🛠️ Technologies Used
* **Database Querying & Extraction:** SQL (MySQL Workbench)
* **Visualizations & Storytelling:** Tableau
* **Environment:** MySQL Client / Tableau Desktop

---

## 📁 Repository Structure
* `eniac_magist_presentation.pdf`: The finalized corporate presentation delivered to executive leadership summarizing methodology, code insights, and strategic outcomes.

---

## 📈 Key Visualizations

### 1. Product Category Trends
![Tech Product Sales Trends](images/tech_trends.png)  
*This visualization demonstrates Magist's reliable overall order growth across key tech categories (telephony, electronics, computers_accessories) since January 2017, maintaining a stable 51% YoY growth and a 4.1/5 average rating.*

### 2. Tech Product Price Distribution
![Tech Product Popularity by Price Range](images/price_distribution.png)  
*This chart highlights the primary business bottleneck: a massive concentration of sales lies below the €500 threshold (31,466 units), proving a lack of existing traction for high-end premium products.*

### 3. Delivery Performance Breakdown
![Delivery On-Time Status](images/delivery_performance.png)  
*A breakdown confirming that while 93% of orders are delivered safely on time, critical logistics delays are concentrated in specific volatile territories.*

---

## ⏱️ How to Review This Project
1. **Executive Summary:** Open and review `eniac_magist_presentation.pdf` directly in the browser to see the strategic slides prepared for the Head of Eniac.
2. **SQL Infrastructure:** Review the source queries folder (if applicable) to see the exact joins, aggregations, and performance filters utilized to pull these metrics.

---

## 🔮 Future Work
* **Predictive Delay Modeling:** Build a machine learning classification model to predict which customer zip codes are most prone to shipping delays.
* **Basket Analysis:** Perform market basket analysis to see which lower-priced items are frequently bought together to see if Eniac accessories can be bundled.

---

## ✉️ Contact
* **Name:** Şafak Koçlu
* **Email:** safak.koclu@example.com *(E-posta adresini güncelleyebilirsin)*
* **LinkedIn:** [linkedin.com/in/safakkoclu](https://linkedin.com) *(Kendi LinkedIn linkini koyabilirsin)*
