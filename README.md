📊 Credit Risk Analysis & Business Impact Project
🎯 Project Overview

Financial institutions face a critical challenge in accurately assessing the creditworthiness of loan applicants, especially those with limited or non-traditional credit histories. Poor risk assessment leads to higher default rates, financial losses, and inefficient capital allocation.

This project focuses on analyzing historical loan data to:

Identify key drivers of loan default
Segment customers based on financial and behavioral risk
Generate actionable insights to improve lending decisions and reduce credit risk
🏗️ End-to-End Workflow
🔹 1. Data Acquisition (Cloud to Local)
Source: Home Credit dataset (cloud-based repository)
Processed 300,000+ customer records
Combined 7+ relational datasets (loan, bureau, payments, credit cards)
🔹 2. Data Storage & Management (SQL Server)
Loaded raw data into local SQL Server
Performed joins, aggregations, and cleaning
Outcome:
Created a single customer-level dataset
Final dataset: ~300K rows × 50+ features
🔹 3. Data Transformation & Feature Engineering
📌 Created 30+ business-relevant features:
Income-to-credit ratio
EMI-to-income ratio
Payment delay metrics
Loan approval behavior
Credit utilization patterns
📌 Null Handling Strategy:
~30% missing credit history data identified
Treated as first-time customers
Created flags for better segmentation
📊 Exploratory Data Analysis (EDA)
🔍 Key Business Findings & Impact
💰 1. EMI Burden → Major Risk Driver
Customers with EMI > Income:
Default Rate: 15.1%
Normal customers:
Default Rate: ~7.5%

👉 Insight:
High EMI burden increases default risk by ~2X

👉 Business Impact:

Avoiding such approvals can reduce defaults by ~7–8 percentage points
⏳ 2. Late Payment Behavior → Strongest Predictor
No late payments:
Default Rate: ~8%
Frequent late payments:
Default Rate: 18%+

👉 Insight:
Late payment behavior increases risk by >120%

👉 Business Impact:

Filtering high-delay customers can reduce risky approvals by 10–12%
💳 3. Loan Decision Behavior (Overpaid vs Balanced vs Underpaid)
Category	Default Rate
Overpaid	10.04%
Balanced	7.49%
Underpaid	6.12%

👉 Insight:
Over-financing increases default risk by ~35–40%

👉 Business Impact:

Restricting over-financed loans can reduce portfolio risk by ~2–3% overall
🏦 4. Credit History Impact
No credit history:
Default Rate: ~10–11%
With history:
Default Rate: ~7%

👉 Insight:
New customers are ~40–50% riskier

👉 Business Impact:

Introducing stricter checks for new users can reduce default exposure by ~3–4%
🔄 5. Active vs Closed Loan Behavior
Segment	Default Rate
High Risk (Active/No Closed)	10.8%
Balanced	7.9%
More Closed	7.6%

👉 Insight:
Customers without repayment history or with many active loans are significantly riskier

👉 Business Impact:

Prioritizing customers with successful loan closures can improve portfolio quality
📊 6. Income-Credit Ratio (Financial Stress Indicator)
Mid-range borrowers show highest default rates
High-ratio approvals show slightly lower risk due to stricter screening

👉 Insight:
Borrowers near financial limits are the most vulnerable

👉 Business Impact:

Optimizing approval thresholds can reduce defaults in the most sensitive segment
⚠️ Risk Segmentation (Business-Oriented)
🔹 Created Risk Indicators Based On:
Financial stress
Repayment behavior
Loan mismatch
Credit exposure
🔹 Key Outcome:
Segment	Risk Level	Default Rate
Low Risk	Stable	~5–6%
Medium Risk	Moderate	~7–8%
High Risk	Elevated	~9–10%
Critical Risk	Severe	10%+
📈 Overall Business Impact
📉 Risk Reduction Opportunities:
Reduce defaults by ~20–25% through better filtering
Identify top 15–20% high-risk customers before approval
Improve approval quality without reducing overall lending volume
💡 Strategic Recommendations:
Limit High EMI Loans
Cap EMI-to-income ratio
Prevent 2X default risk cases
Use Payment Behavior as Primary Filter
Prioritize customers with clean payment history
Control Over-Financing
Avoid approving loans significantly above requested value
Add Rules for First-Time Borrowers
Require stricter checks or lower exposure
Promote Customers with Good Closure History
Reward financially disciplined borrowers
🛠️ Tech Stack
SQL Server → Data storage & aggregation
Python (Pandas, NumPy, Matplotlib, Seaborn) → Analysis & EDA
🚀 Pipeline Summary

Cloud Data → SQL Server → Data Cleaning & Aggregation → Feature Engineering → Exploratory Data Analysis → Business Insights

🎯 Conclusion

This project demonstrates how raw financial data can be transformed into actionable business insights that directly impact credit risk management.

By identifying key drivers such as:

Payment behavior
Financial stress
Loan structuring

the analysis enables data-driven decision-making, helping financial institutions:

Reduce default rates
Improve portfolio quality
Optimize lending strategies
👨‍💻 Author

[Sarbajoy Ghatak]
Aspiring Data Analyst
