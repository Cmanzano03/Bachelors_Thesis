import os
import pandas as pd

# Path where the .parquet files are located
parquet_folder = "/home/carlos/Documentos/TFG/spark-workspace/data/raw"

# Iterate over the files in the directory
for file_name in os.listdir(parquet_folder):
    if file_name.endswith(".parquet"):
        path = os.path.join(parquet_folder, file_name)
        print(f"\n📂 File: {file_name}")

        try:
            df = pd.read_parquet(path)
            print("📊 Schema:")
            print(df.dtypes)
            print("\n🔍 First 5 rows:")
            print(df.head())
        except Exception as e:
            print(f"❌ Error reading {file_name}: {e}")
