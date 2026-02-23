# Statistical Inference and PCA Analysis

This repository contains a rigorous statistical analysis performed on various datasets (including the Palmer Penguins dataset) as part of my Data Science studies. The project focuses on dimensionality reduction techniques and statistical validation methods.

## 📁 Project Structure
- **Dimensionality Reduction:** Principal Component Analysis (PCA) to identify key variance drivers.
- **Statistical Testing:** Implementation of t-tests (paired and independent) and Chi-square tests.
- **Model Evaluation:** Performance analysis using Confusion Matrices and ROC/AUC curves.
- **Anomaly Detection:** Outlier identification using Grubbs' Test.

## 🚀 Key Insights
- **PCA Significance:** Demonstrated the importance of data standardization; without it, features with larger scales (e.g., body mass) disproportionately influenced the principal components.
- **Classification:** Evaluated diagnostic test accuracy with an AUC of 0.70, highlighting the trade-off between sensitivity and specificity.
- **Environmental Data:** Identified significant pollutants in water samples through iterative outlier detection.

## 🛠 Tech Stack
- **Language:** R
- **Key Libraries:** `stats`, `outliers`, `ggplot2`, `factoextra`
