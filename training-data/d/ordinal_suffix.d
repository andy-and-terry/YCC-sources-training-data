import std.stdio;
import std.format : format;

string ordinal(int n) {
    int r100 = n % 100;
    string suffix = (r100 >= 11 && r100 <= 13) ? "th" : "th";
    if (!(r100 >= 11 && r100 <= 13)) {
        switch (n % 10) {
            case 1: suffix = "st"; break;
            case 2: suffix = "nd"; break;
            case 3: suffix = "rd"; break;
            default: break;
        }
    }
    return format("%d%s", n, suffix);
}

void main() {
    foreach (n; [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]) write(ordinal(n), " ");
    writeln();
}
