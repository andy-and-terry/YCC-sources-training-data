delegate int Op (int a, int b);

void main () {
    Op add = (a, b) => a + b;
    int k = 10;
    Op addk = (a, b) => a + b + k;
    print ("%d %d\n", add (1, 2), addk (1, 2));
}
