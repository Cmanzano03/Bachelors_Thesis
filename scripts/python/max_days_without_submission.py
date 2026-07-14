def max_days_without_submission(submissions):
    """
    Calculates the maximum number of consecutive days without submitting a quiz.
    :param submissions: List of Rows with month_submit (str) and day_submit (int)
    :return: int
    """
    days_in_month = {
      "01": 31, "02": 28, "03": 31, "04": 30,
      "05": 31, "06": 30, "07": 31, "08": 31,
      "09": 30, "10": 31, "11": 30, "12": 31,
    }



    if len(submissions) < 2:
        return 0

    # Sort using attributes
    submissions = sorted(submissions, key=lambda x: (x.month_submit, x.day_submit))

    max_days = 0

    for i in range(len(submissions) - 1):
        month1 = submissions[i].month_submit
        day1 = submissions[i].day_submit
        month2 = submissions[i + 1].month_submit
        day2 = submissions[i + 1].day_submit

        if month1 == month2:
            diff = day2 - day1
        else:
            diff = (days_in_month[month1] - day1) + day2

        if diff > max_days:
            max_days = diff

    return max_days - 1
