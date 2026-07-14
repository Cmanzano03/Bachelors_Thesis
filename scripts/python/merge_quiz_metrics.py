from pathlib import Path
from pyspark.sql import SparkSession
from functools import reduce
import shutil

# Create Spark session
spark = SparkSession.builder.appName("UnirMétricas").getOrCreate()

# Input path
metrics_path = Path("/home/carlos/Documentos/TFG/spark-workspace/data/metrics/quiz")
temp_path = "/home/carlos/Documentos/TFG/spark-workspace/data/temporal"
final_csv_path = "/home/carlos/Documentos/TFG/spark-workspace/data/datasets/metricas_quiz.csv"

# Load all parquet DataFrames
dfs = {}
for file in metrics_path.glob("*.parquet"):
    name = file.stem
    df = spark.read.parquet(str(file))
    dfs[name] = df

# Join them by 'userid'
df_unified = reduce(lambda df1, df2: df1.join(df2, on="userid", how="outer"), dfs.values())
df_unified = df_unified.fillna(0)

# Save as CSV with a fixed name
df_unified.coalesce(1).write.option("header", True).csv(temp_path, mode="overwrite")

# Find and rename the generated file
generated_file = list(Path(temp_path).glob("part-*.csv"))[0]
shutil.copy(generated_file, final_csv_path)

# Clean up the temporary folder
shutil.rmtree(temp_path)

print(f"✅ Unified metrics saved as CSV at: {final_csv_path}")