import pandas as pd
import os
SOURCE_PATH = "/home/carlos/Documentos/TFG/spark-workspace/data/datasets"
OUT_PATH = "/home/carlos/Documentos/TFG/spark-workspace/data/datasets/csv"

if not os.path.exists(OUT_PATH):
      os.makedirs(OUT_PATH)

for file_name in os.listdir(SOURCE_PATH):
      if file_name.endswith(".parquet"):
            parquet_file = os.path.join(SOURCE_PATH, file_name)
            csv_file = os.path.join(OUT_PATH, file_name.replace(".parquet", ".csv"))
            
            df = pd.read_parquet(parquet_file)
            df.to_csv(csv_file, index=False)