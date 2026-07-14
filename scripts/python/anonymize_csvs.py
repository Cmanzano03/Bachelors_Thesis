import os
import pandas as pd
import hashlib

# SHA-256 hash function to anonymize the userid
def hash_userid(uid):
    return hashlib.sha256(str(uid).encode('utf-8')).hexdigest()

# Input and output paths
csv_folder = "/home/cmanzanoo/Documentos/Ficheros_csv"
parquet_folder = "/home/cmanzanoo/Documentos/ficheros_parquet_an"

# Create output folder if it does not exist
os.makedirs(parquet_folder, exist_ok=True)

# Iterate over all CSVs in the folder
for file_name in os.listdir(csv_folder):
    if file_name.endswith(".csv"):
        base_name = os.path.splitext(file_name)[0]
        input_path = os.path.join(csv_folder, file_name)
        output_path = os.path.join(parquet_folder, f"{base_name}.parquet")

        if os.path.exists(output_path):
            print(f"  Already exists: {base_name}.parquet, skipping...\n")
            continue

        print(f" Processing: {file_name}")

        try:
            df = pd.read_csv(
                input_path,
                sep=",",
                quotechar='"',
                escapechar="\\",
                engine="python"
            )

            if "userid" in df.columns:
                print(" Applying hash to 'userid'")
                df["userid"] = df["userid"].apply(hash_userid)

            df.to_parquet(output_path, index=False)
            print(f" Saved as: {output_path}\n")

        except Exception as e:
            print(f" Error processing {file_name}: {e}\n")
