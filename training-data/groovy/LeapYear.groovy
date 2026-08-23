def isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

println isLeapYear(2000)
println isLeapYear(1900)
println isLeapYear(2024)
