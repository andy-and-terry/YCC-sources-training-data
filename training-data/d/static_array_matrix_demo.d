import std.stdio;

alias Matrix = double[3][3];

Matrix mul(const Matrix a, const Matrix b)
{
    Matrix c;
    foreach (i; 0 .. 3)
        foreach (j; 0 .. 3)
        {
            c[i][j] = 0;
            foreach (k; 0 .. 3)
                c[i][j] += a[i][k] * b[k][j];
        }
    return c;
}

void main()
{
    Matrix id = [[1, 0, 0], [0, 1, 0], [0, 0, 1]];
    Matrix m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    auto r = mul(m, id);
    writeln(r == m);              // static arrays compare by value
    Matrix copy = m;              // and are copied by value
    copy[0][0] = 100;
    writeln(m[0][0], " ", copy[0][0]);
    writeln(m.sizeof);
}
