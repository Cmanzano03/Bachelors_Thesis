def max_dias_sin_entregar(entregas):
    """
    Calcula el máximo número de días consecutivos sin entregar un cuestionario.
    :param entregas: Lista de Rows con month_submit (str) y day_submit (int)
    :return: int
    """
    dias_mes = {
      "01": 31, "02": 28, "03": 31, "04": 30,
      "05": 31, "06": 30, "07": 31, "08": 31,
      "09": 30, "10": 31, "11": 30, "12": 31,
    }



    if len(entregas) < 2:
        return 0

    # Ordenamos usando atributos
    entregas = sorted(entregas, key=lambda x: (x.month_submit, x.day_submit))

    max_dias = 0

    for i in range(len(entregas) - 1):
        mes1 = entregas[i].month_submit
        dia1 = entregas[i].day_submit
        mes2 = entregas[i + 1].month_submit
        dia2 = entregas[i + 1].day_submit

        if mes1 == mes2:
            diff = dia2 - dia1
        else:
            diff = (dias_mes[mes1] - dia1) + dia2

        if diff > max_dias:
            max_dias = diff

    return max_dias - 1
