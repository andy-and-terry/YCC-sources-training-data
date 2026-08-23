import std.stdio;

bool isLeap(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

void main() {
    foreach (year; [2000, 1900, 2024, 2023]) {
        writeln(year, ": ", isLeap(year));
    }
}
