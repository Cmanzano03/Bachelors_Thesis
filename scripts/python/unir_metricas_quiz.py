from pathlib import Path
from pyspark.sql import SparkSession
from functools import reduce
import shutil

# Crear sesión de Spark
spark = SparkSession.builder.appName("UnirMétricas").getOrCreate()

# Ruta de entrada
ruta_metricas = Path("/home/carlos/Documentos/TFG/spark-workspace/data/metrics/quiz")
ruta_temporal = "/home/carlos/Documentos/TFG/spark-workspace/data/temporal"
ruta_final_csv = "/home/carlos/Documentos/TFG/spark-workspace/data/datasets/metricas_quiz.csv"

# Cargar todos los DataFrames parquet
dfs = {}
for fichero in ruta_metricas.glob("*.parquet"):
    nombre = fichero.stem
    df = spark.read.parquet(str(fichero))
    dfs[nombre] = df

# Unirlos por 'userid'
df_unificado = reduce(lambda df1, df2: df1.join(df2, on="userid", how="outer"), dfs.values())
df_unificado = df_unificado.fillna(0)

# Guardar como CSV con nombre fijo
df_unificado.coalesce(1).write.option("header", True).csv(ruta_temporal, mode="overwrite")

# Buscar y renombrar el fichero generado
archivo_generado = list(Path(ruta_temporal).glob("part-*.csv"))[0]
shutil.copy(archivo_generado, ruta_final_csv)

# Limpiar la carpeta temporal
shutil.rmtree(ruta_temporal)

print(f"✅ Métricas unificadas guardadas como CSV en: {ruta_final_csv}")