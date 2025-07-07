# 🚢 Titanic Survivor Analytics: End-to-End Data Science & BI Project

This project explores the Titanic dataset using a full data pipeline — from cleaning and EDA to SQL analysis, Power BI dashboarding, and ML prediction of survival.

## 🔄 Project Workflow

### 🧹 1. Data Cleaning
- Handled missing values (Age, Embarked), dropped Cabin.
- Encoded categorical columns (Sex, Embarked).

### 🧠 2. Feature Engineering
- *FamilySize* = SibSp + Parch + 1 to represent group travel.
- *AgeLevel* = Binned age into groups like Child, Teen, Adult, Senior.
- *FareLevel* = Divided fare into ranges (e.g., Low, Medium,mid_range, High)

### 📊 3. EDA
- Analyzed survival by gender, class, age level, fare level, and family size.
- Used visualizations (bar charts, heatmaps, etc.) to identify patterns and outliers.

### 🧮 4. SQL Insights
- Queried survival by demographics and travel type.
- Filtered and grouped passengers for quick insights.

### 📈 5. Power BI Dashboard
- Built interactive pages showing survival stats by class, age, gender, and fare.
- Used slicers and drill-through to connect visuals across slides.

### 🤖 6. Machine Learning
- Trained RandomForestClassifier with GridSearchCV tuning.
- Evaluated using accuracy, precision, recall, and confusion matrix.
- Enabled prediction for new passenger input.

## 🛠 Tools Used
- *Python*: pandas, seaborn, scikit-learn, matplotlib
- *SQL*
- *Power BI*
- *Jupyter Notebook*

## 📌 Dataset
- [Titanic Dataset – Kaggle](https://www.kaggle.com/competitions/titanic/data)

## ✅ Outcome
- Complete analysis pipeline combining SQL, ML, and BI tools.
- Clear visual and predictive insights into Titanic survival patterns.
