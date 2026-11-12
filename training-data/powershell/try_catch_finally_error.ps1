try {
    1 / 0
} catch [System.DivideByZeroException] {
    "div zero"
} finally {
    "cleanup"
}
