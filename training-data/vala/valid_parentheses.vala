bool is_valid(string s) {
    var stack = new Gee.ArrayList<unichar>();
    for (int i = 0; i < s.length; i++) {
        unichar c = s[i];
        if (c == '(' || c == '[' || c == '{') {
            stack.add(c);
        } else if (c == ')' || c == ']' || c == '}') {
            if (stack.size == 0) return false;
            unichar top = stack.remove_at(stack.size - 1);
            if ((c == ')' && top != '(') ||
                (c == ']' && top != '[') ||
                (c == '}' && top != '{')) {
                return false;
            }
        }
    }
    return stack.size == 0;
}

void main() {
    stdout.printf("%s\n", is_valid("{[()]}").to_string());
    stdout.printf("%s\n", is_valid("{[(])}").to_string());
}
