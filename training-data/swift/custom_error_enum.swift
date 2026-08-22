enum NetworkError: Error, CustomStringConvertible {
    case timeout
    case notFound(path: String)
    case serverError(code: Int)

    var description: String {
        switch self {
        case .timeout: return "request timed out"
        case .notFound(let path): return "not found: \(path)"
        case .serverError(let code): return "server error \(code)"
        }
    }
}

func fetch(path: String) throws -> String {
    if path == "/missing" { throw NetworkError.notFound(path: path) }
    return "data"
}

do {
    print(try fetch(path: "/missing"))
} catch let error as NetworkError {
    print("error: \(error.description)")
} catch {
    print("unknown error")
}
