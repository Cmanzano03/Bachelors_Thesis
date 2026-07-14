# Educational Data Mining: Student Dropout Prediction

This repository contains the data engineering pipeline and machine learning models developed to predict student dropout in virtual learning environments (LMS), project developed as my bachelor thesis. By analyzing Moodle interaction logs and academic records, this project provides the study of a early warning system to identify at-risk students and discover behavioral patterns associated with course abandonment.

## 🧠 Architecture & Tech Stack

The project implements a complete end-to-end data science lifecycle, from data extraction to model evaluation:

*   **Data Processing:** Apache Spark (PySpark), Pandas, MySQL.
*   **Machine Learning:** Scikit-Learn, XGBoost, TensorFlow/Keras, Imbalanced-learn.
*   **Data Visualization:** Matplotlib, Seaborn.

## ⚙️ Data Pipeline

1.  **Extraction & Anonymization:** Raw operational data was extracted from a MySQL database containing Moodle records. To comply with GDPR and data minimization principles, sensitive identifiers (`userid`) were anonymized using SHA-256 hashing before leaving the university's secure data center.
2.  **ETL (Extract, Transform, Load):** Apache Spark was utilized to handle large-scale data transformations efficiently. The logs and academic activities (assignments, quizzes, VPL submissions) were parsed and aggregated into unified Parquet datasets.
3.  **Feature Engineering:** Features were engineered focusing on the temporal dimension, capturing metrics such as the maximum consecutive days without access, frequency of logins per month, and continuous evaluation averages.
4.  **Modeling:** Addressed extreme class imbalance using SMOTE (Synthetic Minority Over-sampling Technique). Classifiers including Logistic Regression, Decision Trees, Neural Networks (MLP), and Gradient Boosting (XGBoost) were optimized via Random Search and evaluated using Stratified K-Fold Cross-Validation.

## 📊 Key Results

The models were evaluated across different observation windows to balance early detection capability with predictive accuracy. 

*   **Best Performing Model:** XGBoost algorithm.
*   **Optimal Metrics:** Achieved an **F1-Score of 0.706**, Precision of 0.600, Recall of 0.857, and an AUC-ROC of 0.840.
*   **Insights:** Sustained interaction (consecutive days accessing the platform) and completion of late-semester assignments were identified as the strongest indicators of student retention.

## 🚀 Local Setup

To replicate the environment locally in Linux or MacOS the following steps are required (Data not available due to GDPR):

```bash
# Clone the repository
git clone [https://github.com/Cmanzano03/TFG_cmi_Moodle.git](https://github.com/Cmanzano03/TFG_cmi_Moodle.git)
cd TFG_cmi_Moodle

# Create and activate the virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt