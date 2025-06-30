# Moodle Data Science - Data Processing Pipeline

This repository contains code and notebooks developed for the processing and analysis of educational data extracted from Moodle. The main goal is to build a transformation and aggregation workflow to enable early prediction of student dropout in university courses.

## 🛠️ Technologies

- Python 3.10
    
- PySpark
    
- Pandas
    
- PyArrow
    
- Matplotlib / Seaborn
    
- Jupyter Notebooks
    
- Git + GitHub
    
- Visual Studio Code
    

## 📆 Project Structure

```
.
├── notebooks/               # Interactive notebooks for metric computation and exploration
├── scripts/                 # Python scripts for batch processing
├── README.md                # Project documentation
├── requirements.txt         # Python environment dependencies
```


## ⚙️ Environment Setup

```
# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Register Jupyter kernel
python -m ipykernel install --user --name pyspark-env --display-name "Spark + Pandas"
```

## 🚀 Usage

- Use Jupyter Notebook or Visual Studio Code to interact with `.ipynb` notebooks.
    
- Execute Python scripts from the `scripts/` directory to perform batch transformations and generate metrics.
    
- Intermediate and final results are stored as Parquet files for efficient access and analysis.
    

## 🧠 Objective

To develop a robust data pipeline that extracts interaction patterns from Moodle logs and activity data, enabling early detection of students at risk of course dropout. This will support proactive intervention and personalized feedback from instructors.

---

> Developed as part of a Bachelor's Thesis (TFG) on educational data mining and learning analytics.
