import std.stdio;
import std.algorithm : equal, retro;

bool isPalindrome(string s) {
    return equal(s, s.retro);
}

void main() {
    writeln(isPalindrome("racecar"));
    writeln(isPalindrome("hello"));
}
