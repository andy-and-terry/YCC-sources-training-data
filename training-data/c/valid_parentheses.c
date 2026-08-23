#include <stdio.h>
#include <string.h>

int is_valid(const char *s) {
    char stack[100];
    int top = -1;
    for (int i = 0; s[i]; i++) {
        char ch = s[i];
        if (ch == '(' || ch == '[' || ch == '{') {
            stack[++top] = ch;
        } else {
            if (top < 0) return 0;
            char open = stack[top--];
            if ((ch == ')' && open != '(') ||
                (ch == ']' && open != '[') ||
                (ch == '}' && open != '{')) {
                return 0;
            }
        }
    }
    return top == -1;
}

int main(void) {
    printf("%d\n", is_valid("({[]})"));
    printf("%d\n", is_valid("(]"));
    return 0;
}
