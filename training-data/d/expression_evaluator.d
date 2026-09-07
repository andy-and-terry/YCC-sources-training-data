import std.stdio;
import std.ascii : isDigit;

int precedence(char op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
}

int applyOp(int a, int b, char op) {
    switch (op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
        default: return 0;
    }
}

int evaluate(string expr) {
    int[] values;
    char[] ops;
    size_t i = 0;

    while (i < expr.length) {
        char c = expr[i];
        if (c == ' ') {
            i++;
        } else if (isDigit(c)) {
            int num = 0;
            while (i < expr.length && isDigit(expr[i])) {
                num = num * 10 + (expr[i] - '0');
                i++;
            }
            values ~= num;
        } else if (c == '(') {
            ops ~= c;
            i++;
        } else if (c == ')') {
            while (ops.length > 0 && ops[$ - 1] != '(') {
                int b = values[$ - 1]; values = values[0 .. $ - 1];
                int a = values[$ - 1]; values = values[0 .. $ - 1];
                char op = ops[$ - 1]; ops = ops[0 .. $ - 1];
                values ~= applyOp(a, b, op);
            }
            ops = ops[0 .. $ - 1];
            i++;
        } else {
            while (ops.length > 0 && precedence(ops[$ - 1]) >= precedence(c)) {
                int b = values[$ - 1]; values = values[0 .. $ - 1];
                int a = values[$ - 1]; values = values[0 .. $ - 1];
                char op = ops[$ - 1]; ops = ops[0 .. $ - 1];
                values ~= applyOp(a, b, op);
            }
            ops ~= c;
            i++;
        }
    }

    while (ops.length > 0) {
        int b = values[$ - 1]; values = values[0 .. $ - 1];
        int a = values[$ - 1]; values = values[0 .. $ - 1];
        char op = ops[$ - 1]; ops = ops[0 .. $ - 1];
        values ~= applyOp(a, b, op);
    }

    return values[0];
}

void main() {
    writeln(evaluate("3 + 4 * 2"));
    writeln(evaluate("(1 + 2) * (3 + 4)"));
}
