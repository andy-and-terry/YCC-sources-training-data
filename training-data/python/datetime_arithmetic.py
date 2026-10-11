from datetime import date, datetime, timedelta, timezone

d = date(2024, 2, 28)
print(d + timedelta(days=2), d.weekday(), d.isoformat())
print(date(2024, 12, 25) - date(2024, 1, 1))

dt = datetime(2024, 3, 10, 14, 30, 5)
print(dt.strftime("%Y/%m/%d %H:%M"), dt.isoformat())
print(dt + timedelta(hours=12, minutes=45))
print(datetime.strptime("2023-07-04 09:15", "%Y-%m-%d %H:%M"))

utc = datetime(2024, 1, 1, 12, tzinfo=timezone.utc)
est = utc.astimezone(timezone(timedelta(hours=-5)))
print(utc, est, utc == est)
print(timedelta(days=1, seconds=3600).total_seconds())
print(date.fromisoformat("2024-02-29").replace(year=2025, day=28))
