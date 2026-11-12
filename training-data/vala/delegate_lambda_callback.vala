delegate int BinOp (int a, int b);
int apply (BinOp f, int a, int b) { return f (a, b); }
void main () { print ("%d\n", apply ((a, b) => a * b, 6, 7)); }
