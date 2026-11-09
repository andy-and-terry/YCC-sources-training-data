func run() {
    defer { print("first defer") }
    defer { print("second defer") }
    print("body")
}
run()
