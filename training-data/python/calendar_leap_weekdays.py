import calendar
from datetime import date

print(calendar.isleap(2024), calendar.isleap(1900), calendar.leapdays(2000, 2025))
print(calendar.monthrange(2024, 2))  # (weekday of 1st, days in month)
print(calendar.month_name[3], calendar.day_abbr[0])
print(calendar.weekday(2025, 1, 1))


def count_weekday(year, month, weekday):
    first, ndays = calendar.monthrange(year, month)
    return sum(1 for d in range(1, ndays + 1) if date(year, month, d).weekday() == weekday)


print(count_weekday(2024, 9, calendar.MONDAY))
print(calendar.month(2024, 2))
