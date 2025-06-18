import os
import pandas as pd
import hashlib

# Función hash SHA-256 para anonimizar el userid
def hash_userid(uid):
    return hashlib.sha256(str(uid).encode('utf-8')).hexdigest()

# Rutas de entrada y salida
carpeta_csv = "/home/cmanzanoo/Documentos/Ficheros_csv"
carpeta_parquet = "/home/cmanzanoo/Documentos/ficheros_parquet_an"

# Crear carpeta de salida si no existe
os.makedirs(carpeta_parquet, exist_ok=True)

# Recorrer todos los CSV en la carpeta
for nombre_archivo in os.listdir(carpeta_csv):
    if nombre_archivo.endswith(".csv"):
        nombre_base = os.path.splitext(nombre_archivo)[0]
        ruta_entrada = os.path.join(carpeta_csv, nombre_archivo)
        ruta_salida = os.path.join(carpeta_parquet, f"{nombre_base}.parquet")

        if os.path.exists(ruta_salida):
            print(f"  Ya existe: {nombre_base}.parquet, saltando...\n")
            continue

        print(f" Procesando: {nombre_archivo}")

        try:
            df = pd.read_csv(
                ruta_entrada,
                sep=",",
                quotechar='"',
                escapechar="\\",
                engine="python"
            )

            if "userid" in df.columns:
                print(" Aplicando hash a 'userid'")
                df["userid"] = df["userid"].apply(hash_userid)

            df.to_parquet(ruta_salida, index=False)
            print(f" Guardado como: {ruta_salida}\n")

        except Exception as e:
            print(f" Error procesando {nombre_archivo}: {e}\n")
