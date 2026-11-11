# Narayana's cows N(n)=N(n-1)+N(n-3)
BEGIN {
    v[0] = 1; v[1] = 1; v[2] = 1
    for (i = 3; i < 10; i++) v[i] = v[i - 1] + v[i - 3]
    for (i = 0; i < 10; i++) printf "%d ", v[i]
    printf "\n"
}
