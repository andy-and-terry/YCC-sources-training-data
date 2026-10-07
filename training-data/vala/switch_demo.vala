string describe_number (int n) {
    switch (n) {
    case 0:
        return "zero";
    case 1:
    case 2:
    case 3:
        return "small";
    default:
        if (n < 0) {
            return "negative";
        }
        return "large";
    }
}

string weekday_kind (string day) {
    switch (day) {
    case "sat":
    case "sun":
        return "weekend";
    case "mon":
    case "tue":
    case "wed":
    case "thu":
    case "fri":
        return "weekday";
    default:
        return "unknown";
    }
}

void main () {
    foreach (int n in new int[] { 0, 2, 50, -4 }) {
        print ("%d: %s\n", n, describe_number (n));
    }
    foreach (string d in new string[] { "sat", "wed", "xyz" }) {
        print ("%s: %s\n", d, weekday_kind (d));
    }
}
