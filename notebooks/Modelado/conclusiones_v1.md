# Conclusiones obtenidas del primer modelado

Tras analizar el rendimiento de los modelos y su funcionamiento interno en estas tres versiones sobre este conjunto de datos, podemos extraer las siguientes conclusiones:

- En la primera versión, en la cual incluiamos todas las features, el mejor rendimiento nos lo dio XGboost, probablemente debido a que es el que mejor capacidad ha tenido para obtener relaciones complejas entre una gran cantidad de features con los pocos datos que tenemos y manejar mejor el ruido generado por esta saturación, algo que por ejemplo, le cuesta mucho más a la regresión logística. 
- En la segunda versión, en la que solo nos quedamos con un dataset que tiene información de qué actividades de evaluación continua entregó el alumno y el numero total de entregas,  con diferencia el estimador que mejor ha funcionado ha sido la regresión logística, debido a que tras reducir la cantidad de features, ha conseguido incluso con tan pocos datos, debido a la relación lineal que existe entre las features elegidas y el abandono del alumno. Ha sido el modelo que mejor rendimiento ha dado de las tres versiones, aportando con un umbral de 0.6 el mejor f1-score de 0.651. 
- En la tercera versión, en la que solo nos quedamos con las calificaciones obtenidas en cada actividad de evaluación continua de cada alumno, podemos ver cómo , si bien la regresión logística sigue dando el mejor rendimiento, es mucho peor que el de la segunda versión, dado que si bien el recall se ha mantenido mas o menos igual, la precisión ha descendido en picado. Probablemente se deba a que no es capaz de capturar una relacion lineal tan clara entre las notas obtenidas y el abandono del usuario para una cantidad tan pequeña de datos. 
- La red neuronal y el árbol de decisión, han sido con diferencia los peores modelos en todas las versiones.El árbol de decisión probablmente haya sobreajustado los datos al haber tan pocas instancias en el dataset, y la red neuronal no da buen rendimiento con un conjunto de datos tan pequeño. Además, parece que al habrer una relación lineal entre los datos recopilados y el abandono del estudiante, el modelo que mejor capacidad tiene para detectar este patrón debido a su naturaleza es LR, siendo la red neuronal y el decission tree mejores en otro tipo de escenarios con datos que siguen otro tipo de patrones. 

## Patrones obtenidos tras examinar los coeficientes empleados en la LR

Se puede apreciar claramente, y como era de esperar tras haber explorado los datos en el EDA, que aquellas columnas que han tenido un mayor peso en la detección del abandono en el entrenamiento de la regresión logística  en la segunda versión han sido las actividades del final del cuatrimestre:

- Actividad 07
- Test de complejidad

Esto evidencia, que el modelo nos muestra que hay una gran correlación entre estas actividades y el abandono, como es normal, dado que muchos alumnos quizás ya han abandonado a esta altura del curso y por lo tanto no entregarían ni estas actividades ni el proyecto después. 

Sin embargo, es muy llamativo, que la actividad 02, elecciones, es la tercera columna a la que se le da un mayor peso. Esto tiene mucho sentido, dado que es la primera entrega de código que se hace en la asignatura. Si un alumno no ha conseguido