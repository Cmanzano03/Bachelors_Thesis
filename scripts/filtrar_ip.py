from pyspark.sql import SparkSession
from pyspark.sql.functions import col
import os

# Configuración
curso_ip = 8683
ruta_origen = "/home/carlos/Documentos/TFG/spark-workspace/data/raw"
ruta_destino = "/home/carlos/Documentos/TFG/spark-workspace/data/raw/ip"
os.makedirs(ruta_destino, exist_ok=True)

# Crear sesión Spark
spark = SparkSession.builder \
    .appName("Filtrado datos curso IP") \
    .master("local[*]") \
    .config("spark.sql.shuffle.partitions", "8") \
    .getOrCreate()

# 1. Filtrar assign_submission_cmi
assign = spark.read.parquet(f"{ruta_origen}/assign_cmi.parquet")
submissions = spark.read.parquet(f"{ruta_origen}/assign_submission_cmi.parquet")

assign_ip = assign.filter(col("course") == curso_ip).select("id", "duedate", "allowsubmissionsfromdate", "name")
submissions_ip = submissions.join(assign_ip, submissions.assignment == assign_ip.id, "inner")
if not os.path.exists(f"{ruta_destino}/assign_submission_cmi.parquet"):
    submissions_ip.write.mode("overwrite").parquet(f"{ruta_destino}/assign_submission_cmi.parquet")
    print("✅ assign_submission_cmi.parquet creado")

# 2. Filtrar assign_grades_cmi
grades = spark.read.parquet(f"{ruta_origen}/assign_grades_cmi.parquet")
grades_ip = grades.join(assign_ip, grades.assignment == assign_ip.id, "inner")
if not os.path.exists(f"{ruta_destino}/assign_grades_cmi.parquet"):
    grades_ip.write.mode("overwrite").parquet(f"{ruta_destino}/assign_grades_cmi.parquet")
    print("✅ assign_grades_cmi.parquet creado")

# 3. Filtrar forum_posts_cmi y forum_discussions_cmi
forum = spark.read.parquet(f"{ruta_origen}/forum_cmi.parquet")
discussions = spark.read.parquet(f"{ruta_origen}/forum_discussions_cmi.parquet")
posts = spark.read.parquet(f"{ruta_origen}/forum_posts_cmi.parquet")

forum_ip = forum.filter(col("course") == curso_ip)
discussions_ip = discussions.join(forum_ip, discussions.forum == forum_ip.id, "inner")
posts_ip = posts.join(discussions_ip, posts.discussion == discussions_ip.id, "inner")

if not os.path.exists(f"{ruta_destino}/forum_discussions_cmi.parquet"):
    discussions_ip.write.mode("overwrite").parquet(f"{ruta_destino}/forum_discussions_cmi.parquet")
    print("✅ forum_discussions_cmi.parquet creado")

if not os.path.exists(f"{ruta_destino}/forum_posts_cmi.parquet"):
    posts_ip.write.mode("overwrite").parquet(f"{ruta_destino}/forum_posts_cmi.parquet")
    print("✅ forum_posts_cmi.parquet creado")

# 4. Filtrar quiz_attempts_cmi
quiz = spark.read.parquet(f"{ruta_origen}/quiz_cmi.parquet")
attempts = spark.read.parquet(f"{ruta_origen}/quiz_attempts_cmi.parquet")

quiz_ip = quiz.filter(col("course") == curso_ip)
attempts_ip = attempts.join(quiz_ip, attempts.quiz == quiz_ip.id, "inner")
if not os.path.exists(f"{ruta_destino}/quiz_attempts_cmi.parquet"):
    attempts_ip.write.mode("overwrite").parquet(f"{ruta_destino}/quiz_attempts_cmi.parquet")
    print("✅ quiz_attempts_cmi.parquet creado")

print("🚀 Filtrado completado.")
