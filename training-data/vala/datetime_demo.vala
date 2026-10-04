void main () {
    var start = new DateTime.utc (2024, 2, 28, 12, 0, 0);
    print ("%s\n", start.format ("%Y-%m-%d %H:%M"));

    var later = start.add_days (2);
    print ("%s\n", later.format ("%Y-%m-%d"));
    print ("day of week: %d\n", later.get_day_of_week ());
    print ("day of year: %d\n", later.get_day_of_year ());

    var plus = start.add_hours (36).add_minutes (30);
    print ("%s\n", plus.format ("%F %T"));

    TimeSpan diff = plus.difference (start);
    print ("diff hours: %.1f\n", diff / (double) TimeSpan.HOUR);

    print ("compare: %d\n", start.compare (later));
    print ("unix: %" + int64.FORMAT + "\n", start.to_unix ());
}
