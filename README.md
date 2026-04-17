📊 Credit Risk Analysis & Default Prediction Project
🎯 Project Overview

Financial institutions face significant challenges in accurately assessing the creditworthiness of loan applicants, especially those with limited or non-traditional credit histories. Poor risk assessment can lead to increased default rates and financial losses.

This project aims to analyze historical loan data to:

Identify key drivers of loan default
Segment customers based on risk
Build a predictive model for default probability
Deliver actionable insights through an interactive dashboard
🏗️ End-to-End Workflow
🔹 1. Data Acquisition (Cloud to Local)
The dataset was sourced from a cloud-based repository (Home Credit dataset).
Data consisted of multiple relational tables:
Customer demographics
Loan applications
Bureau (credit history)
Credit card usage
Installment payments
Process:
Downloaded raw data from cloud storage
Stored locally for processing
Loaded into SQL Server for structured querying
🔹 2. Data Storage & Management (SQL Server)
Imported all datasets into a local SQL Server database
Designed a structured schema to manage multiple tables
Key Operations:
Data cleaning (handling NULLs, duplicates)
Table joins using primary keys (SK_ID_CURR)
Aggregations using:
GROUP BY
SUM, AVG, COUNT
Outcome:

Created a master customer-level dataset (1 row per customer)

🔹 3. Data Transformation & Feature Engineering (SQL + Python)
📌 Aggregated Features:
Total loans, active loans, closed loans
Total credit, total debt, overdue amounts
Average payment behavior
Previous application statistics
📌 Engineered Features:
Income-to-credit ratio
EMI-to-income ratio
Payment stress indicators
Credit experience level
Late payment behavior
Loan mismatch indicators
📌 Null Handling Strategy:
Missing bureau/credit data treated as:
First-time customers
Created flags:
no_credit_history_flag
no_credit_card_usage_flag
🔹 4. Exploratory Data Analysis (EDA)

Performed using Python:

Pandas
NumPy
Matplotlib
Seaborn
🔍 Key Analyses:
💰 Financial Behavior
Income vs Loan Amount
EMI burden vs Default
Loan size segmentation
📉 Risk Indicators
Late payment behavior
Payment delays
Underpayment trends
🏦 Credit Behavior
Active vs Closed loans
Credit history availability
Approval history
📊 Key Insights:
High EMI burden → significantly higher default
Late payments → strongest predictor of risk
Over-financed loans → higher default probability
No credit history → higher uncertainty and risk
🔹 5. Risk Feature Engineering

Created binary risk indicators:

risk_income_credit_ratio
risk_late_payment
risk_goods_mismatch
risk_annuity
risk_payment_stress
risk_large_loan
🔹 6. Risk Scoring System
Combined all risk indicators into a financial risk score
Segmented customers into:
Low Risk
Medium Risk
High Risk
Very High Risk
Insight:

Default rate increases consistently with risk score

🔹 7. Machine Learning Model
Models Used:
Logistic Regression
Random Forest
Gradient Boosting
Steps:
Data preprocessing
Train-test split
Model training
Evaluation
Metrics:
Accuracy
Precision
Recall
ROC-AUC
Outcome:
Built a predictive model to estimate default probability
Identified key drivers:
Payment behavior
Financial stress
Credit utilization



This project enables:

Better credit risk assessment
Data-driven loan approval decisions
Early identification of high-risk customers
Improved financial stability for lenders
🛠️ Tech Stack
SQL Server → Data storage & transformation
Python (Pandas, NumPy, Matplotlib, Seaborn) → EDA & feature engineering
Machine Learning (Scikit-learn) → Model building
Power BI → Dashboard & visualization
🚀 How to Run the Project
Load raw datasets into SQL Server
Run SQL scripts to create aggregated dataset
Export dataset to Python for EDA and modeling
Generate predictions and engineered features
Import final dataset into Power BI
Build dashboard using measures and visuals
🎯 Conclusion

This project demonstrates a complete end-to-end data analytics and machine learning pipeline, transforming raw financial data into actionable business insights and predictive intelligence.

It highlights the integration of:

Data engineering
Data analysis
Machine learning
Business intelligence

to solve a real-world credit risk problem.

📌 Future Improvements
Deploy model using API (Flask/FastAPI)
Real-time scoring system
Integration with live banking systems
Advanced models (XGBoost, LightGBM)
Automated retraining pipeline
👨‍💻 Author

Sarbajoy Ghatak
Aspiring Data Analyst / Data Scientist
