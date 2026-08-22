enum ValidationError: Error {
    case tooShort
    case invalidCharacters
}

func validate(_ username: String) -> Result<String, ValidationError> {
    if username.count < 3 { return .failure(.tooShort) }
    if !username.allSatisfy({ $0.isLetter || $0.isNumber }) {
        return .failure(.invalidCharacters)
    }
    return .success(username)
}

for name in ["ab", "valid123", "bad name"] {
    switch validate(name) {
    case .success(let v): print("valid: \(v)")
    case .failure(let e): print("invalid: \(name) -> \(e)")
    }
}
