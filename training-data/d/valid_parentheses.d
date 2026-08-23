import std.stdio;

bool isValid(string s) {
    char[] stack;
    foreach (ch; s) {
        if (ch == '(' || ch == '[' || ch == '{') {
            stack ~= ch;
        } else {
            if (stack.length == 0) return false;
            char open = stack[$ - 1];
            stack = stack[0 .. $ - 1];
            if ((ch == ')' && open != '(') ||
                (ch == ']' && open != '[') ||
                (ch == '}' && open != '{')) {
                return false;
            }
        }
    }
    return stack.length == 0;
}

void main() {
    writeln(isValid("({[]})"));
    writeln(isValid("(]"));
}
