enum Level { LOW, HIGH
    public string label () { switch (this) { case LOW: return "low"; default: return "high"; } }
}
void main () { print ("%s\n", Level.HIGH.label ()); }
