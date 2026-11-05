enum Level {
    LOW, MID, HIGH;
    public string label () {
        switch (this) {
            case LOW: return "low";
            case MID: return "mid";
            default: return "high";
        }
    }
}

void main () {
    print ("%s %s\n", Level.LOW.label (), Level.HIGH.label ());
}
