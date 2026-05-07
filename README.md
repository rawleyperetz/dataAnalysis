# dataAnalysis

## IBM_Telco Dataset and Code
# Customer Churn Analysis
**Tools:** Python, pandas, scikit-learn  
**Dataset:** [IBM Telco Customer Churn](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

---

## Business Problem

Customer churn is one of the most costly problems a telecom company faces — acquiring a new customer is significantly more expensive than retaining an existing one. This project identifies which customers are most likely to churn and what factors drive that behaviour, with the goal of informing targeted retention strategies.

---

## Approach

1. **Exploratory Data Analysis** — examined churn rates across contract type, tenure, payment method, and demographics using pivot tables and visualisations
2. **Preprocessing** — one-hot encoded categorical variables, handled missing values in `TotalCharges`, and dropped non-predictive identifier columns
3. **Modelling** — trained a logistic regression classifier on an 75/25 train-test split with standard scaling

---

## Key Findings

- **Contract type is the strongest churn predictor** — month-to-month customers churn at a far higher rate than those on one or two year contracts
- **Tenure is inversely correlated with churn** — customers in their first 12 months are at the highest risk
- **High monthly charges correlate with churn** — customers on premium plans without long-term contracts are a high-risk segment
- **Senior citizens and customers without dependents** churn at slightly higher rates

---

## Model Performance

| Metric | Non-Churn (0) | Churn (1) |
|---|---|---|
| Precision | 0.86 | 0.69 |
| Recall | 0.90 | 0.59 |
| F1 Score | 0.88 | 0.63 |

**Overall accuracy: 82%**

### Confusion Matrix

|  | Predicted: No Churn | Predicted: Churn |
|---|---|---|
| **Actual: No Churn** | 1168 | 123 |
| **Actual: Churn** | 193 | 274 |

The model correctly identified 274 out of 467 actual churners (59% recall). The 193 missed churners (false negatives) represent the highest business risk — customers who will leave without being flagged for intervention.

---

## Recommendations

- **Incentivise annual contracts** at the point of signup — this is the single highest-leverage retention lever identified
- **Target month-to-month customers in their first year** with proactive outreach or loyalty offers, as this is the highest-risk cohort
- **Review pricing for high-charge, short-tenure customers** — this segment shows elevated churn and may respond to loyalty discounts
- **Improve model recall for churners** in future iterations using SMOTE or a tree-based model (e.g. Random Forest, XGBoost) to better capture the minority churn class

---

## Limitations

- Accuracy alone is a misleading metric here due to class imbalance (~26% churn rate)
- The model currently misses 41% of actual churners — acceptable for a baseline but improvable
- Logistic regression assumes linear relationships; a non-linear model may capture more complex patterns







My data Analysis journey. Web Scraping 101.

This exercise can be found at: https://bookdown.org/dereksonderegger/444/data-scraping.html

Web Scraping with RVest and RedditExtractoR, author of website explained very good.
