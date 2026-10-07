void main() {
    var dt = new DateTime.utc(2024, 2, 28, 13, 45, 30);
    stdout.printf("%s\n", dt.format("%Y-%m-%d %H:%M:%S"));

    var next = dt.add_days(2);
    stdout.printf("+2 days: %s\n", next.format("%Y-%m-%d (%A)"));
    stdout.printf("day of year: %d\n", next.get_day_of_year());

    var later = dt.add_hours(12).add_minutes(30);
    stdout.printf("later: %s\n", later.format("%H:%M"));

    TimeSpan diff = next.difference(dt);
    stdout.printf("diff hours: %d\n", (int) (diff / TimeSpan.HOUR));
    stdout.printf("leap year days in Feb: %d\n", Date.get_days_in_month(DateMonth.FEBRUARY, 2024));
}
