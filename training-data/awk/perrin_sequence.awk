# Perrin sequence P(n)=P(n-2)+P(n-3)
BEGIN {
    v[0] = 3; v[1] = 0; v[2] = 2
    for (i = 3; i < 10; i++) v[i] = v[i - 2] + v[i - 3]
    for (i = 0; i < 10; i++) printf "%d ", v[i]
    printf "\n"
}
