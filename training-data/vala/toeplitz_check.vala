bool is_toeplitz (int[,] m) {
    for (int i = 1; i < m.length[0]; i++)
        for (int j = 1; j < m.length[1]; j++)
            if (m[i, j] != m[i - 1, j - 1]) return false;
    return true;
}

void main () {
    int[,] a = { {1, 2, 3}, {4, 1, 2}, {5, 4, 1} };
    int[,] b = { {1, 2}, {2, 2} };
    print ("%s %s\n", is_toeplitz (a).to_string (), is_toeplitz (b).to_string ());
}
