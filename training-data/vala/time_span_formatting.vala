string format_duration (int64 total_seconds) {
    int64 days = total_seconds / 86400;
    int64 hours = (total_seconds % 86400) / 3600;
    int64 minutes = (total_seconds % 3600) / 60;
    int64 seconds = total_seconds % 60;

    var parts = new StringBuilder ();
    if (days > 0) {
        parts.append_printf ("%" + int64.FORMAT + "d ", days);
    }
    if (hours > 0) {
        parts.append_printf ("%" + int64.FORMAT + "h ", hours);
    }
    if (minutes > 0) {
        parts.append_printf ("%" + int64.FORMAT + "m ", minutes);
    }
    parts.append_printf ("%" + int64.FORMAT + "s", seconds);
    return parts.str;
}

void main () {
    stdout.printf ("%s\n", format_duration (45));
    stdout.printf ("%s\n", format_duration (3725));
    stdout.printf ("%s\n", format_duration (90061));
}
