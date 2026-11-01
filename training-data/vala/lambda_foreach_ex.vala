delegate int BinOp (int a, int b);

void main () {
    BinOp add = (a, b) => a + b;
    BinOp mul = (a, b) => a * b;
    print ("%d %d\n", add (2, 3), mul (2, 3));
    int[] arr = { 3, 1, 2 };
    foreach (int x in arr) print ("%d ", x);
    print ("\n");
}
