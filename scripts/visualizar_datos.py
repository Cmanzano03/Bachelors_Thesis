import os
import pandas as pd

# Ruta donde están los ficheros .parquet
carpeta_parquet = "/home/carlos/Documentos/TFG/spark-workspace/data/raw"

# Recorrer los archivos del directorio
for nombre_archivo in os.listdir(carpeta_parquet):
    if nombre_archivo.endswith(".parquet"):
        ruta = os.path.join(carpeta_parquet, nombre_archivo)
        print(f"\n📂 Archivo: {nombre_archivo}")

        try:
            df = pd.read_parquet(ruta)
            print("📊 Esquema:")
            print(df.dtypes)
            print("\n🔍 Primeras 5 filas:")
            print(df.head())
        except Exception as e:
            print(f"❌ Error leyendo {nombre_archivo}: {e}")
