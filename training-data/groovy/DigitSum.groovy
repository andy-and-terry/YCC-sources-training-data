def digitSum(int n) {
    int sum = 0
    int num = n
    while (num > 0) {
        sum += num % 10
        num /= 10
    }
    return sum
}

println digitSum(12345)
