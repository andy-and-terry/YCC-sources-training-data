import calendar


if __name__ == "__main__":
    print(calendar.month(2024, 2))
    print(calendar.isleap(2100), calendar.leapdays(2000, 2025))
    print(calendar.monthrange(2024, 2))  # (weekday of 1st, days in month)
    weeks = calendar.Calendar(firstweekday=0).monthdayscalendar(2024, 3)
    print(weeks[0], weeks[-1])
    print(calendar.day_name[calendar.weekday(2024, 12, 25)])
