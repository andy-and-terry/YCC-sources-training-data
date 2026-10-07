enum Season {
    SPRING,
    SUMMER,
    AUTUMN,
    WINTER;

    public string to_display_string() {
        switch (this) {
            case SPRING: return "Spring";
            case SUMMER: return "Summer";
            case AUTUMN: return "Autumn";
            default: return "Winter";
        }
    }
}

void main() {
    var season = Season.AUTUMN;
    stdout.printf("%s\n", season.to_display_string());

    for (int i = 0; i <= Season.WINTER; i++) {
        Season s = (Season) i;
        stdout.printf("%d -> %s\n", i, s.to_display_string());
    }
}
