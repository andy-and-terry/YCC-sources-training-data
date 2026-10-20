from datetime import datetime
from zoneinfo import ZoneInfo


def convert(moment, zone_name):
    return moment.astimezone(ZoneInfo(zone_name))


if __name__ == "__main__":
    utc_noon = datetime(2024, 7, 1, 12, 0, tzinfo=ZoneInfo("UTC"))
    for name in ("America/New_York", "Europe/Berlin", "Asia/Kolkata", "Australia/Sydney"):
        print(f"{name:20} {convert(utc_noon, name):%Y-%m-%d %H:%M %Z%z}")
    # Daylight-saving boundary: 02:30 does not exist on this spring-forward day.
    gap = datetime(2024, 3, 10, 2, 30, tzinfo=ZoneInfo("America/New_York"))
    print(gap.utcoffset())
