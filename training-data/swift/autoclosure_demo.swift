func assertTrue(_ condition: @autoclosure () -> Bool, message: String) {
    if !condition() {
        print("assertion failed: \(message)")
    } else {
        print("ok: \(message)")
    }
}

func expensive() -> Bool {
    print("evaluating expensive check")
    return true
}

func logIfDebug(_ message: @autoclosure () -> String, debug: Bool) {
    if debug { print(message()) }
}

assertTrue(2 + 2 == 4, message: "arithmetic")
assertTrue(expensive(), message: "expensive")
logIfDebug("hidden", debug: false)
logIfDebug("shown", debug: true)
